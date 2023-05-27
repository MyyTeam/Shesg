<template>
  <div class="m-header">
    <div v-trace:share.click="traceEventInfo" spm-index="copylink" class="share-btn" @click="onShare">
      <svg-icon icon-class="tool" class="share-icon" />
      <span>Share to Earn</span>
    </div>
    <Tab theme="theme" v-model="activeTabName" class="link-tab" :tabList="tabList" @change-tab="changeTab" />
    <ActionSheet :visible.sync="showMobileModal" customClass="select-product-modal" height="290px" hideHeader @close="showMobileModal=false">
      <LinkSocials v-model="showMobileModal" />
    </ActionSheet>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
import { copy } from '@/utils'
import Tab from '@/components/Tab'
import ActionSheet from '@/components/ActionSheet'
import LinkSocials from '../LinkSocials'
export default {
  components: {
    Tab,
    ActionSheet,
    LinkSocials
  },
  data() {
    return {
      tabList: [
        {
          name: 'Bio Link',
          id: 'Dashboard'
        },
        {
          name: 'Orders',
          id: 'commissionIncome'
        }
      ],
      activeTabName: 'Dashboard',
      showMobileModal: false
    }
  },
  created() {
    this.activeTabName = this.$route.name
  },
  computed: {
    ...mapGetters(['userInfo'])
  },
  inject: ['traceEventInfo'],
  methods: {
    changeTab(name) {
      this.$router.push({ name })
    },
    async onShare() {
      const urlPrefix = `${window.location.protocol}//${window.location.host}`
      const copyText = `${urlPrefix}/${this.userInfo.username}`
      this.visible = false
      copy(copyText)
      this.showMobileModal = true
    }

  }
}
</script>

<style lang="scss" scoped>
.share-btn {
  position: fixed;
  top: 10px;
  right: 10px;
  z-index: 100;
  display: flex;
  align-items: center;
  padding: 10px 16px;
  font-size: 14px;
  font-weight: 600;
  background: #f3f3f1;
  border-radius: 40px;
  .share-icon {
    margin-right: 4px;
    font-size: 18px;
  }
}
.link-tab {
  background: $white;
  ::v-deep {
    .fixed-nav-content {
      justify-content: space-around;
    }
  }
}
</style>
