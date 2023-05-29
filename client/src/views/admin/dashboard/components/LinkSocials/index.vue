<template>
  <div class="link-socials p-3">
    <div class="success-info pb-4">
      <b-icon icon="check-circle-fill" class="message-icon"></b-icon>
      <span class="message-container">Copy Success</span>
    </div>
    <div class="social-card pb-3">
      <b-img-lazy v-for="item in socialList" :key="item.name" class="social-icon" :src="item.img" @click.native="linkSocial(item)" />
    </div>
    <div class="link-socials__title py-3">
      Add link on your socials
    </div>
    <div class="link-socials__content">
      Click on an icon above to go directly to your social accounts, then paste your shESG link in your bio!
    </div>
    <div class="close-icon" @click="closeModal">
      <b-icon icon="x"  />
    </div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
export default {
  props: {
    value: {
      type: Boolean,
      default: false
    }
  },
  data() {
    return {
      showModal: false,
      socialList: [
        {
          name: 'instagramUrl',
          img: require('@/assets/social/instagram-origin.png'),
          url: 'https://www.instagram.com/',
          initUrl: 'https://www.instagram.com/'
        },
        {
          name: 'tiktokUrl',
          img: require('@/assets/social/tiktok-origin.png'),
          url: '',
          initUrl: 'https://www.tiktok.com/'
        },
        {
          name: 'facebookUrl',
          img: require('@/assets/social/facebook-origin.png'),
          url: '',
          initUrl: 'https://www.facebook.com/'
        },
        {
          name: 'youtubeUrl',
          img: require('@/assets/social/youtube-origin.png'),
          url: '',
          initUrl: 'https://www.youtube.com/'
        },
        {
          name: 'redditUrl',
          img: require('@/assets/social/reddit-origin.png'),
          url: 'https://www.reddit.com/user/',
          initUrl: 'https://www.reddit.com/'
        }
      ]
    }
  },
  watch: {
    value: {
      handler(val) {
        this.showModal = val
      },
      immediate: true
    }
  },
  computed: {
    ...mapGetters(['userInfo'])
  },
  methods: {
    linkSocial(item) {
      let url = this.userInfo && this.userInfo[item.name]
      let socialUrl = ''
      if (url) {
        if (item.name === 'redditUrl' && url.startsWith('u/')) {
          url = url.replace('u/', '')
        }
        socialUrl = `${item.url}${url}`
      } else {
        socialUrl = item.initUrl
      }
      window.open(socialUrl)
      this.closeModal()
    },
    closeModal() {
      this.showModal = false
      this.$emit('input', this.showModal)
    }
  }
}
</script>

<style lang="scss" scoped>
.link-socials {
  position: relative;
  text-align: center;
  color: #484848;
  .success-info {
    display: flex;
    justify-content: center;
    align-items: center;
    color: #13ce66;
    font-size: 22px;
    span {
      margin-left: 6px;
    }
  }
  .social-card {
    display: flex;
    justify-content: center;
    align-items: center;
    border-bottom: 1px solid $border;
    .social-icon {
      margin: 0 6px;
      width: 40px;
      height: 40px;
      cursor: pointer;
    }
  }
  &__title {
    font-weight: 600;
    font-size: 20px;
    color: #282828;
  }
  .close-icon {
    position: absolute;
    top: -6px;
    right: -6px;
    z-index: 2;
    font-size: 24px;
    width: 30px;
    line-height: 30px;
    text-align: center;
    cursor: pointer;
  }
}
</style>
