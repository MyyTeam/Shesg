<template>
  <div ref="wrapper">
    <slot></slot>
  </div>
</template>

<script type="text/ecmascript-6">
import BScroll from 'better-scroll'
export default {
  props: {
    /**
      * 1 The scroll event is sent when scrolling, which stops the stream.
      * 2 Dispatch the scroll event in real time while scrolling, without blocking the stream.
      * 3 In addition to real-time dispatch of scroll events, we can still dispatch real-time scroll events in the case of swipe  
      */
    probeType: {
      type: Number,
      default: 1
    },
    /**
      * Whether the click event should be dispatched for the click list
      */
    click: {
      type: Boolean,
      default: true
    },
    /**
      * 
      */
    scrollX: {
      type: Boolean,
      default: false
    },
    /**
      * Whether to dispatch scroll events
      */
    listenScroll: {
      type: Boolean,
      default: false
    },
    /**
      * List data
      */
    data: {
      type: Array,
      default: null
    },
    /**
      * Whether to dispatch a scroll to the bottom event for pull-up loading
      */
    pullup: {
      type: Boolean,
      default: false
    },
    /**
      * Whether to dispatch a top drop-down event for a drop-down refresh
      */
    pulldown: {
      type: Boolean,
      default: false
    },
    /**
      * Whether to dispatch an event for the start of list scrolling
      */
    beforeScroll: {
      type: Boolean,
      default: false
    },
    /**
      * When the data is updated, refresh the scroll latency.
      */
    refreshDelay: {
      type: Number,
      default: 20
    }
  },
  data() {
    return {
      scroll: null
    }
  },
  mounted() {
    setTimeout(() => {
      this._initScroll()
    }, 20)
  },
  methods: {
    _initScroll() {
      if (!this.$refs.wrapper) { return }
      this.scroll = new BScroll(
        this.$refs.wrapper,
        {
          probeType: this.probeType,
          mouseWheel: {
            speed: 20,
            invert: false,
            easeTime: 300
          },
          click: this.click,
          scrollX: this.scrollX
        }
      )
      // Whether to dispatch scroll events
      if (this.listenScroll) {
        const me = this
        this.scroll.on('scroll', (pos) => {
          me.$emit('scroll', pos)
        })
      }
      // Whether to dispatch a scroll to the bottom event for pull-up loading
      if (this.pullup) {
        this.scroll.on('scrollEnd', () => {
          // Scroll down to the bottom
          if (this.scroll.y <= (this.scroll.maxScrollY + 50)) {
            this.$emit('scrollToEnd')
          }
        })
      }
      // Whether to dispatch a top drop-down event for a drop-down refresh
      if (this.pulldown) {
        this.scroll.on('touchend', (pos) => {
          // Pull down action
          if (pos.y > 50) {
            this.$emit('pulldown')
          }
        })
      }
      // Whether to dispatch an event for the start of list scrolling
      if (this.beforeScroll) {
        this.scroll.on('beforeScrollStart', () => {
          this.$emit('beforeScroll')
        })
      }
    },
    disable() {
      this.scroll && this.scroll.disable()
    },
    enable() {
      this.scroll && this.scroll.enable()
    },
    refresh() {
      this.scroll && this.scroll.refresh()
    },
    scrollTo() {
      this.scroll && this.scroll.scrollTo.apply(this.scroll, arguments)
    },
    scrollToElement() {
      // 代理better-scroll的scrollToElement方法
      this.scroll && this.scroll.scrollToElement.apply(this.scroll, arguments)
    }
  },
  watch: {
    // Listen to the data changes, delay the refreshDelay time and call refresh method to recalculate to ensure that the scrolling effect is normal
    data() {
      setTimeout(() => {
        this.refresh()
      }, this.refreshDelay)
    }
  }
}
</script>
