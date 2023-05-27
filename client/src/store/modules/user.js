import { login, fetchRefreshToken } from '@/api/user'
import { getToken, setToken, removeToken, getUserInfo, setUserInfo, removeUserInfo, setUserId, removeUserId } from '@/utils/auth'
import router from '@/router'
import { param } from '@/utils'

const state = {
  token: getToken(),
  userInfo: getUserInfo()
}

const mutations = {
  SET_TOKEN: (state, data) => {
    const { accessToken, expiresIn } = data
    state.token = accessToken
    if (accessToken) {
      setToken(accessToken, expiresIn)
    } else {
      removeToken()
    }
  },
  SET_USERINFO: (state, data) => {
    state.userInfo = data
    if (data) {
      setUserId(data.userId || '')
      setUserInfo(JSON.stringify(data))
    } else {
      removeUserId()
      removeUserInfo()
    }
  }

}

const actions = {
  // user login
  login({ commit, state, dispatch }, loginFormData) {
    const { username, password } = loginFormData
    return new Promise((resolve, reject) => {
      login({
        username: username.trim().toLowerCase(),
        password: password
      }).then(async response => {
        const { data } = response
        if (!data.accessToken) {
          return reject(new Error('Wrong username or password!'))
        }
        commit('SET_TOKEN', data)
        // 获取用户信息和配置
        try {
          await dispatch('getInfo')
        } catch (error) {
          return reject(error)
        }
        resolve(data)
      }).catch(error => {
        reject(error)
      })
    })
  },
  // Token reflesh
  tokenRefresh({ commit, state, dispatch }) {
    return new Promise((resolve, reject) => {
      const refreshToken = state.userInfo ? state.userInfo.refresh_token : null
      if (!refreshToken) {
        return reject(new Error('Authorization is Empty!'))
      }
      fetchRefreshToken({ refreshToken }).then(async response => {
        const { data } = response
        commit('SET_TOKEN', data)
        try {
          await dispatch('getInfo')
        } catch (error) {
          return reject(error)
        }
        resolve(data)
      }).catch(error => {
        reject(error)
      })
    })
  },
  // get user info
  getInfo({ commit, state, dispatch }) {
    return new Promise((resolve, reject) => {
      commit('SET_USERINFO', {
        userId: 'd16edf46947fa936fe1bfe7db6d8e111',
        username: 'akiko',
        affiliateCode: '267989',
        email: 'asdf@gmail.com',
        img: ''
      })

      // getInfo().then(async response => {
      //   const { data } = response
      //   if (!data) {
      //     return reject(new Error('Verification failed, please Login again.'))
      //   }
      //   commit('SET_USERINFO', data)
      //   resolve(data)
      // }).catch(error => {
      //   reject(error)
      // })
    })
  },
  // 检查是否登录，未登录去登录页
  checkLoginHandle({ commit, state, dispatch }, query = {}) {
    return new Promise(resolve => {
      if (!state.token) {
        dispatch('logoutLocal').then(() => {
          router.push(`/login?${param(query)}`)
        }).catch(() => {})
        resolve(false)
      }
      resolve(true)
    })
  }

}

export default {
  namespaced: true,
  state,
  mutations,
  actions
}
