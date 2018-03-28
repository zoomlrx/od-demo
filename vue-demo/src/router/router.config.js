import Home from '../components/Home.vue'
import Food from '../components/food.vue'
import Newslist from '../components/Newslist.vue'
import Login from '../components/Login.vue'
import Reg from '../components/Reg.vue'
import Mydetail from '../components/Mydetail.vue'
import Shoppingcart from '../components/Shoppingcart.vue'
import My from '../components/My.vue'

export const routes = [
    {path:'/home',component:Home},
    {path:'/newslist',component:Newslist},
    {path:'/food',component:Food},
    {path:'/login',component:Login},
    {path:'/reg',component:Reg},
    {path:'/mydetail',component:Mydetail},
    {path:'/shoppingcart',component:Shoppingcart},
    {path:'/my',component:My},
    {path: '/*', redirect: '/login'},   //默认跳转

];
