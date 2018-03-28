<template>
    <div>
        <mt-header title="关于我与本站" class="bk" fixed>
            <router-link to="/home" slot="left">
                <mt-button icon="back">返回</mt-button>
            </router-link>
        </mt-header>
        <div class="marginTop">
            <h1>此处就不做美化了</h1>
            <p>点击下面按钮切换</p>
            <div class="tcenter">
                <mt-button @click="active='tab1'" class="b2">网站</mt-button>
                <mt-button @click="active='tab2'"class="b2">在下</mt-button>
            </div>
            <mt-tab-container  v-model="active">
                <mt-tab-container-item id="tab1">
                    <h2>关于本网站</h2>
                    <div>
                        <p>这个网站的前身是我自建的<span>WordPress</span>博客。</p>
                        <p>由于我那令人窒息的迷之操作。</p>
                        <p>导致之前博客的数据全无。</p>
                        <p>痛啊~~~(T_T)</p>
                        <p>新博客地址: <a href="www.cnblogs.com/grhino">请点击跳转</a></p>
                        <p>Github地址: <a href="github.com/zoomlrx">请点击跳转</a></p>
                        <p>索性全部格式化,把网站改成用来练手。</p>
                        <p>此网站模拟的是<span>网上订餐</span></p>
                        <p>用到的有<span>Vue,Express,Mint-UI,mySQL</span>等。</p>
                        <p>是一个带数据库后台的订餐系统。</p>
                        <p>用户可以查到自己的信息,等等。</p>
                        <p>还可以看看用其他网站上的接口获得的笑话。</p>
                    </div>
                </mt-tab-container-item>
                <mt-tab-container-item id="tab2">
                    <h2>关于我</h2>
                    <div class="aboutme">
                        <p>简介:<span>在下是个脑洞大的中二骚年,会将想到的东西用拙劣的PS技术拼出来</span></p>
                        <p>喜欢音乐类型: <i>Chillhouse</i> <i>Jazzhouse</i> <i>Dubstep</i> <i>Trap</i> <span>等等,有同样喜好的可以点击图标,跳转到我的网易云 </span><a href="http://music.163.com/#/user/home?id=56222224"><img
                                src="../assets/img/cloud.jpg" alt="#"></a></p>
                        <p>喜欢游戏类型: <i>MOBA</i> <i>Rougelike</i> <i>ACT</i></p>

                    </div>
                </mt-tab-container-item>
            </mt-tab-container>
        </div>
    </div>
</template>
<style scoped>

    img{
        vertical-align: middle;
        width:40px;
    }
    i{
        margin-left:5px;
        padding:1px;
        background:#eee;
        font-size: 15px;
        font-style: normal;
        font-weight: normal;
        border:1px solid black;
        border-radius: 5px;
    }
    .aboutme p{

        margin-bottom: 10px;
        font-weight: bold;
    }
    .aboutme span{

        padding-left:10px;
        color:black;
        font-weight: normal;
    }
    .b2{
        border:2px solid black;
    }
    .marginTop{
        margin-top: 50px;
        padding:10px;
    }
    p{
        line-height: 25px;
    }
    span{
        font-weight: bold;
        color:red;
    }
    h1,h2{
        text-align:center;
    }
    .tcenter{
        padding: 10px;
        text-align:center;
        border-bottom: 2px solid black;
    }

</style>
<script>
    export default {
        data(){
            return{
                active:"tab1"
            }
        }
    }
</script>