const express =require('express');
const exStatic = require('express-static'); ////读取文件,直接就可以
const bodyParser =   require('body-parser');
const cookieP = require('cookie-parser');
const cookieS = require('cookie-session');
const consolidate = require('consolidate');
const multer = require('multer');
const fs =require('fs');
const pathLib=require('path');
const mysql = require('mysql');
const querystring = require('querystring');


//连接池,接收一堆请求,每次保持几十个连接,与数据库连接的相关信息
const db = mysql.createPool({host:'localhost',user:'root',password:'123456',database:'test'});

//配置服务器
var server = express();

//配置本地端口
server.listen(8080);


//1.解析cookie

server.use(cookieP('asdasdasd'));   //加签名

server.use(bodyParser.urlencoded({extended: false}));
server.use(bodyParser.json());

//2.使用session
var arr=[];

for(var i=0;i<100000;i++){
    arr.push('key_'+Math.random());
}
server.use(cookieS({name:'rx',keys:arr,maxAge:20*60*1000}));   //加秘钥



//3.post数据

// var objfile=server.use(multer({dest:'./www/images/user_img'}).any());    //any(),接收任何数据



//登录

server.get('/login',(req,res)=>{

    db.query(`SELECT * FROM user_table WHERE user_ID='${req.query.user_ID}'`,(err,data)=>{

        if(err){
            console.log(err);
            res.status(500).send('database error').end();
        }else{
           if(data==''){
               res.send({msg:'账号不存在,请注册一个',isok:false});
               res.end();
           }
           else if(data[0].password!=req.query.password){

                res.send({msg:'密码错误',isok:false});
                res.end();
            }
          else{
               db.query(`UPDATE user_table SET count =count+1,lastlogintime='${req.query.lastlogintime}' WHERE user_ID='${req.query.user_ID}'`,(err,data)=>{
                   if(err){
                       console.log(err);
                       res.status(500).send('database error').end();
                   }else{
                       res.send({msg:'登录成功,正在跳转',isok:true});
                       res.end();
                   }
               })

          }

        }

    });
});

//注册
server.post('/reg',(req,res)=>{
    console.log(req.body);
    db.query(`SELECT user_ID FROM user_table WHERE user_ID='${req.body.user_ID}'`,(err,data)=>{
        if(err){
            console.log(err);
            res.status(500).send({msg:'database error'}).end();
        }else{
            if(data==''){
                db.query(`INSERT INTO user_table (user_ID,username,password,regtime) VALUES ('${req.body.user_ID}','${req.body.username}','${req.body.password}','${req.body.regtime}')`,(err,data)=>{

                    if(err){
                        console.log(err);
                        res.status(500).send('database error').end();
                    }else{

                        res.send({msg:'注册成功,请登录',isok:true}).end();

                    }

                })


            }else{

                if (data[0].user_ID==req.body.user_ID){
                    res.send({msg:'账户已存在,请重新输入',isok:false})
                }else{
                    res.send({msg:'迷之错误',isok:false})
                }

            }
        }

    });
});

//获取用户信息
server.post('/user',(req,res)=>{

    db.query(`SELECT * FROM user_table WHERE user_ID='${req.body.user_ID}'`,(err,data)=>{

        if(err){
            console.log(err);
            res.status(500).send('database error').end();
        }else{
            console.log(data[0]);
            res.send({user:data[0]}).end();

        }

    });
})

//获取食物
server.post('/food',(req,res)=>{

    db.query('SELECT * FROM food_table',(err,data)=>{
        if(err){
            res.status(500).send({msg:'请求失败'}).end();
        }else{
            let fooddata = data;
            res.send({fooddata}).end();
        }
    });
});

//提交订单
server.post('/buy',(req,res)=>{

    db.query(`INSERT INTO order_table (user_ID,date,phone,orderFormContent,total_price,name,address,remark,date2) VALUES ('${req.body.user_ID}','${req.body.date}','${req.body.phone}','${req.body.orderFormContent}','${req.body.total_price}','${req.body.name}','${req.body.address}','${req.body.remark}','${req.body.date2}')`,(err,data)=>{

                if(err){
                    console.log(err);
                    res.status(500).send('database error').end();
                }else{
                    db.query(`UPDATE user_table SET paycount =paycount+1,allpay=allpay+${req.body.total_price} WHERE user_ID='${req.body.user_ID}'`,(err,data)=>{           if(err){
                        console.log(err);
                        res.status(500).send('database error').end();
                    }else {

                        var foodarr=[];
                        for(var g of req.body.orderFormContent){
                            foodarr.push(JSON.parse("{"+g.match(/"food_ID":\d+/g)+"}"))
                        }

                        for(var food of foodarr){
                            db.query(`UPDATE food_table SET food_sale =food_sale+1 WHERE food_ID=${food.food_ID}`,(err,data)=> {
                                if(err){
                                    console.log(err);
                                    res.status(500).send('database error').end();
                                }
                            })
                        }
                        res.send({msg: '提交成功', isok: true}).end();

                        }
                    })

                }

            })

});


//用户购买列表
server.post('/buylist',(req,res)=>{


    db.query(`SELECT * FROM order_table WHERE user_ID='${req.body.user_ID}'`,(err,data1)=>{

        if(err){
            console.log(err);
            res.status(500).send('database error').end();
        }else{
            db.query(`SELECT allpay,paycount FROM user_table WHERE user_ID='${req.body.user_ID}'`,(err,data2)=> {
                if(err){
                    console.log(err);
                    res.status(500).send('database error').end();
                }else{
                console.log({msg: '提交成功', list: data1,user:data2});
                res.send({msg: '提交成功', list: data1,user:data2}).end();
                }
            })
        }

    })



});



server.use(exStatic('./www'));


