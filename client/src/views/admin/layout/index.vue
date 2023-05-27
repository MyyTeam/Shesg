<template>
  <div id="admin-layout">
    <CommonLayoutHeader v-if="showCommonHeader" />
    <AdminLayoutHeader v-else />
    <div class="admin-content">
      <AdminLayoutSidebar class="d-none d-md-block" />
      <div class="content-container">
        <router-view></router-view>
      </div>
    </div>
    </div>
</template>

<script>
import AdminLayoutHeader from './Header.vue'
import CommonLayoutHeader from './CommonHeader.vue'
import AdminLayoutSidebar from './Sidebar.vue'
import { isMobile } from '@/utils'
export default {
  name: 'AdminLayout',
  components: {
    AdminLayoutHeader,
    CommonLayoutHeader,
    AdminLayoutSidebar
  },
  computed: {
    showCommonHeader() {
      return isMobile() && this.$route.name !== 'Guide'
    }
  },
  created() {
    this.$store.dispatch('user/getInfo')
  }
}
</script>

<style lang="scss" scoped>
.admin-content {
  display: flex;
  padding-top: 60px;
  background: #F5F8FF;
  height: 100vh;
  .content-container {
    overflow: auto;
    flex: 1;
    height: calc(100vh - 60px);
  }
}
</style>
