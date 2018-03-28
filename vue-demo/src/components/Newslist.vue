<template>
  <div id="newslist">
    <mt-header title="新闻">
      <router-link to="/home" slot="left">
        <mt-button icon="back">返回</mt-button>
      </router-link>
    </mt-header>
    <div v-show="msgArr===''" @click="get1" class="msghas">
      当前没有数据,点击刷新
    </div>
    <div v-show="msgArr!==''">
      <ul>
        <li v-for="(val,index) in msgArr" >
          <div class="bor">
            <div v-html="val.text"></div>
            <div class="ct">{{val.ct}}</div>
          </div>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>

  export default {
    mounted(){

        this.$store.commit('get1')

    },
    computed:{
      msgArr: {
        get () {
          return this.$store.state.msgArr
        },
        set (value) {
          this.$store.commit('get1', value);
        }
      }

    },
    methods: {
      get1() {
        this.$store.commit('get1')
      },

    }




  }
</script>

<style scoped>

  #newslist li{
    margin:10px;
    padding:15px;
    background: linear-gradient(to left top,#ccc,#eee,#fff);
    font-size:14px;
    border:1px solid #ccc;

    border-radius: 10px;
  }
  #newslist li .ct{
    margin-top: 5px;
    padding-top:5px;
    border-top:1px solid #bbb;
    font-size:12px;
    text-align:right;
  }
  .msghas{
    height: 500px;
    text-align: center;
  }
</style>
