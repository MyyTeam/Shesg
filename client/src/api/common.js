import request from '@/utils/request'
const { VUE_APP_GATEWAY_DS } = process.env

/**
 * Generate short chains
*/
export function generateShortLink(params) {
  return request({
    url: `${VUE_APP_GATEWAY_DS}/short-url/generate/short-link`,
    method: 'get',
    params
  })
}

/**
 * Get an image of the gate product
*/
export function getGateImg(params) {
  return request({
    url: `${VUE_APP_GATEWAY_DS}/short-url/get/short-link-images`,
    method: 'get',
    params
  })
}

/**
 * social
 * @param {*} data
 * @returns
 */
export function socialPost(data) {
  return request({
    url: `${VUE_APP_GATEWAY_DS}/openai/socialPost`,
    method: 'post',
    data
  })
}
