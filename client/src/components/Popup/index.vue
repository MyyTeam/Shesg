<template>
  <div class="popup">
    <Overlay class="popup-overlay" v-model="visible" @click="closeMyself" />
    <transition name="fullscreen" @after-enter="afterEnter" @after-leave="afterLeave">
      <div v-if="visible" class="fullscreen-dialog-wrapper" :style="wrapperStyle">
        <div ref="dialog" class="fullscreen-dialog" :class="{'no-header-dialog':hideHeader,'light':theme==='light'}">
          <a aria-label="Close" class="dialog-headerbtn">
              <b-icon icon="x" class="dialog-close" @click="closeMyself"  />
            </a>
          <div :class="customClass" class="dialog-body">
            <slot></slot>
          </div>
        </div>

      </div>
    </transition>
  </div>
</template>

<script>
import Overlay from '../Overlay'
export default {
  name: 'ActionSheet',
  components: { Overlay },
  props: {
    title: {
      type: String,
      default: ''
    },
    visible: {
      type: Boolean,
      default: false
    },
    customClass: {
      type: String,
      default: ''
    },
    height: {
      type: String,
      default: '300px'
    },
    hideHeader: {
      type: Boolean,
      default: false
    },
    popupStyle: {
      type: Object,
      default: () => {}
    },
    theme: {
      type: String,
      default: 'dark'
    }
  },
  data () {
    return {
      closed: false,
      appendToBody: true
    }
  },
  watch: {
    visible (val) {
      if (val) {
        this.closed = false
        this.$emit('open')
      } else {
        if (!this.closed) this.$emit('close')
      }
    }
  },
  computed: {
    wrapperStyle() {
      return {
        height: this.height,
        ...this.popupStyle
      }
    }
  },
  mounted () {},
  methods: {
    closeMyself () {
      this.$emit('close')
      // 右上角关闭X号的事件
    },
    afterEnter () {
      this.$emit('opened')
    },
    afterLeave () {
      this.$emit('closed')
    }
  }
}
</script>

<style lang="scss" scoped>
.fullscreen-dialog-wrapper{
    position: absolute;
    right: 0;
    bottom: 0;
    left: 0;
    margin: 0;
    z-index: 1001;
    width: 100%;
    opacity: 1;
    border-radius: 16px 16px 0 0;
    overflow: hidden;
    box-shadow: 0 4px 8px 0 rgb(0 0 0 / 16%);
}
.fullscreen-dialog{
  position:relative;
  margin:0 auto 50px;
  background: rgba(0,0,0,.9);
  box-sizing:border-box;
  width:100%;
  margin-top:0;
  margin-bottom:0;
  height:100%;
  overflow-y:auto;
  color: $white;
  &.no-header-dialog .dialog-body {
    height:100%;
  }
  &.light {
    color: #282828;
    background: $white;
    .dialog-body {
      color: #282828;
    }
    .dialog-headerbtn .dialog-close {
      color: #282828;
    }
  }
}
.dialog-header{
  height: 50px;
  padding:14px 18px 12px;
  line-height: 24px;
  font-size: 18px;
  color: $black;
}
.dialog-header .dialog-title{
  line-height:24px;
  font-size:18px;
  // color:#fff
  color: $black;
}
.dialog-headerbtn{
  position:absolute;
  top:14px;
  right:15px;
  padding:0;
  background:0 0;
  border:none;
  outline:0;
  cursor:pointer;
  font-size:20px
}
.dialog-headerbtn .dialog-close{
  // color:#fff
  color: $white;
}
.dialog-headerbtn:focus .dialog-close,
.dialog-headerbtn:hover .dialog-close{
  color:#409EFF
}

.dialog-body{
  padding: 24px;
  // height: calc(100% - 50px);
  color:$white;
  line-height:24px;
  font-size:14px;
  overflow-y: auto;

}
.dialog-footer{
  height: 53px;
  padding: 10px 30px;
  text-align:right;
  -webkit-box-sizing:border-box;
  box-sizing:border-box;
  border-top: 1px solid #ddd;
  background-color: #fff;
}
.el-popup-parent--hidden{
  overflow: hidden
}
//动画过程
.fullscreen-enter{
  animation:fullscreen-dialog-fade-in .3s ease;
}
.fullscreen-leave{
  animation:fullscreen-dialog-fade-out .3s ease forwards;
}
.fullscreen-enter-active{
  animation:fullscreen-dialog-fade-in .3s ease
}
.fullscreen-leave-active{
  animation:fullscreen-dialog-fade-out .3s ease forwards
}

@keyframes fullscreen-dialog-fade-in {
  0% {
    transform: translate3d(0, 100%, 0);
    opacity: 1;
  }
  100% {
    transform: translate3d(0, 0, 0);
    opacity: 1;
  }
}

@keyframes fullscreen-dialog-fade-out {
  0% {
    transform: translate3d(0, 0, 0);
    opacity: 1;
  }
  100% {
    transform: translate3d(0, 100%, 0);
    opacity: 1;
  }
}
.popup-overlay {
  background: transparent;
}

</style>
