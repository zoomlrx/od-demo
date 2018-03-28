<template>
  <div id="home" >

      <mt-header fixed title='主页'></mt-header>
      <div class="swp">
          <mt-swipe :auto="4000" class="hh">
            <mt-swipe-item class="slide1"><img src="../assets/img/t22.jpg" alt="#"></mt-swipe-item>
            <mt-swipe-item class="slide2"><img src="../assets/img/022.jpg" alt="#"></mt-swipe-item>
            <mt-swipe-item class="slide3"><img src="../assets/img/033.jpg" alt="#"></mt-swipe-item>
          </mt-swipe>
          <div><p>脑洞展示区</p></div>
      </div>
       <div class="cc">
            <p v-show="user.username==''">当前访问的是:匿名用户</p>
            <p v-show="user.username">当前访问的是:{{user.username}}</p>
            <p>当前访问次数:{{user.count}} 次</p>
            <p>您最后一次登录的时间为: <br>{{user.lastlogintime}}</p>
            <p>您注册时间为:  <br>{{user.regtime}}</p>
           <router-link to="/my">
               <p class="me">关于我与本站</p>
           </router-link>
       </div>
  </div>
</template>
<script>
  import { Toast,Indicator } from 'mint-ui';
  export default {
    data(){
      return {
        msg:'倒萨大飒飒',
      }
    },
    mounted(){
      Indicator.close();
    },
    computed:{
      user: {
        get () {
          return this.$store.state.user
        },
        set (value) {
          this.$store.commit('getuser', value);
        }
      }

    },
    methods: {
//      getuser() {
//        this.$store.commit('getuser')
//      }

    }
  }
</script>
<style scoped>
    .cc .me{
        font-size:20px;
        color:black;
        font-weight: bold;
        text-shadow: 0 0 10px rgba(10,10,10,0.5);
        animation: wordcolor 3s ease infinite alternate;
    }
    @keyframes wordcolor {
        from{

            text-shadow: 0 0 50px yellow;
        }
        to{

            text-shadow: 0 0 20px red; }
    }
    .swp{
        position:relative;
    }
    .swp img {
       width:100%;
        height:100%;
    }
    .swp div p{
        position: absolute;
        top: 20%;
        width:100%;
        padding: 10px 0;
        background: rgba(0,0,0,0.2);
        text-align: center;
        color:#fff;
        z-index: 10;
    }
  .hh {
    height: 200px;
    color: #fff;
    font-size: 30px;
    text-align: center;
    margin-bottom: 20px;
  }

  .hh .slide1 {
    background-color: #0089dc;
    color: #fff;
  }
  .hh .slide2 {
    background-color: #ffd705;
    color: #000;
  }
  .hh .slide3 {
    background-color: #ff2d4b;
    color: #fff;
  }

  .cc p{
    width:100%;
      margin-bottom:10px;
    text-align: center;
    font-size:20px;
    color: red;
  }
</style>
