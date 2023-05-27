import request from '@/utils/request'
const { VUE_APP_GATEWAY_DS } = process.env

/**
 * 生成短链
*/
export function generateShortLink(params) {
  return request({
    url: `${VUE_APP_GATEWAY_DS}/short-url/generate/short-link`,
    method: 'get',
    params
  })
}

/**
 * 获取gate商品的图片
*/
export function getGateImg(params) {
  return request({
    url: `${VUE_APP_GATEWAY_DS}/short-url/get/short-link-images`,
    method: 'get',
    params
  })
}

/**
 * social 分析
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
