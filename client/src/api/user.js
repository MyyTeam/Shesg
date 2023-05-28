import request from '@/utils/request'
const { VUE_APP_GATEWAY_UAA, VUE_APP_GATEWAY_DS } = process.env

// Username password get token
export function login(data) {
  return request({
    url: `${VUE_APP_GATEWAY_DS}/login`,
    method: 'post',
    data
  })
}

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
 * The user's order information
 */
export function getOrderList(data) {
  return request({
    url: `${VUE_APP_GATEWAY_DS}/link-myy/find/user-referral-orders-info`,
    method: 'post',
    data
  })
}
