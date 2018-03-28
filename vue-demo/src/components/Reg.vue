<template>
  <div id="Reg">
    <mt-header fixed title="注册" class="bk">
      <router-link to="/login" slot="left">
        <mt-button icon="back">返回</mt-button>
      </router-link>
      <mt-button icon="more" slot="right"></mt-button>
    </mt-header>
    <div id="reg-body">
      <mt-field label="用户名(必填)" placeholder="请输入用户名" v-model="userReg.user_ID" class="reg-b"></mt-field>
      <mt-field class="reg-b" label="密码(必填)" placeholder="请输入密码" type="password" v-model="userReg.password"></mt-field>
      <mt-field class="reg-b" label="请再输入密码" placeholder="请再输入密码" type="password" v-model="userReg.rpassword"></mt-field>
      <mt-field label="昵称(选填)" placeholder="请输入用昵称" v-model="userReg.username" class="reg-b"></mt-field>
      <mt-field class="reg-b" label="生日(选填)" placeholder="请输入生日" type="date" v-model="userReg.birthday"></mt-field>
      <mt-field class="reg-b" label="邮箱(选填)" placeholder="请输入邮箱" type="email" v-model="userReg.email"></mt-field>
      <mt-field class="reg-b" label="手机号(选填)" placeholder="请输入手机号" type="tel" v-model="userReg.phone"></mt-field>
      <mt-field class="reg-b" label="自我介绍(选填)" placeholder="自我介绍" type="textarea" rows="4" v-modal="userReg.introduction"></mt-field>
      <div id="reg-btn">
        <mt-button type="danger" @click.native="regUpload">提交</mt-button>
        <mt-button type="default">重置</mt-button>
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
            userReg:{
                user_ID:'',
                password:'',
                rpassword:'',
                username:'',
                birthday:'',
                email:'',
                phone:'',
                introduction:'',
                regtime:''
            }
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
        getReged(value){
            this.$store.commit('getReged',value)
        },
      regUpload(){
            Indicator.open();
            if(!(this.userReg.user_ID)){
              Toast("账号不能为空");
            }
            else if(this.userReg.password!=this.userReg.rpassword){
              Toast("两次密码不相同,请修改");
            }

            else{
                let aa = new Date(),
                    yy=aa.getFullYear(),
                    mm=aa.getMonth()+1,
                    dd=aa.getDate(),
                    hh=aa.getHours(),
                    m=aa.getMinutes(),
                    ss=aa.getSeconds(),
                    gg=yy+'-'+(mm<10?'0'+mm:''+mm)+'-'+(dd<10?'0'+dd:''+dd)+' '+(hh<10?'0'+hh:''+hh)+':'+(m<10?'0'+m:''+m)+':'+(ss<10?'0'+ss:''+ss);
                this.userReg.regtime=gg;
              axios.post('/reg', this.userReg)
                .then(function (res) {    //成功
                  Indicator.close();
                  if(res.data.isok){
                    Toast(res.data.msg);
                    this.getReged(true);
                    this.$router.push({path:'/login'});
                    Indicator.open();
                  }else{
                    Toast(res.data.msg);
                  }
                }.bind(this))
                .catch(function (err) { //错误
                  Indicator.close();
                  console.log(err+"出错了");
                });
            }

        }
    }
  }
</script>
<style scoped>
  #reg-body{
    margin-top:50px;
  }
  #reg-body .reg-b{
    margin:10px;
    padding:10px;
    border: 2px solid #ccc;
  }
  #reg-btn{
    padding-bottom:20px;
    text-align: center;
  }
</style>
