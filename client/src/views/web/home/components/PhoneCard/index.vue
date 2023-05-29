<template>
  <div id="phoneCard" class="phone-card-outer" :class="{'user-phone-card-outer': isFromUser,'stop-scroll':shouldStopScroll}"  @scroll="scrollChange">
    <div class="phone-card" :class="{'phone-card__user px-md-4': isFromUser}">
      <div class="user-card">
      <div class="avatar" :style="{backgroundImage: `url(${userInfo && userInfo.img || baseAvatar})`}"></div>
      <div class="username">@{{ username }}</div>
      <div v-if="userInfo && userInfo.shESGDescription" class="username">{{ userInfo && userInfo.shESGDescription }}</div>
      <div class="social-card">
        <b-img-lazy
          v-for="item in socialList"
          :key="item.name"
          v-trace:socialicon.click.expose="{...traceEventInfo,social:item.key}"
          class="social-icon"
          :src="item.img"
          @click.native="linkSocial(item)" />
      </div>
    </div>
    <div class="main-card" v-if="userInfo">
      <div v-for="(linkItem,i) in linkList" :key="linkItem.id" :ref="`phoneLinkItem${i}`" class="link-item" :class="{'link-item__small':(linkItem.type===5&&!linkItem.isBigProduct)}">
        <PhoneLinkItem
          v-if="!linkItem.type||linkItem.type===4"
          v-trace:normallink.click.expose="{...traceEventInfo,title:linkItem.title,url:(linkItem.redirectUrl||linkItem.url||'')}"
          :ref="`phoneLinkHeader-${linkItem.id}`"
          :traceEventInfo="traceEventInfo"
          :linkItem="linkItem" />
        <PhoneGateProductItem
          v-if="linkItem.type===5"
          v-trace:productlink.click.expose="{...traceEventInfo,title:linkItem.title,url:(linkItem.redirectUrl||linkItem.url||'')}"
          :ref="`phoneLinkHeader-${linkItem.id}`"
          :traceEventInfo="traceEventInfo"
          :productInfo="linkItem" />
        <PhoneAffiliateProduct
          ref="phoneProduct"
          v-if="linkItem.type===6"
          :traceEventInfo="traceEventInfo"
          :linkItem="linkItem" />
      </div>
    </div>
    <b-overlay :show="loading" no-wrap />
    </div>
    <Invitation
      v-if="userInfo && userInfo.invitationSwitch"
      :type="type"
      :userId="userInfo.userId"
      :traceEventInfo="traceEventInfo"
      @togglePopup="togglePopup" />

    <ToggleHeader
      v-model="showHeaderToggle"
      :type="type"
      :headerList="headerList"
      @togglePopup="togglePopup"
      @to-header="scrollToHeader"
      @to-top="scrollToTop" />
  </div>
</template>

