
// export const upd=  (state, msg) => {
//   state.msg=msg
// };


import axios from 'axios'


//获取笑话
export const get1=(state)=>{
  let aa = new Date(),
    yy=aa.getFullYear(),
    mm=aa.getMonth()+1,
    dd=aa.getDate(),
    hh=aa.getHours(),
    m=aa.getMinutes(),
    ss=aa.getSeconds(),
    gg=''+yy+(mm<10?'0'+mm:''+mm)+(dd<10?'0'+dd:''+dd)+(hh<10?'0'+hh:''+hh)+(m<10?'0'+m:''+m)+(ss<10?'0'+ss:''+ss);

  axios.get('https://route.showapi.com/341-1?maxResult=20&page=1&showapi_appid=55256&showapi_test_draft=false&showapi_timestamp='+gg+'&showapi_sign=cb15dd046e1e491aa12a214ffd31cf4b')
    .then(function (res) {    //成功

      state.msgArr=res.data.showapi_res_body.contentlist

    }.bind(this)).catch(function (err) { //错误
    console.log(err+"出错了");

  })
};


//获取用户
export const getuser=(state,userID)=>{

  axios.post('/user',{user_ID:userID})
    .then(function (res) {    //成功

      state.user=res.data.user;

    }.bind(this)).catch(function (err) { //错误
    console.log(err+"出错了");

  })
};


export const givBuyCar=(state,msg)=>{
    state.buyCar=msg;
}

export const getReged=(state,value)=>{
    state.reged=value;
}
