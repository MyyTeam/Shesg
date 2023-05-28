/**
 * @name: draggable
 * @description: 
 */
const draggableMixin = {
  data () {
    return {
      elePos: {
        x: null,
        y: null
      },
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
      // Solve the sliding penetration problem
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
      // Sets the position of the drag element
      this.elePos.x = touch.clientX - this.diffOfTarget.x
      this.elePos.y = touch.clientY - this.diffOfTarget.y
      //Restrict elements to not go beyond the screen
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
      document.documentElement.scrollTop = this.offsetTop
    },
    pcDragEndHandler(e) {
      this.draggingHandler(e)
      this.dragEndHandler(e)
    }
  }
}

export default draggableMixin
