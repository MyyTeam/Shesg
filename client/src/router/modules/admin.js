import Layout from '@/views/admin/layout'
export default [
  {
    path: '/admin',
    component: Layout,
    redirect: '/admin/links',
    children: [{
      path: 'guide',
      component: () => import(/* webpackChunkName: "guide" */'@/views/admin/guide'),
      name: 'Guide',
      meta: {
        title: '',
        spmb: 'guide'
      }
    }, {
      path: 'links',
      component: () => import(/* webpackChunkName: "dashboard" */'@/views/admin/dashboard'),
      name: 'Dashboard',
      meta: {
        title: 'Dashboard',
        spmb: 'links',
        headerTitle: '',
        showMenu: true
      }
    }, {
      path: 'commission-income',
      component: () => import(/* webpackChunkName: "commissionIncome" */'@/views/admin/commissionIncome'),
      name: 'commissionIncome',
      meta: {
        title: 'commissionIncome',
        spmb: 'links',
        headerTitle: '',
        showMenu: true
      }
    }, {
      path: 'link-generator',
      component: () => import(/* webpackChunkName: "linkGenerator" */'@/views/admin/linkGenerator'),
      name: 'Dashboard',
      meta: {
        title: 'SHEsg Admin',
        spmb: 'links',
        headerTitle: '',
        showMenu: true
      }
    }]
  }
]
