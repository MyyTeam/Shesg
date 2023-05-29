<template>
  <div class="user-phone-card">
    <PhoneCard ref="phoneCard" type="user" :linkList="linkList" :userInfo="userInfo"  :loading="loading" @changeTop="changeTop" />
    <div class="fixed-right">
      <div class="img-wrapper" v-show="showTop" @click="onBackToTop">
        <svg-icon class="svg-icon" icon-class="top" />
      </div>
      <div class="img-wrapper toggle-wrapper" v-if="showToggleHeader" @click="openHeaderToggle">
        <b-icon icon="list" />
      </div>
    </div>
  </div>
</template>

<script>
import { getLinks, getGroupProductsNum } from '@/api/product'
import PhoneCard from './components/PhoneCard'
import { isMobile } from '@/utils'
export default {
  components: { PhoneCard },
  data() {
    return {
      loading: false,
      linkList: [],
      userInfo: {},
      showTop: false,
      showUserProduct: true
    }
  },
  async created() {
    this.userInfo.username = this.$route.params.username
    this.getAvatar()
    this.getLinkList()
  },
  mounted() {
    document.title = `${this.userInfo.username} | shESG`
  },
  computed: {
    showToggleHeader() {
      return this.linkList.filter(item => item.type === 4 && item.title).length
    }
  },
  methods: {
    getLinkList() {
      this.loading = true
      getLinks({ userId: this.userInfo?.userId || 'd16edf46947fa936fe1bfe7db6d8e111' }).then(async res => {
        this.linkList = res.data.filter(item => item.isAvailable && (!this.userInfo.merchantSign || (this.userInfo.merchantSign && item.type !== 6)))
        if (isMobile()) {
          let tempLinks = []
          this.linkList.map((item, index) => {
            if (item.type === 5) {
              tempLinks.push(index)
            } else {
              if (tempLinks.length && tempLinks.length % 2 !== 0) {
                this.linkList[tempLinks[0]].isBigProduct = true
              }
              tempLinks = []
            }
          })
          if (tempLinks.length && tempLinks.length % 2 !== 0) {
            this.linkList[tempLinks[0]].isBigProduct = true
          }
        }
        this.linkList.push({
          id: '66666666',
          isAvailable: 1,
          title: 'Women wristband for Apple Watch Ultra Band',
          type: 6
        })
      }).finally(() => {
        this.loading = false
      })
    },
    async getProductsNum(linkId) {
      await getGroupProductsNum({ linkId }).then(res => {
        this.showUserProduct = !!res.data.totalNum
      })
    },
    getAvatar() {

    },

    changeTop(showTop) {
      this.showTop = showTop
    },
    onBackToTop() {
      const ele = document.querySelector('#phoneCard')
      ele.scrollTo({
        left: 0,
        top: 0,
        behavior: 'smooth'
      })
    },
    openHeaderToggle() {
      this.$refs.phoneCard.openHeaderToggle()
    }
  }
}
</script>

<style lang="scss" scoped>
.user-phone-card {
  position: relative;
  max-width: 700px;
  margin: 0 auto;
  height: 100vh;
  .fixed-right {
    position: absolute;
    right: 20px;
    bottom: 70px;
    z-index: 9;
    .img-wrapper {
      width: 40px;
      height: 40px;
      border: none;
      border-radius: 50%;
      overflow: hidden;
      margin-bottom: 16px;
      box-shadow: 0 .5rem 1rem rgba(0,0,0,.15)!important;
      background-color: #ffffff;
      cursor: pointer;
      display: flex;
      justify-content: center;
      align-items: center;
      &:focus, &:active {
        outline: none;
      }
    }
    .toggle-wrapper {
      margin-top: 10px;
      font-size: 26px;
    }
    .svg-icon{
      font-size: 32px;
    }
  }
}
</style>
