<template>
  <transition name="fade">
    <div :class="['plugins-message-box',type]" v-show="visible">
      <b-icon :icon="iconClass" class="message-icon"></b-icon>
      <div class="message-container">{{message}}</div>
    </div>
  </transition>
</template>

<script>
// 定义每一个type对应的class类名
const typeClass = {
  success: 'check-circle-fill',
  error: 'x-circle-fill',
  default: 'check-circle-fill'
}
export default {
  name: 'messageMain',
  data() {
    return {
      visible: false, // 控制DOM显示隐藏
      type: 'default', // 默认type值为default
      icon: '', // 默认使用icon为空，则使用type值对应的icon
      message: '', // 默认的message为空，由外部传入
      duration: 2000 // 默认显示时间为2000ms
    }
  },
  computed: {
    // 如果外部传入icon则使用外部的icon，如果没有。则使用type值对应的icon
    iconClass() {
      if (this.icon) {
        return this.icon
      } else {
        return typeClass[this.type]
      }
    }
  }
}
</script>

<style lang="scss" scoped>
.plugins-message-box {
  position: fixed;
  z-index: 2000;
  top: 10%;
  left: 50%;
  transform: translateX(-50%);
  padding: 8px 12px;
  min-width: 100px;
  max-height: 100%;
  overflow-y: auto;
  // color: $white;
  // background: rgba(0, 0, 0, .7);
  border-radius: 4px;
  color: #13ce66;
  background-color: #e7faf0;
  border-color: #d0f5e0;
  display: flex;
  align-items: center;
  &.error {
    color: #ff4949;
    background-color: #ffeded;
    border-color: #ffdbdb;
  }
  .message-icon {
    margin-right: 10px;
  }
}
</style>
