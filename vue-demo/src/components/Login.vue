<template>
  <div id="login-body">

    <h1 class="title">灰犀部落</h1>
    <transition name="wordT" mode="out-in">
      <img class="wordman" src="../assets/img/login.png" alt="登录图" v-show="word!=''" >
    </transition>
    <p   v-html="word" v-show="word!=''" :class="{red:sign,word:true}"></p>
      <div class="writein">
          <input type="text" placeholder="请输入您的账号" v-model="user_ID"><br>
          <input type="password" placeholder="请输入您的密码"v-model="password"><br>
          <p class="ver">{{version}}</p>
      </div>


      <div>
          <mt-button type="primary"  @click.native="login" class="btn">登录</mt-button>
          <div class="btncontent">
              <router-link to="/reg">
                  <mt-button type="danger"  class="btn">注册</mt-button>
              </router-link>
              <transition name="fingering" mode="out-in">
                  <img :class="{finger:sign}"  src="../assets/img/login2.png" alt="手指" v-show="sign==true">
              </transition>
          </div>

      </div>



  </div>
</template>


<script>
  import { Toast,Indicator } from 'mint-ui';
  import axios from 'axios';

  export default {
    data(){
      return {
        word:'',
        wordArr:['等等等等','你!','...','对!','别看其他地方了','就是你!','我有话要对你说','账户密码随你设置','您注册一个试试呗!'],
        wordArr2:['我又来了','....','您真棒真听话','爱你哟!,请登录'],
        wordIndex:0,
        sign:false,
        version:'test-version:0.1.9',
        user_ID:'',
        password:'',
          img:'img/login.png'
      }
    },
    mounted(){

      Indicator.close();
      if(this.reged){
          this.img='img/login3.gif';
          let wordTimer=setInterval(function(){
              this.word=this.wordArr2[this.wordIndex];
              if(this.wordIndex==this.wordArr2.length-1){
                  this.sign=true;
                  clearInterval(wordTimer);
              }
              this.wordIndex++;

          }.bind(this),2000)
      }else{
          this.img='img/login.png';
          let wordTimer=setInterval(function(){
              this.word=this.wordArr[this.wordIndex];
              if(this.wordIndex==this.wordArr.length-1){
                  this.sign=true;
                  clearInterval(wordTimer);
              }
              this.wordIndex++;

          }.bind(this),1500)
      }

    },
      computed:{
          reged: {
              get () {
                  return this.$store.state.reged
              },
              set (value) {
                  this.$store.commit('getreged', value)
              }
          }
      },
    methods:{
        getuser(userID) {
            this.$store.commit('getuser',userID)
        },
        login() {
       // Indicator.open();
        if(!(this.user_ID&&this.password)){
          Toast('账号或密码不能为空,没有请注册');
        }
        else{
          Indicator.open();
            let aa = new Date(),
                yy=aa.getFullYear(),
                mm=aa.getMonth()+1,
                dd=aa.getDate(),
                hh=aa.getHours(),
                m=aa.getMinutes(),
                ss=aa.getSeconds(),
                gg=yy+'-'+(mm<10?'0'+mm:''+mm)+'-'+(dd<10?'0'+dd:''+dd)+' '+(hh<10?'0'+hh:''+hh)+':'+(m<10?'0'+m:''+m)+':'+(ss<10?'0'+ss:''+ss);
          axios.get('/login',{
              params: {
                  user_ID:this.user_ID,
                  password:this.password,
                  lastlogintime:gg
          }})
            .then(function (res) {    //成功

                Indicator.close();

                if(res.data.isok){
                    Toast(res.data.msg);
                    this.$router.push({path:'/home'});
                    this.getuser(this.user_ID);
                    Indicator.open();
                }else{
                    Toast(res.data.msg);
                }}
                .bind(this))
                .catch(function (err) { //错误
                    Indicator.close();
                    console.log(err+"出错了");

          });
  //
        }
      }
    }
  }

</script>
<style scoped>
    .title{
        position: relative;
        color:#ccc;
        -webkit-text-stroke: 2px black;
        z-index: 10;
        animation: title 3s ease infinite alternate;
    }
    @keyframes title {
        from{
            transform:translateY(0);
            text-shadow: 0 0 50px yellow;
        }
        to{
            transform:translateY(5px);
            text-shadow: 0 0 20px red; }
    }


    .writein{
        padding:10px;
        background:rgba(10,10,10,0.4);
        border:2px solid black;
        border-radius: 5px;
    }
    .btncontent{
        position: relative;
        display:inline;
    }
  #login-body{
    position: relative;
    margin-top: 20px;
    padding: 40px;
    text-align: center;
  }
  #login-body .word{
    margin:10px 0;
    font-size: 20px;
    font-weight: bold;
  }
  #login-body .ver{
      font-weight: bold;
      text-align: center;
      color: #fff;
  }
  #login-body .wordman{
      width:150px;
      height:100px;
  }
  #login-body .finger{
      position: absolute;
      bottom:-40px;
      right:35%;
      width:30px;
      animation: ft 2s  ease infinite alternate ;
  }
  @keyframes ft {
    from{transform:translateY(20px) scale(.5);
      opacity: 0;}
    to{transform:translateY(-10px) scale(1);
      opacity: 1;}
  }
  #login-body input{
    width: 200px;
    margin:10px 0;
    padding-left: 10px;
    height:40px;
    border:2px solid  black;
    border-radius: 5px;
  }
  #login-body .btn{

    margin:20px;
    padding: 0 20px;
  }
  .wordT-enter-active, .wordT-leave-active {
    transition: 1s all ease;
    height:100px;
    transform: translateY(20px);



  }
  .wordT-enter, .wordT-leave-to /* .fade-leave-active below version 2.1.8 */ {
    transition: 1s all ease;
    height:10px;
    transform: translateY(-20px);


  }
  .red{
    font-size:20px;
    color:red;
  }
  .fingering-enter-active, .fingering-leave-active {
    transition: 1s all ease;
    transform: translateY(20px);



  }
  .fingering-enter, .fingering-leave-to /* .fade-leave-active below version 2.1.8 */ {
    transition: 1s all ease;
    transform: translateY(-20px);


  }
</style>
