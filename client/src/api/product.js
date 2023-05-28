import request from '@/utils/request'
const { VUE_APP_GATEWAY_DS } = process.env

// Add/modify a single link
export function addSingleLink(data) {
  return request({
    url: `${VUE_APP_GATEWAY_DS}/product/add/single-link`,
    method: 'post',
    data
  })
}
// Modifying links
export function changeLinks(data) {
  return request({
    url: `${VUE_APP_GATEWAY_DS}/product/add/links`,
    method: 'post',
    data
  })
}

// Removing Links
export function deleteLink(params) {
  return request({
    url: `${VUE_APP_GATEWAY_DS}/product/delete/link`,
    method: 'get',
    params
  })
}

// Querying links
export function getLinks(data) {
  return request({
    url: `${VUE_APP_GATEWAY_DS}/product/find/links`,
    method: 'post',
    data
  })
}

// Query the grouping of the commodity module
export function getProductGroups() {
  return request({
    url: `${VUE_APP_GATEWAY_DS}/outside-product/find/cate`,
    method: 'get'
  })
}

// Query the products of the products module
export function getLinkProduct(params) {
  return request({
    url: `${VUE_APP_GATEWAY_DS}/outside-product/find/link/products`,
    method: 'get',
    params
  })
}

// Query the number of items in each cate
export function getGroupProductsNum(params) {
  return request({
    url: `${VUE_APP_GATEWAY_DS}/outside-product/find/cate-products-num`,
    method: 'get',
    params
  })
}

/**
 * Query Alliance products
 */
export function getAffiliateProductList(data) {
  return request({
    url: `${VUE_APP_GATEWAY_DS}/openai/recommend`,
    method: 'post',
    data
  })
}

/**
 * Get gate product images
 */
export function getGateProduct(params) {
  return request({
    url: `${VUE_APP_GATEWAY_DS}/outside-product/get/gate-products-images`,
    method: 'get',
    params
  })
}

/**
 * Copy the links of another account
 */
export function copyLinksByUsername(params) {
  return request({
    url: `${VUE_APP_GATEWAY_DS}/product/copy/links-from-others`,
    method: 'get',
    params
  })
}

/**
 * Get the number of links for each module
 */
export function getLinksCount(params) {
  return request({
    url: `${VUE_APP_GATEWAY_DS}/product/get/user-collection-links`,
    method: 'get',
    params
  })
}
