import router from './router'
import store from './store'
import adminRouters from './router/modules/admin'
import { setDescription } from './utils/setDescription'

import vueTrace from 'vue-trace'
const { BuryingPoint } = vueTrace
const { VUE_APP_DHGATE_TRACK_URL } = process.env

router.beforeEach(async(to, from, next) => {
  // set page title
  document.title = to.meta.title || 'SHEsg'
  setDescription(to.meta.description)

  const hasEventInfoRouter = ['/admin', '/home']
  const spmb = to.meta ? (to.meta.spmb || '') : ''
  const adminRouterPaths = adminRouters.map(item => item.path)
  const kolRouterPaths = [...adminRouterPaths, '/home']
  const pathPrefix = to.path.split('/')[1]
  if (kolRouterPaths.includes(`/${pathPrefix}`) && spmb) {
    // definition event_body
    let event_entity_info = {}
    if (hasEventInfoRouter.includes(`/${pathPrefix}`)) {
      const userInfo = store.state.user.userInfo
      if (userInfo) {
        event_entity_info = {
          username: userInfo.username,
          aid: userInfo.affiliateCode
        }
      }
    }
    new BuryingPoint({
      baseUrl: [VUE_APP_DHGATE_TRACK_URL],
      spm_a: 'lmen',
      module: 'page',
      title: '',
      spm_b: spmb
    }).pageview({
      event_body: {
        event_data: {
          event_entity_info
        }
      }
    })
  }

  next()
})
