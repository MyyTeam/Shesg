import Vue from 'vue'
import App from './App.vue'
import router from './router'
import { BootstrapVue, BootstrapVueIcons } from 'bootstrap-vue'
import store from './store'
import i18n from './lang'
import './icons'
import './permission'
// import './mock'

// bootstrap-vue css
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'
import './styles/common.scss'

import Message from './plugins/Message'

import VueTrace from 'vue-trace'

import 'wowjs/css/libs/animate.css'

import preview from 'vue-photo-preview'
import 'vue-photo-preview/dist/skin.css'

import VeeValidate from 'vee-validate'
Vue.use(VeeValidate, {
  inject: true,
  fieldsBagName: 'veeFields',
  errorBagName: 'veeErrors',
  events: 'blur'
})

Vue.use(BootstrapVue)
Vue.use(BootstrapVueIcons)

Vue.use(Message)

Vue.use(preview)

const { VUE_APP_SHESG_TRACK_URL } = process.env
Vue.use(VueTrace, {
  baseUrl: [VUE_APP_SHESG_TRACK_URL],
  spm_a: 'lmen'
})

// Vue.prototype.$wow = wow

// vue config
Vue.config.productionTip = false

// render
// eslint-disable-next-line no-new
new Vue({
  el: '#app',
  router,
  store,
  i18n,
  render: h => h(App)
})