<script>
import { throttle, isMobile } from '@/utils'
import bus from '@/utils/bus'
import PhoneGateProductItem from '@/components/ProductItem'
import PhoneLinkItem from '../PhoneLinkItem'
import PhoneAffiliateProduct from '../PhoneAffiliateProduct'
import Invitation from '../Invitation'
import ToggleHeader from '../ToggleHeader'
export default {
  components: { PhoneLinkItem, PhoneGateProductItem, PhoneAffiliateProduct, Invitation, ToggleHeader },
  props: {
    type: {
      type: String,
      default: 'control'
    },
    loading: {
      type: Boolean,
      default: false
    },
    linkList: {
      type: Array,
      default: () => []
    },
    userInfo: {
      type: Object,
      default: () => {}
    }
  },
  data() {
    return {
      baseAvatar: require('@/assets/dashboard/avatar.png'),
      initSocialList: [
        {
          name: 'whatsAppUrl',
          img: require('@/assets/social/whatsapp.png'),
          url: 'https://api.whatsapp.com/send?phone=',
          key: 'whatsApp'
        },
        {
          name: 'youtubeUrl',
          img: require('@/assets/social/youtube.png'),
          url: '',
          key: 'youtube'
        },
        {
          name: 'tiktokUrl',
          img: require('@/assets/social/tiktok.png'),
          url: '',
          key: 'tiktok'
        },
        {
          name: 'facebookUrl',
          img: require('@/assets/social/facebook.png'),
          url: '',
          key: 'facebook'
        },
        {
          name: 'instagramUrl',
          img: require('@/assets/social/instagram.png'),
          url: 'https://www.instagram.com/',
          key: 'instagram'
        },
        {
          name: 'redditUrl',
          img: require('@/assets/social/reddit.png'),
          url: 'https://www.reddit.com/user/',
          key: 'reddit'
        }
      ],
      socialList: [],
      shouldStopScroll: false,
      showHeaderToggle: false,
      headerList: []
    }
  },
  mounted() {
    if (!isMobile()) {
      bus.$on('update-link-preview', (index, id) => {
        if (id) {
          this.$nextTick(() => {
            this.scrollToHeader(id)
          })
        } else {
          this.scrollToItem(index)
        }
      })
    }
  },
  beforeDestroy() {
    if (!isMobile()) {
      bus.$off('update-link-preview')
    }
  },
  watch: {
    userInfo: {
      handler(val) {
        this.socialList = this.initSocialList.filter(item => val && val[item.name])
      },
      immediate: true
    },
    linkList: {
      handler(val) {
        if (!val) { return }
        this.headerList = val
          .filter(item => item.type === 4 && item.title)
          .map(item => {
            return {
              id: item.id,
              title: item.title
            }
          })
      },
      immediate: true
    }
  },
  computed: {
    username() {
      return this.userInfo?.nickname || this.userInfo?.username
    },
    isFromUser() {
      return this.type === 'user'
    },
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
    linkUrl({ url, redirectUrl }) {
      if (!url && !redirectUrl) return
      window.open(redirectUrl || url)
    },
    linkSocial(item) {
      let url = this.userInfo && this.userInfo[item.name]
      if (item.name === 'redditUrl' && url.startsWith('u/')) {
        url = url.replace('u/', '')
      }
      const socialUrl = `${item.url}${url}`
      window.open(socialUrl)
    },
    scrollChange: throttle(function(e) {

    }, 500),
    togglePopup(val) {
      this.shouldStopScroll = val
    },
    scrollToItem(i) {
      const target = this.$refs[`phoneLinkItem${i}`]
      if (target) {
        target[0].scrollIntoView({ behavior: 'smooth', block: 'center' })
      }
    },
    openHeaderToggle() {
      this.showHeaderToggle = true
    },
    scrollToHeader(id) {
      const target = this.$refs[`phoneLinkHeader-${id}`]
      if (target) {
        target[0].$el.scrollIntoView({ behavior: 'smooth' })
      }
    },
    scrollToTop() {
      this.scrollToItem(0)
    }
  }
}
</script>

<style lang="scss" scoped>
.phone-card-outer {
  position: relative;
  height: 100%;
  overflow-y: auto;
  scrollbar-width: thin;
  &::-webkit-scrollbar {
      width: 6px;
      background: #f1f1f1;
  }
  &::-webkit-scrollbar-track {
      -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);    /* 较少使用 */
      border-radius: 3px;
  }
  &::-webkit-scrollbar-thumb {
      border-radius: 3px;
      background-color: #c1c1c1;
  }
  &.user-phone-card-outer {
    scrollbar-width: none;
    -ms-overflow-style: none;
    transition: all 4s;
    &::-webkit-scrollbar {
      display: none;
    }
  }
  &.stop-scroll {
    overflow: hidden;
  }
}
.phone-card {
  background: #A0D9F6;
  padding: 40px 10px 30px;
  display: flex;
  flex-direction: column;
  width: 100%;
  min-height: 100%;
  &.phone-card__user {
    min-height: 100vh;
  }
  .user-card {
    margin-bottom: 18px;
    text-align: center;
    color: $white;
    .avatar {
      margin: 0 auto 10px;
      width: 60px;
      height: 60px;
      border-radius: 50%;
      border: 1px solid #DDDDDD;
      background-color: $white;
      background-size: contain;
    }
    .username {
      padding-bottom: 10px;
      line-height: 1.2;
    }
    .social-card {
      display: flex;
      justify-content: center;
      align-items: center;
      .social-icon {
        margin: 0 6px;
        width: 30px;
        height: 30px;
        cursor: pointer;
      }
    }
  }
  .main-card {
    display: flex;
    flex-wrap: wrap;
    .link-item {
      padding: 0 6px;
      width: 100%;
      &.link-item__small {
        width: 50%;
      }
    }
  }
  .footer {
    margin-top: auto;
    padding-top: 20px;
    text-align: center;
    .logo {
      width: 150px;
    }
  }
  a {
    color: #000;
    &:hover {
      text-decoration: none;
    }
  }
}
</style>
