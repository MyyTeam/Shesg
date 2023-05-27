<template>
  <b-container fluid class="control-center">
    <b-row class="control-row">
      <b-col lg="8" md="12" class="control-center__left" id="controlLeft"  @scroll="scrollChange">
        <template v-if="!showMobilePreview">
          <MHeader v-if="isMobile" />
          <div class="control-card px-2 px-lg-0 pb-0 pb-lg-4"  >
            <LinkList ref="linkList" @changeLink="getFilterLinkList" />
          </div>
        </template>
        <div v-else class="control-phone-card d-block d-md-none">
          <PhoneCard :linkList="filterLinkList" :userInfo="userInfo" :loading="phoneLoading"  />
        </div>
      </b-col>
      <b-col lg="4" md="12" class="control-center__right">
        <Share v-if="!isMobile" class="link-share" id="linkShare" />
        <div class="control-phone-card d-none d-md-block">
          <PhoneCard
            ref="phoneCard"
            :linkList="filterLinkList"
            :userInfo="userInfo"
            :loading="phoneLoading"
          />
        </div>
        <div v-if="userInfo" class="preview-btn d-block d-md-none" @click="togglePreview">
          {{ showMobilePreview ? 'Back to admin' : 'Preview'}}
        </div>
      </b-col>
    </b-row>
  </b-container>
</template>

<script>
import MHeader from './components/MHeader'
import Share from './components/Share'
import LinkList from './components/LinkList'
import PhoneCard from '@/views/web/home/components/PhoneCard'
import { mapGetters } from 'vuex'
import { scrollTo } from '@/utils/scroll-to'
import { isMobile, throttle } from '@/utils'
export default {
  name: 'Dashboard',
  components: { MHeader, Share, PhoneCard, LinkList },
  data() {
    return {
      loading: false,
      phoneLoading: false,
      showMobilePreview: false,
      filterLinkList: [],
      showBanner: true,
      bannerImg: require('@/assets/dashboard/banner.jpg'),
      mBannerImg: require('@/assets/dashboard/banner-m.jpg'),
      isMobile: false
    }
  },
  created() {
    this.isMobile = isMobile()
  },
  provide: function() {
    return {
      traceEventInfo: this.traceEventInfo
    }
  },
  computed: {
    ...mapGetters(['userInfo']),
    traceEventInfo() {
      if (!this.userInfo) return {}
      const { username, affiliateCode } = this.userInfo
      return {
        username,
        aid: affiliateCode
      }
    }
  },
  methods: {
    togglePreview() {
      this.showMobilePreview = !this.showMobilePreview
      scrollTo(0)
    },
    getFilterLinkList(list) {
      this.phoneLoading = true
      this.filterLinkList = list
      this.$nextTick(() => {
        this.phoneLoading = false
      })
    },
    getLinkId(item, i) {
      return [2, 3].includes(item.type) ? `linkItem${i}` : `linkItemEdit${i}`
    },
    scrollChange: throttle(function(e) {

    }, 500)
  }
}
</script>

<style lang="scss" scoped>
@import './index.scss';
</style>
