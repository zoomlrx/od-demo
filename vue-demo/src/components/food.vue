<template>
  <div id="food">
    <mt-header title="美食天地(-_-)" class="bk" fixed>
      <router-link to="/home" slot="left">
        <mt-button icon="back">返回</mt-button>
      </router-link>
      <mt-button icon="more" slot="right"></mt-button>
    </mt-header>
    <div id="foodMenu">
        <ul id="buycar">
            <li v-for="(val,index) in foodArr" class="clear">
                <img :src="val.food_img" alt="#">
                <div class="food-detial">
                    <h3>{{val.food_name}}</h3>
                    <p>售价:{{val.food_price}}元</p>
                    <p>已售:{{val.food_sale}}份</p>
                    <div class="add-content">
                        <button @click="val.buy&&val.buy--;total()">－</button>
                        <input type="text" v-model="val.buy">
                        <button @click="val.buy++;total()">＋</button>
                    </div>
                </div>
            </li>

            <!--<li class="clear">-->
                <!--<img src="../assets/food/1.jpg" alt="">-->
                <!--<div class="food-detial">-->
                    <!--<h2>麻辣小龙</h2>-->
                    <!--<p>售价:15元</p>-->
                    <!--<p>已售:99份</p>-->
                    <!--<div class="add-content">-->
                        <!--<button>－</button>-->
                        <!--<input type="text" value="0">-->
                        <!--<button>＋</button>-->
                    <!--</div>-->
                <!--</div>-->
            <!--</li>-->





        </ul>
        <transition name="orderin" mode="out-in">
            <div :class="{order:orderbuy}" v-show="orderbuy">
                <p class="ordertitle">请输入用餐人信息</p>
                <mt-field label="收餐人" placeholder="请输入姓名" v-model="nameBuy" class="reg-b"></mt-field>
                <mt-field label="联系电话" placeholder="请输入电话" v-model="phoneBuy" class="reg-b"></mt-field>
                <mt-field label="收餐地址" placeholder="请输入收餐地址" v-model="addressBuy" class="reg-b"></mt-field>
                <mt-field class="reg-b" label="备注" placeholder="您想说的" type="textarea" rows="4" v-modal="remark"></mt-field>
                <div class="order-btn">
                    <mt-button type="danger" @click="buy">确认下单</mt-button>
                    <mt-button  @click="orderbuy=!orderbuy">取消下单</mt-button>
                </div>
            </div>
        </transition>
        <div>
            <mt-popup
                    v-model="checkBuy"
                    position="right"
                    popup-transition="popup-fade">
                <div class="tc">
                    <h1>需支付{{buyNow}}元</h1>
                </div>
                <ul id="check" class="clear">
                    <li v-for="(value,index) in buyCar">
                      品名: {{value.food_name}}  数量:{{value.buy}}
                    </li>
                </ul>
                <div class="tc">
                    <mt-button type="danger" @click="orderbuy=!orderbuy;checkBuy=!checkBuy" v-show="!orderbuy">确认下单</mt-button>
                </div>
            </mt-popup>
            <div id="buy" v-show="!orderbuy">
                <span>总共:<span>{{buyNow}}</span>元</span>

                <mt-button type="danger" @click.native="buyYes" >下单</mt-button>

            </div>
        </div>
    </div>
  </div>


