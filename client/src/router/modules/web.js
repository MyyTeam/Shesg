/* Layout */
import Layout from '@/views/web/layout/index'
export default [{
  path: '/',
  component: Layout,
  redirect: '/admin',
  children: [{
    path: ':username',
    component: () => import(/* webpackChunkName: "home" */ '@/views/web/home'),
    name: 'Home',
    meta: {
      title: '',
      spmb: 'userpage'
    }
  }]
}]
