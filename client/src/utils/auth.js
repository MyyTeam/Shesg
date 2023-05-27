import Cookies from 'js-cookie'
import { isNumber } from '@/utils/validate'
const TokenKey = 'Afkol-Access-Token'
const UserInfoKey = 'Afkol-User-Info'
const UserIdKey = 'd1_userid'
const FKey = 'ref_f'
const InvitationKey = 'Afkol-Invitation'

export function getToken () {
  return Cookies.get(TokenKey)
}

export function setToken (token, expires) {
  expires = isNumber(expires) ? Math.ceil(expires / 3600 / 24) : 7 // 默认7天
  return Cookies.set(TokenKey, token, {
    expires
  })
}

export function removeToken () {
  return Cookies.remove(TokenKey)
}

export function getUserInfo() {
  const userInfo = window.localStorage.getItem(UserInfoKey)
  return userInfo ? JSON.parse(userInfo) : null
}

export function setUserInfo(userInfo) {
  return window.localStorage.setItem(UserInfoKey, userInfo)
}

export function removeUserInfo() {
  return window.localStorage.removeItem(UserInfoKey)
}

// 获取f值
export function getF() {
  return Cookies.get(FKey) || ''
}

// userId（用于埋点）
export function setUserId(data) {
  return window.localStorage.setItem(UserIdKey, data)
}

export function getUserId() {
  return window.localStorage.getItem(UserIdKey)
}

export function removeUserId() {
  return window.localStorage.removeItem(UserIdKey)
}

// 邀请弹框展示
export function getInvitation() {
  return window.localStorage.getItem(InvitationKey) || 'show'
}

export function setInvitation(invitation) {
  return window.localStorage.setItem(InvitationKey, invitation)
}