</template>
<script>
    import { Toast,Indicator } from 'mint-ui';
    import axios from 'axios'
    export default{
        data(){
          return{
              food:true,
              foodArr:[],
              buyNow:0,
              checkBuy:false,
              orderbuy:false,
              nameBuy:'',
              phoneBuy:'',
              addressBuy:'',
              remark:'',
              orderContent:[]
          }
        },
        mounted(){
            this.getfood()
        },
        computed:{
            buyCar: {
                get () {
                    return this.$store.state.buyCar
                },
                set (value) {
                    this.$store.commit('givBuyCar', value)
                }
            },
            user:{
                get () {
                    return this.$store.state.user
                },
                set (value) {
                    this.$store.commit('getuser', value)
                }
            }
        },
        methods:{
            total(){
                this.buyNow=0;
                for(var i=0;i<=this.foodArr.length-1;i++){
                    this.buyNow+=this.foodArr[i].food_price*this.foodArr[i].buy;
                }
            },
            getfood(){
                axios.post('/food',{food:this.food})
                    .then(function(res){
                        this.foodArr=res.data.fooddata;
                    }
                    .bind(this))
                    .catch(function(err){
                        console.log(err+"出错了");
                })
            },
            buyYes(){
                this.buyCar=[];
                this.orderContent=[];
                for(var i=0;i<=this.foodArr.length-1;i++){
                    if(this.foodArr[i].buy!=0){
                        this.buyCar.push(this.foodArr[i]);
                        this.orderContent.push(JSON.stringify(this.foodArr[i]));
                    }
                }
                this.checkBuy=true;
            },
            buy(){
                if(!(this.nameBuy&&this.phoneBuy&&this.addressBuy)){
                    Toast('为确保我们的工作人员高效工作，该列表的收餐人、收餐电话、收餐地址均不能为空');
                }else{
                    let aa = new Date(),
                        yy=aa.getFullYear(),
                        mm=aa.getMonth()+1,
                        dd=aa.getDate(),
                        hh=aa.getHours(),
                        m=aa.getMinutes(),
                        ss=aa.getSeconds(),
                        gg=yy+'-'+(mm<10?'0'+mm:''+mm)+'-'+(dd<10?'0'+dd:''+dd)+' '+(hh<10?'0'+hh:''+hh)+':'+(m<10?'0'+m:''+m)+':'+(ss<10?'0'+ss:''+ss);

                    axios.post('/buy',{
                        user_ID:this.user.user_ID,
                        date:new Date().getTime(),
                        orderFormContent:this.orderContent,
                        total_price:this.buyNow,
                        name:this.nameBuy,
                        phone:this.phoneBuy,
                        address:this.addressBuy,
                        remark:this.remark,
                        date2:gg
                    })
                        .then(function(res){
                            Toast(res.data.msg);
                            this.$router.push({path:'/shoppingcart'});
                        }
                            .bind(this))
                        .catch(function(err){
                            console.log(err+"出错了");
                        })
                }

            }
        }
    }
</script>
<style scoped>
    #buy span span{
        font-size: 18px;
        font-weight: bold;
        color:red;
    }

    .order-btn{
        margin-top: 10px;
    }
    .orderin-enter-active, .orderin-leave-active {
        transition: 0.1s all ease;
        transform: translateY(-50px);
        opacity: 0.3;


    }
    .orderin-enter, .orderin-leave-to /* .fade-leave-active below version 2.1.8 */ {
        transition: 0.1s transfrom ease;
        transform: translateY(50px);
        opacity: 0.1;
    }

    .ordertitle{
        text-align: center;
        font-size: 20px;
        font-weight: bold;
    }
    .order{
        position:fixed;
        bottom:55px;
        padding: 10px;
        background: #fff;
        border: 2px solid black;
        border-radius: 5px;
        box-shadow: 0 -10px 10px rgba(10,10,10,0.5);
    }
    .tc{
        text-align: center;
    }
    #check li{
        float:left;
        margin:10px;
    }
    #buy{
        position:fixed;
        left:0;
        bottom:55px;
        padding:10px 0;
        width:100%;
        height:40px;
        background:#fff;
        text-align: right;
        box-shadow: 0 -10px 10px rgba(10,10,10,0.5);
        border:2px solid black;
    }

    .food-detial{
        float: left;
        margin-left: 30px;
    }
    .food-detial h2{
        margin-bottom: 10px;
    }
    .add-content{
        margin-top: 10px;
    }
    .clear:after{
        content:"";
        clear:both;
        display:block;
    }
    .add-content button{
        background:#fff;
        line-height: 20px;
        font-size:20px;
        border-radius: 50%;
    }
   .add-content input{
        width: 20px;
       text-indent: 5px;
        border: 2px solid #222;
    }

    .bk{
        background: #222
    }
    #foodMenu #buycar{
        margin-top: 50px;
        padding-bottom: 100px;
    }

    #foodMenu #buycar li{
        margin-bottom:20px;
        padding:10px;
        height:120px;
        background: #fff;
        border: 2px solid #222;
        border-radius: 5px;
        box-shadow: 10px 0 10px rgba(10,10,10,0.5);
    }
    #foodMenu #buycar li img{
        float:left;
        width:100px;
        height:100px;
        border: 2px solid #222;
        border-radius: 5px;
    }
</style>
