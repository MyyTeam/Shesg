<template>
  <transition name="fade">
    <div :class="['plugins-message-box',type]" v-show="visible">
      <b-icon :icon="iconClass" class="message-icon"></b-icon>
      <div class="message-container">{{message}}</div>
    </div>
  </transition>
</template>

<script>
const typeClass = {
  success: 'check-circle-fill',
  error: 'x-circle-fill',
  default: 'check-circle-fill'
}
export default {
  name: 'messageMain',
  data() {
    return {
      visible: false, // Control the DOM to show and hide
      type: 'default', //
      icon: '', // The default is an empty icon, so use the icon corresponding to the type value
      message: '', // By default, message is empty and passed in from the outside
      duration: 2000 //
    }
  },
  computed: {
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
