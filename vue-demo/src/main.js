import Vue from 'vue'
import App from './App.vue'
import MintUI from 'mint-ui'
import 'mint-ui/lib/style.css'
import VueRouter from 'vue-router'

import {routes} from './router/router.config.js'
import store from './store'
import { Popup } from 'mint-ui';

Vue.component(Popup.name, Popup);
Vue.use(MintUI);
Vue.use(VueRouter);

const router= new VueRouter({routes});

new Vue({
  router,
  store,
  el: '#app',
  render: h => h(App)
})
