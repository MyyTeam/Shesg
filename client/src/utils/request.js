import axios from 'axios'
import { getToken } from '@/utils/auth'
import { isBlob } from '@/utils/validate'
import Message from '@/plugins/Message'
import store from '@/store'
const { VUE_APP_BASE_API } = process.env
const service = axios.create({
  baseURL: VUE_APP_BASE_API, // url = base url + request url
  timeout: 60000 // request timeout
})

// request interceptor
service.interceptors.request.use(
  config => {
    // do something before request is sent
    const token = getToken()
    if (token) {
      config.headers.Authorization = `Bearer ${token}`
    }
    config.headers['Accept-Language'] = store.getters.language
    return config
  },
  error => {
    // do something with request error
    console.log(error) // for debug
    return Promise.reject(error)
  }
)

// response interceptor
service.interceptors.response.use(
  response => {
    const res = response.data
    if (response.config.responseType === 'blob' && isBlob(res)) {
      // if the responseType is blob, judge the constructor of res
      return response
    } else if (res.code !== 200) {
    // if the custom code is not 200, it is judged as an error.
      Message.message({
        message: res.message || 'Error',
        type: 'error'
      })
      return Promise.reject(res)
    } else {
      return res
    }
  },
  async error => {
    const { response } = error
    let message = null
    if (response) {
      message = response.data.message
    }
    Message.message({
      message: message || error.message,
      type: 'error'
    })
    return Promise.reject(error)
  }
)

export default service
