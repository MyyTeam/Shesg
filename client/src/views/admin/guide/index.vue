<template>
  <div class="guide px-md-3 pt-md-3">
    <Information class="d-none d-md-block" />
    <Wap class="d-block d-md-none" />
    <AdminLayoutFooter />
  </div>
</template>

<script>
import AdminLayoutFooter from '../layout/Footer'
import Information from './components/Information'
import Wap from './components/Wap'
export default {
  name: 'Guide',
  components: { Information, Wap, AdminLayoutFooter },
  data() {
    return {
      toolList: [
        {
          icon: require('@/assets/guide/guide-link.png'),
          title: 'Tool for Affiliate Program',
          info: 'Specialized for affiliate marketers, with all product links in one link.',
          keywords: 'Free Sample, Earn 51% Commission, Linktree Alternative',
          flag: 'Earn Commission',
          id: 'affiliate'
        },
        {
          icon: require('@/assets/guide/guide-dropshipping.png'),
          title: 'Tool for Drop Shipping',
          info: 'No need to decorate the website shop,  one click to add your margin and earn.',
          keywords: 'Free Sample, Decide Your Margin, Drop Shipping',
          flag: 'Earn Margin',
          id: 'dropshipping'
        }
      ]
    }
  },
  created() {},
  methods: {}
}
</script>

<style lang="scss" scoped>
.guide {
  color: #282828;
}
</style>
