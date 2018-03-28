<template>
    <div id="shoppingcar">
        <mt-header title="成功">
            <router-link to="/home" slot="left">
                <mt-button icon="back">返回</mt-button>
            </router-link>
        </mt-header>
        <div class="word">
            <p>提交成功</p>
            <p>我们的厨师正在加急制作</p>
            <p>大概明年</p>
            <p>我们还一定不能送到</p>
            <p>您也一定吃不到</p>
            <img src="../assets/img/fire.gif" alt="#"><br>
            <router-link to="/home">
                <mt-button type="danger" >返回到主页</mt-button>
            </router-link>
        </div>

    </div>
</template>
<script>

    export default {
       
    }
</script>

<style scoped>

    .word{
        text-align: center;
    }
    .word img{
        width: 150px;
        border:2px solid black;
        animation: fire 1s ease infinite alternate;
    }
    @keyframes fire {
        from{transform:translateY(0); }
        to{transform:translateY(-10px); }
    }
    .word p{
        margin-bottom:10px;
        font-size:20px;
        font-weight:bold;
    }
</style>