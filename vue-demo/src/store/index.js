import Vue from 'vue'
import Vuex from 'vuex'
import * as getters from './getters'
import * as actions from './actions'
import * as mutations from './mutations'


Vue.use(Vuex);


const state = {
    msgArr:'',
    pViste:0,
    user:{},
    buyCar:[],
    reged:false
};


const store = new Vuex.Store({
  state,
  getters,
  actions,
  mutations
});



export default store
