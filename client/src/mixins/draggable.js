/**
 * @name: draggable
 * @description: 元素拖拽
 */
const draggableMixin = {
  data () {
    return {
      // 元素位置，用于样式绑定，动态更新位置(:style="{left: `${x}px`, top: `${y}px`}")
      elePos: {
        x: null,
        y: null
      },
      // 手指（鼠标）触摸点[即拖拽开始的位置]距离拖拽元素左上角的距离
      diffOfTarget: {
        x: 0,
        y: 0
      },
      offsetTop: 0
    }
  },
  methods: {
    dragStartHandler (e) {
      let touch = e
      if (e.touches) {
        touch = e.touches[0]
      }
      this.diffOfTarget.x = touch.clientX - e.target.offsetLeft
      this.diffOfTarget.y = touch.clientY - e.target.offsetTop
      // 解决滑动穿透问题
      const scrollTop = document.scrollingElement.scrollTop
      this.offsetTop = scrollTop
      document.body.classList.add('modal-open')
      document.body.style.top = -scrollTop + 'px'
    },
    draggingHandler (e) {
      let touch = e
      if (e.touches) {
        touch = e.touches[0]
      }
      // 设置拖拽元素的位置
      this.elePos.x = touch.clientX - this.diffOfTarget.x
      this.elePos.y = touch.clientY - this.diffOfTarget.y
      // 限制元素不能超过屏幕
      if (this.elePos.x < 0) {
        this.elePos.x = 0
      } else if (this.elePos.x > window.screen.width) {
        this.elePos.x = window.screen.width - e.target.clientWidth
      }
      if (this.elePos.y < 0) {
        this.elePos.y = 0
      } else if (this.elePos.y > window.screen.height) {
        this.elePos.y = window.screen.height - e.target.clientHeight
      }
    },
    dragEndHandler (e) {
      document.body.classList.remove('modal-open')

      // 原博主的这句话没加，导致最后拖曳了，会返回到顶部，加上去就没问题了
      document.documentElement.scrollTop = this.offsetTop
    },
    pcDragEndHandler(e) {
      this.draggingHandler(e)
      this.dragEndHandler(e)
    }
  }
}

export default draggableMixin
