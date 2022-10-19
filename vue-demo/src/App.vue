<template>
  <div id="app">
    <transition name="fade" mode="out-in">
      <router-view></router-view>
    </transition>
    <!--方法1<input type="text" :value="msg" @input="updateMessage">-->
    <div v-show="user.user_ID != null">
      <mt-tabbar fixed class="whiteb">
        <mt-tab-item id="外卖">
          <img slot="icon" src="./assets/img/logo.png" />
          <router-link to="/home">主页</router-link>
        </mt-tab-item>
        <mt-tab-item id="订单">
          <img slot="icon" src="./assets/img/logo.png" />
          <router-link to="/food">美食</router-link>
        </mt-tab-item>
        <mt-tab-item id="发现">
          <img slot="icon" src="./assets/img/logo.png" />
          <router-link to="/newslist">段子</router-link>
        </mt-tab-item>
        <mt-tab-item id="我的">
          <img slot="icon" src="./assets/img/logo.png" />
          <router-link to="/mydetail">我</router-link>
        </mt-tab-item>
      </mt-tabbar>
    </div>
    <!-- test33333 -->
  </div>
</template>

<script>
//  import {mapState } from 'vuex'
//  export default {
//  //方法1
////    computed: {
////      ...mapState(['msg'])//返回对象,执行
////
////    },
////    methods: {
////
////
////      updateMessage(e){
////        this.$store.commit('updateMessage',e.target.value);
////
////      }
////    }
////  }
//
//
//    //方法2
//    computed:{
//      msg: {
//        get () {
//          return this.$store.state.msg
//        },
//        set (value) {
//          this.$store.commit('updateMessage', value);
//        }
//      },
//      msg2: {
//        get () {
//          return this.$store.state.msg2
//        },
//        set (value) {
//          this.$store.commit('tan', value);
//        }
//      }
//    },
//    methods: {
//      updateMessage (e) {
//        this.$store.commit('updateMessage',e.target.value)
//      },
//      tan(){
//        this.$store.commit('tan')
//      }
//    }
//  }
export default {
  computed: {
    user: {
      get() {
        return this.$store.state.user;
      },
      set(value) {
        this.$store.commit("getuser", value);
      },
    },
  },
};
</script>

<style scoped>
.whiteb {
  background: #fff;
  border: 1px solid black;
}
.fade-enter-active,
.fade-leave-active {
  transition: 0.1s all ease;
  transform: translateX(-50px);
  opacity: 0.3;
}
.fade-enter, .fade-leave-to /* .fade-leave-active below version 2.1.8 */ {
  transition: 0.1s transfrom ease;
  transform: translateX(50px);
  opacity: 0.1;
}
</style>
