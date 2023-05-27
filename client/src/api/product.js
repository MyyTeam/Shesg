import request from '@/utils/request'
const { VUE_APP_GATEWAY_DS } = process.env

// 单独新增/修改一个link
export function addSingleLink(data) {
  return request({
    url: `${VUE_APP_GATEWAY_DS}/product/add/single-link`,
    method: 'post',
    data
  })
}
// 修改links
export function changeLinks(data) {
  return request({
    url: `${VUE_APP_GATEWAY_DS}/product/add/links`,
    method: 'post',
    data
  })
}

// 删除link
export function deleteLink(params) {
  return request({
    url: `${VUE_APP_GATEWAY_DS}/product/delete/link`,
    method: 'get',
    params
  })
}

// 查询links
export function getLinks(data) {
  return request({
    url: `${VUE_APP_GATEWAY_DS}/product/find/links`,
    method: 'post',
    data
  })
}

// 查询商品模块的分组
export function getProductGroups() {
  return request({
    url: `${VUE_APP_GATEWAY_DS}/outside-product/find/cate`,
    method: 'get'
  })
}

// 查询商品模块的商品
export function getLinkProduct(params) {
  return request({
    url: `${VUE_APP_GATEWAY_DS}/outside-product/find/link/products`,
    method: 'get',
    params
  })
}

// 查询各个cate的商品数量
export function getGroupProductsNum(params) {
  return request({
    url: `${VUE_APP_GATEWAY_DS}/outside-product/find/cate-products-num`,
    method: 'get',
    params
  })
}

/**
 * 查询联盟商品
 */
export function getAffiliateProductList(data) {
  return request({
    url: `${VUE_APP_GATEWAY_DS}/openai/recommend`,
    method: 'post',
    data
  })
}

/**
 * 获取gate商品图片
 */
export function getGateProduct(params) {
  return request({
    url: `${VUE_APP_GATEWAY_DS}/outside-product/get/gate-products-images`,
    method: 'get',
    params
  })
}

/**
 * 复制另一个账户的links
 */
export function copyLinksByUsername(params) {
  return request({
    url: `${VUE_APP_GATEWAY_DS}/product/copy/links-from-others`,
    method: 'get',
    params
  })
}

/**
 * 获取各模块link数量
 */
export function getLinksCount(params) {
  return request({
    url: `${VUE_APP_GATEWAY_DS}/product/get/user-collection-links`,
    method: 'get',
    params
  })
}
