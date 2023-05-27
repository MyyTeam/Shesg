import Vue from 'vue' // 引入Vue
import MessageMain from './messageMain' // 引入上边定义好的message模板

const MessageBox = Vue.extend(MessageMain) // 使用Vue.extend来创建一个构造器
let instance // instance 变量用来保存实例
let timer = null // timer 变量用来保存定时器

// 定义一个function，参数为options，默认为一个对象
const Message = function(options = {}) {
  // 如果当前处在服务器端，则直接返回
  if (Vue.prototype.$isServer) return
  // 如果当前定时器已开启，说明页面上已经有一个message-box了，则不能再继续创建新的message-box
  if (timer) return
  // 对options做处理，如果直接传入string，则使其保存在options的message属性上
  if (typeof options === 'string') {
    options = {
      message: options
    }
  }
  // 初始化实例，并将options作为新的data传入，Vue会将options合并到原有的data上，覆盖原有的默认值，但是，在options中没有设置的是不会被改变的
  instance = new MessageBox({
    data: options
  })
  // 调用$mount方法，将当前实例渲染为真实DOM，生成$el，，如果不执行这一步，将拿不到 $el 的值，但是不指定DOM节点接管当前实例
  instance.vm = instance.$mount()
  // 使用原生js的API将当前实例的真实DOM追加到body中
  document.body.appendChild(instance.vm.$el)
  // 实例上的vm就是我们的Vue组件，所以我们可以通过vm访问到当前实例中的所有属性
  // 将visible设置为true，即显示当前message-box
  instance.vm.visible = true
  // 开启定时器
  timer = setTimeout(() => {
    // 在时间结束后将当前实例手动卸载
    instance.vm.$destroy()
    // 使用原生API将当前实例生成的DOM节点在真实的DOM树中删除
    instance.vm.$el.parentNode.removeChild(instance.vm.$el)
    // 清除定时器
    timer = null
  }, instance.vm.duration)
  // 定时器的时间使用vm中定义的时间
  return instance.vm
}

// 最终抛出一个对象，对象上我们可以使用 install 来扩展Vue的插件
// 当我们的对象上有install方法的时候，它接收第一个参数为Vue，
// 我这里为了方便使用，还在当前抛出的对象上定义了一个message方法，为了方便在axios的拦截器中使用；
export default {
  message: Message,
  install(Vue) {
    Vue.prototype.$message = Message
    Vue.message = Message
  }
}
