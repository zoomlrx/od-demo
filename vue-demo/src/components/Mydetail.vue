<template>
  <div>
      <mt-header title="我的信息" class="bk" fixed>
          <router-link to="/home" slot="left">
              <mt-button icon="back">返回</mt-button>
          </router-link>
          <mt-button icon="more" slot="right"></mt-button>
      </mt-header>
      <div class="userbox">
          <p>亲爱的:</p>
          <p class="center">{{user.username}}</p>
          <p>消费了<span>{{userdetail.paycount}}</span>笔,共花了<span>{{userdetail.allpay}}</span>元</p>
          <p>这里有待开发</p>
      </div>
      <hr>
      <ul class="p-bottom">

          <li class="my-food-list mg"  v-for="(val,index) in buylist"  @click="val.tap=!val.tap">
              <p class="big">订单号:{{val.orderForm_ID}}</p>
              <p class="datetime">{{val.date2}}</p>
              <ul  :class="{hidden:val.tap}">
                  <li  v-for="value in orderForm[index]"
                       class="my-food-list">

                      <div  class="doute" v-show="ishidden" >···</div>
                      <div>
                          {{value.food_name}}   {{value.buy}}份
                      </div>
                  </li>
              </ul>
              <p class="right">此次消费<span class="red">{{val.total_price}}元</span></p>
          </li>
      </ul>

  </div>
</template>

<script>
    import axios from 'axios'
  export default {
    data(){
      return{
          userdetail:'',
          buylist:'',
          orderForm:[],
          ishidden:false
      }
    },
      mounted(){
        this.getlist()
      },
      computed:{
          user: {
              get () {
                  return this.$store.state.user
              },
              set (value) {
                  this.$store.commit('getuser', value);
              }
          },


      },
      methods:{

        getlist(){
            axios.post('/buylist',{user_ID:this.user.user_ID})
                .then(function(res){
                    var toolA=[],
                        toolB=[];
                    this.userdetail=res.data.user[0];
                    this.buylist=res.data.list;
                    this.buylist.reverse();
                    for(var a in this.buylist){
                        toolA.push(this.buylist[a].orderFormContent)
                    };
                    for(var b in toolA){
                        toolB.push(toolA[b].match(/\{\D+\d+\D+\d+\D+\d+\D+\d+\D+\d+\}/g))
                    };

                    for(var i in toolB){
                        this.orderForm[i]=[];
                        for(var j in toolB[i]){
                            this.orderForm[i].push(JSON.parse(toolB[i][j]))
                        }
                    };

                }.bind(this)).catch(function(err){
                console.log(err+"出错了");
            })
        }
      }
  }
</script>

<style scoped>
    .userbox p span{
        color:red;
        font-weight:bold;
    }
    .p-bottom{
        padding-bottom: 100px;
    }
    .mg{
        margin-bottom:10px;
        box-shadow: 0 10px 10px rgba(10,10,10,0.3);
    }
    .userbox{
        margin:40px 0 10px 0;
        padding: 10px;
    }
    .userbox .center{
        font-size:30px;
        font-weight: bold;
        text-align: center;
    }
    .big{
        font-size:25px;
        font-weight: bold;
    }
    .datetime{
        margin:5px 0;
    }
    .right{
        text-align:right;
    }
    .red{
        font-size:30px;
        color:red;
    }
    .my-food-list{
        position:relative;
        padding:10px;
        border:2px solid black;
        border-radius: 5px;
    }
    .my-food-list .doute{
        position:absolute;
        top: 10px;
        right:10px;
        line-height: 20px;
        font-size:20px;
        font-weight: bold;
    }
    .my-food-list .foodcontent li{
        margin-bottom: 10px;
    }
    .hidden{
        height:2px;
        overflow: hidden;
    }

</style>