<template>
  <div class="toggle-header">
    <Popup :visible.sync="popupVisible" height="300px" theme="light" :popupStyle="popupStyle" @close="closeInvitionPopup">
      <div class="back-top">
        <div class="top-wrapper" @click="toTop">
          <svg-icon class="svg-icon" icon-class="top" />
        </div>
        <span @click="toTop">Back to the TOP</span>
      </div>
      <div class="header-list">
        <div class="header-item" v-for="item in headerList" :key="item.id" @click="toHeader(item.id)">
          <span>{{ item.title }}</span>
          <b-icon icon="chevron-right" class="right-icon" />
        </div>
      </div>
    </Popup>
  </div>
</template>

<script>
import Popup from '@/components/Popup'
import { isMobile } from '@/utils'
export default {
  components: { Popup },
  props: {
    value: {
      type: Boolean,
      default: false
    },
    type: {
      type: String,
      default: 'control'
    },
    headerList: {
      type: Array,
      default: () => []
    }
  },
  data() {
    return {
      popupVisible: false
    }
  },
  watch: {
    value: {
      handler(val) {
        this.popupVisible = val
      },
      immediate: true
    }
  },
  computed: {
    popupStyle() {
      if (this.type === 'user') {
        return {
          position: 'fixed',
          margin: '0 auto',
          width: isMobile() ? '100%' : '700px'
        }
      } else {
        return {}
      }
    }
  },
  mounted() {},
  methods: {
    closeInvitionPopup() {
      this.popupVisible = false
      this.$emit('input', this.popupVisible)
      this.$emit('togglePopup', this.popupVisible)
    },
    toTop() {
      this.$emit('to-top')
      this.closeInvitionPopup()
    },
    toHeader(id) {
      this.$emit('to-header', id)
      this.closeInvitionPopup()
    }
  }
}
</script>

<style lang="scss" scoped>
.toggle-header {
  font-weight: 600;
  // .popup-content {
  //   width: 100%;
  //   height: 100%;
  // }
  .back-top {
    display: flex;
    align-items: center;
    padding: 0 10px 6px;
    font-size: 14px;
    border-bottom: 1px solid $border;
    cursor: pointer;
    .top-wrapper {
      margin-right: 10px;
      width: 40px;
      height: 40px;
      line-height: 40px;
      text-align: center;
      font-size: 30px;
      background: #bbbbbb;
      border-radius: 6px;
    }
  }
  .header-list {
    padding: 10px 10px 0;
    .header-item {
      display: flex;
      justify-content: space-between;
      align-items: center;
      cursor: pointer;
      span {
        width: calc(100% - 30px);
        overflow: hidden;
        line-height: 36px;
        height: 36px;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 1;
        word-break: break-all;
      }
    }
  }
}

</style>
