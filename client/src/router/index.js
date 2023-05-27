// vue
import Vue from 'vue'
import Router from 'vue-router'

/* Router Modules */
import webRouters from './modules/web'
import adminRouters from './modules/admin'

// use router
Vue.use(Router)

/**
 * constantRoutes
 * a base page that does not have permission requirements
 * all roles can be accessed
*/
export const constantRoutes = [
  ...adminRouters,
  {
    path: '/404',
    component: () => import('@/views/admin/error-page/404'),
    hidden: true
  },
  ...webRouters
]

/**
 * asyncRoutes
 * the routes that need to be dynamically loaded based on user roles
 */
export const asyncRoutes = []

const createRouter = () => new Router({
  mode: 'history', // require service support
  scrollBehavior: () => ({
    y: 0
  }),
  routes: constantRoutes
})

const router = createRouter()

export function resetRouter () {
  const newRouter = createRouter()
  router.matcher = newRouter.matcher // reset router
}

export default router
