/**
 * @description 设置网页description
 */

export const setDescription = (desc) => {
  const description = desc || 'Promote products with coupons to earn high commission, invite downlines to earn extra bonus, no startup cost,earn in spare time.'
  const head = document.getElementsByTagName('head')
  const metaNode = document.createElement('meta')
  if (document.querySelector('meta[name="description"]')) {
    document.querySelector('meta[name="description"]').setAttribute('content', description)
  } else {
    metaNode.setAttribute('name', 'description')
    metaNode.setAttribute('content', description)
    head[0].appendChild(metaNode)
  }
}
