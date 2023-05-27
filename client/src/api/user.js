import request from '@/utils/request'
const { VUE_APP_GATEWAY_UAA, VUE_APP_GATEWAY_DS } = process.env

// 用户名密码获取token
export function login(data) {
  return request({
    url: `${VUE_APP_GATEWAY_DS}/login`,
    method: 'post',
    data
  })
}

// access_token刷新token
export function fetchRefreshToken(data) {
  return request({
    url: `${VUE_APP_GATEWAY_UAA}/oauth/refresh/token`,
    method: 'post',
    data
  })
}

export function getInfo(params) {
  return request({
    url: `${VUE_APP_GATEWAY_DS}/user-detail-info`,
    method: 'get',
    params
  })
}

/**
 * 用户的订单信息
 */
export function getOrderList(data) {
  return request({
    url: `${VUE_APP_GATEWAY_DS}/link-myy/find/user-referral-orders-info`,
    method: 'post',
    data
  })
}
