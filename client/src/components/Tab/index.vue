<template>
  <section class="tab" :class="{'tab-block':theme==='block'}">
    <span v-if="!isMobile" class="fixed-right" :class="{'fixed-right-disabled':!showLeftIcon}" @click="moveLeft">
      <b-icon icon="chevron-left"></b-icon>
    </span>
    <div class="fixed-nav" ref="fixednav">
      <div class="fixed-nav-content" ref="fixedNavContent">
        <span
          v-for="(item, index) in tabList"
          :key="index"
          :class="['tab-title', activeId === item.id && 'select-tab']"
          @click="changeTab(item.id,index, $event)"
        >
          <svg-icon v-if="item.icon" :icon-class="item.icon" class="tab-icon" />
          {{ item.name }}
        </span>
      </div>
    </div>
    <span v-if="!isMobile" class="fixed-right" :class="{'fixed-right-disabled':!showRightIcon}" @click="moveRight">
      <b-icon icon="chevron-right"></b-icon>
    </span>
  </section>
</template>

<script>
import { isMobile } from '@/utils'
export default {
  name: 'Tab',
  props: {
    value: {
      type: String,
      default: ''
    },
    tabList: {
      type: Array,
      default: () => []
    },
    theme: {
      type: String,
      default: 'light'
    }
  },
  data() {
    return {
      activeId: '',
      tabWidth: 0,
      scrollL: 0,
      showLeftIcon: false,
      showRightIcon: true,
      isMobile: false
    }
  },
  watch: {
    value: {
      handler(val) {
        this.activeId = val
      },
      immediate: true
    },
    scrollL(val) {
      this.showLeftIcon = !!val
    }
  },
  created() {
    this.isMobile = isMobile()
  },
  mounted() {
    this.tabWidth = this.$refs.fixednav.clientWidth
  },
  methods: {
    changeTab(id, index) {
      if (id !== this.activeId) {
        this.activeId = id
        this.$emit('change-tab', id)
        this.$emit('input', id)
        const currentTab = this.$refs.fixedNavContent.children[index]
        const tabConter = (this.tabWidth - currentTab.offsetWidth) / 2
        this.$refs.fixednav.scrollLeft = currentTab.offsetLeft - tabConter
        this.scrollL = currentTab.offsetLeft - tabConter
      }
    },
    moveRight() {
      this.$refs.fixednav.scrollLeft = this.scrollL + this.tabWidth
      this.scrollL = this.scrollL + this.tabWidth
    },
    moveLeft() {
      if (!this.showLeftIcon) return
      const left = this.scrollL - this.tabWidth
      this.$refs.fixednav.scrollLeft = left < 0 ? 0 : left
      this.scrollL = left < 0 ? 0 : left
    }
  }
}
</script>
<style lang="scss" scoped>
.tab {
  display: flex;
  align-items: center;
  cursor: pointer;
  border-bottom: 1px solid $border;
  &-block {
    background: $main;
    color: $white;
    .select-tab {
      color: $white !important;
      background: #1E5AF3;
    }
  }
  .fixed-nav {
    overflow-x: scroll;
    -webkit-overflow-scrolling: touch;
    scrollbar-width: none;
    -ms-overflow-style: none;
    scrollbar-color: transparent transparent;
    scrollbar-track-color: transparent;
    -ms-scrollbar-track-color: transparent;
    flex: 1;
    position: relative;
  }
  .fixed-right {
    width: 30px;
    text-align: center;
    &-disabled {
      color: #aaa;
      cursor: not-allowed;
    }
  }
  .fixed-nav-content {
    display: flex;
  }
  .tab-title {
    padding: 0;
    width: 25%;
    height: 50px;
    line-height: 50px;
    font-size: 13px;
    flex-shrink: 1;
    text-align: center;
    color: #282828;
    &.select-tab {
      color: $main;
      border-bottom: 1px solid $main;
      font-weight: 600;
      border-width: 2px;
    }
    .tab-icon {
      font-size: 14px;
    }
  }
}
/*定义滚动条高宽及背景 高宽分别对应横竖滚动条的尺寸*/
::-webkit-scrollbar {
  width: 1px;
  opacity: 0;
  display: none;
}
/*定义滚动条轨道 内阴影+圆角*/
::-webkit-scrollbar-track {
  background-color: #fff;
  opacity: 0;
}
/*定义滑块 内阴影+圆角*/
::-webkit-scrollbar-thumb {
  width: 1px;
  border-radius: 1px;
  opacity: 0;
}
</style>
