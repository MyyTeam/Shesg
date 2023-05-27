<template>
  <div class="share">
    <div class="share-card" :class="{'share--m':type}">
      <div class="link-card">
        <b>{{ $t('dashboard.link.myLink') }}</b>
        <span class="link">http://shesg.cc/{{userInfo &&userInfo.username}}</span>
      </div>
      <div>
        <b-button
          v-trace:share.click="traceEventInfo"
          spm-index="copylink"
          variant="outline-dark"
          size="sm"
          class="share-btn second-btn d-none d-md-block"
          @click="handleCopy('showModal')"
        >
          Copy
        </b-button>
        <b-button
          v-trace:share.click="traceEventInfo"
          spm-index="copylink"
          variant="outline-dark"
          size="sm"
          class="share-btn second-btn d-block d-md-none"
          @click="handleCopy('showMobileModal')"
        >
          Copy
        </b-button>
      </div>
    </div>
    <ActionSheet :visible.sync="showMobileModal" customClass="select-product-modal" height="290px" hideHeader @close="showMobileModal=false">
      <LinkSocials v-model="showMobileModal" />
    </ActionSheet>
    <b-modal v-model="showModal" dialog-class="select-product-modal" centered @hidden="showModal=false" hide-footer hide-header>
      <LinkSocials v-model="showModal" />
    </b-modal>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
import { copy } from '@/utils'
import ActionSheet from '@/components/ActionSheet'
import LinkSocials from '../LinkSocials'
export default {
  components: {
    ActionSheet,
    LinkSocials
  },
  props: {
    type: {
      type: String,
      default: ''
    }
  },
  data() {
    return {
      visible: false,
      showModal: false,
      showMobileModal: false
    }
  },
  inject: ['traceEventInfo'],
  computed: {
    ...mapGetters(['userInfo'])
  },
  methods: {
    async handleCopy(showModalName) {
      const urlPrefix = `${window.location.protocol}//${window.location.host}`
      const copyText = `${urlPrefix}/${this.userInfo.username}`
      this.visible = false
      copy(copyText)
      this[showModalName] = true
    }
  }
}
</script>

<style lang="scss" scoped>
.share {
  position: relative;
  .share-card {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0 14px;
    border-bottom: 1px solid #DDDDDD;
    &.share--m {
      background: $white;
      .link {
        color: $main;
      }
    }
  }
  .link-card {
    padding: 14px 0;
    .link {
      padding-left: 6px;
    }
  }
  .collapse-share {
    position: absolute;
    right: 0;
    z-index: 10;
    padding: 16px;
    width: 325px;
    background: $white;
    box-shadow: 0px 4px 4px 1px rgba(0, 0, 0, 0.25);
    &__title {
      font-size: 18px;
      font-weight: 600;
    }
    &__content {
      display: flex;
      justify-content: space-between;
      align-items: center;
      overflow: hidden;
      margin-top: 16px;
      height: 40px;
      background: $white;
      border-radius: 8px;
      border: 1px solid #DDDDDD;
      .link {
        flex: 1;
        display: flex;
        align-items: center;
        padding-left: 18px;
        height: 100%;
        color: #999999;
        border-right: 1px solid #DDDDDD;
      }
      .fix {
        font-weight: 600;
        color: $black;
      }
      .button {
        height: 100%;
        line-height: 30px;
        font-weight: 600;
        border: 0;
      }
    }
  }
}
</style>
