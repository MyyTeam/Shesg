import Mock from 'mockjs'
const { VUE_APP_GATEWAY_DS, VUE_APP_BASE_API } = process.env

const linkList = [
  {
    userId: null,
    id: '255349023233',
    url: 'https://www.vivaia.com/item/pointed-toe-ballet-flats-p_10000360.html',
    title: 'Pointed-Toe Ballet Flats (Aria 5°)sss',
    image: 'https://cdnimg.vivaia.com/vivaia/products/1677460553-03515b2e-1845-450b-835e-d85d49cf5f45.jpg',
    isAvailable: 1,
    type: 1,
    rank: 1,
    redirectUrl: null,
    description: null,
    gateItemcode: null,
    rate: null,
    commissionAmount: null,
    productPrice: 79.00,
    headerLinkId: null
  },
  {
    commissionAmount: 0,
    description: 'For Smart Watches Ultra 8 Series 49mm 1.99 Inch Screen Mixed Color Wireless Charging Silicagel Fashion Water Proof Apple Watch Screen Case',
    gateItemcode: '833797939',
    headerLinkId: '',
    id: '999999999',
    image: 'https://img4.dhresource.com/webp/m/0x0/f3/albu/km/s/18/e8f37049-a286-44be-be50-7d0558b7fbcc.jpg',
    isAvailable: 1,
    productPrice: 0,
    rank: 0,
    rate: 0,
    redirectUrl: 'https://www.dhgate.com/product/for-apple-smart-watches-ultra-8-series-49mm-caj-1/833797939.html?d1_page_num=1&dspm=pcen.sp.list.9.qicdlzR7BaHT9qsLe2aL&resource_id=833797939&scm_id=search.LIST..C.catalog1|2|0|unrerank|newes.newC.#s1-8-7;searl|2592358031:9',
    title: 'Smart Watches Ultra',
    type: 0,
    url: 'https://www.dhgate.com/product/for-apple-smart-watches-ultra-8-series-49mm-caj-1/833797939.html?d1_page_num=1&dspm=pcen.sp.list.9.qicdlzR7BaHT9qsLe2aL&resource_id=833797939&scm_id=search.LIST..C.catalog1|2|0|unrerank|newes.newC.#s1-8-7;searl|2592358031:9'
  },
  {
    commissionAmount: 0,
    description: 'Women wristband for Apple Watch Ultra Band Straps 8 49mm 7 6 se 41mm 45mm 38mm 42 mm lady luxury jewelry metal leather bracelet for iWatch diamond 40mm',
    gateItemcode: '795281657',
    headerLinkId: '',
    id: '888888888',
    image: 'https://img4.dhresource.com/webp/m/100x100/f3/albu/ry/j/27/321c4dca-6f9f-4278-8fe9-a1e5e5f0e0f3.jpg',
    isAvailable: 0,
    productPrice: 0,
    rank: 1,
    rate: 0,
    redirectUrl: 'https://www.dhgate.com/product/women-wristband-for-apple-watch-band-straps/795281657.html?dspm=pcen.pd.alsobuy.4.qR7OMQTolrf90GOiAeEE&resource_id=795281657&scm_id=rec.yml..._pcpdymlcppd_1to2_related_pcpdymlcppd_fm-jfy-filter_2209_null_greenScreenFlag_0.023985166475705567.#pcpdymlcppd-4-5|null::r4253475783',
    title: 'Women wristband for Apple Watch Ultra Band',
    type: 0,
    url: 'https://www.dhgate.com/product/women-wristband-for-apple-watch-band-straps/795281657.html?dspm=pcen.pd.alsobuy.4.qR7OMQTolrf90GOiAeEE&resource_id=795281657&scm_id=rec.yml..._pcpdymlcppd_1to2_related_pcpdymlcppd_fm-jfy-filter_2209_null_greenScreenFlag_0.023985166475705567.#pcpdymlcppd-4-5|null::r4253475783'
  },
  {
    commissionAmount: 0,
    description: 'Women wristband for Apple Watch Ultra Band Straps 8 49mm 7 6 se 41mm 45mm 38mm 42 mm lady luxury jewelry metal leather bracelet for iWatch diamond 40mm',
    gateItemcode: '795281657',
    headerLinkId: '',
    id: '77777777',
    image: 'https://img4.dhresource.com/webp/m/100x100/f3/albu/ry/j/27/321c4dca-6f9f-4278-8fe9-a1e5e5f0e0f3.jpg',
    isAvailable: 1,
    productPrice: 0,
    rank: 2,
    rate: 0,
    redirectUrl: 'https://www.dhgate.com/product/women-wristband-for-apple-watch-band-straps/795281657.html?dspm=pcen.pd.alsobuy.4.qR7OMQTolrf90GOiAeEE&resource_id=795281657&scm_id=rec.yml..._pcpdymlcppd_1to2_related_pcpdymlcppd_fm-jfy-filter_2209_null_greenScreenFlag_0.023985166475705567.#pcpdymlcppd-4-5|null::r4253475783',
    title: 'Women wristband for Apple Watch Ultra Band',
    type: 5,
    url: 'https://www.dhgate.com/product/women-wristband-for-apple-watch-band-straps/795281657.html?dspm=pcen.pd.alsobuy.4.qR7OMQTolrf90GOiAeEE&resource_id=795281657&scm_id=rec.yml..._pcpdymlcppd_1to2_related_pcpdymlcppd_fm-jfy-filter_2209_null_greenScreenFlag_0.023985166475705567.#pcpdymlcppd-4-5|null::r4253475783'
  },
  {
    commissionAmount: 0,
    description: '',
    gateItemcode: '795281657',
    headerLinkId: '',
    id: '66666667',
    image: 'https://img4.dhresource.com/webp/m/100x100/f3/albu/ry/j/27/321c4dca-6f9f-4278-8fe9-a1e5e5f0e0f3.jpg',
    isAvailable: 1,
    productPrice: 0,
    rank: 2,
    rate: 0,
    redirectUrl: '',
    title: 'Women wristband for Apple Watch Ultra Band',
    type: 5,
    url: 'https://www.dhgate.com/product/women-wristband-for-apple-watch-band-straps/795281657.html?dspm=pcen.pd.alsobuy.4.qR7OMQTolrf90GOiAeEE&resource_id=795281657&scm_id=rec.yml..._pcpdymlcppd_1to2_related_pcpdymlcppd_fm-jfy-filter_2209_null_greenScreenFlag_0.023985166475705567.#pcpdymlcppd-4-5|null::r4253475783'
  },
  {
    commissionAmount: 0,
    description: '',
    gateItemcode: '795281657',
    headerLinkId: '',
    id: '66666666',
    image: 'https://img4.dhresource.com/webp/m/100x100/f3/albu/ry/j/27/321c4dca-6f9f-4278-8fe9-a1e5e5f0e0f3.jpg',
    isAvailable: 1,
    productPrice: 0,
    rank: 2,
    rate: 0,
    redirectUrl: 'https://www.dhgate.com/product/women-wristband-for-apple-watch-band-straps/795281657.html?dspm=pcen.pd.alsobuy.4.qR7OMQTolrf90GOiAeEE&resource_id=795281657&scm_id=rec.yml..._pcpdymlcppd_1to2_related_pcpdymlcppd_fm-jfy-filter_2209_null_greenScreenFlag_0.023985166475705567.#pcpdymlcppd-4-5|null::r4253475783',
    title: 'Women wristband for Apple Watch Ultra Band',
    type: 6,
    url: 'https://www.dhgate.com/product/women-wristband-for-apple-watch-band-straps/795281657.html?dspm=pcen.pd.alsobuy.4.qR7OMQTolrf90GOiAeEE&resource_id=795281657&scm_id=rec.yml..._pcpdymlcppd_1to2_related_pcpdymlcppd_fm-jfy-filter_2209_null_greenScreenFlag_0.023985166475705567.#pcpdymlcppd-4-5|null::r4253475783'
  }
]
const recommendData = [
  {
    productId: 248821390864,
    productUrl: 'https://www.dhgate.com/product/women-wristband-for-apple-watch-band-straps/795281657.html?dspm=pcen.pd.alsobuy.4.qR7OMQTolrf90GOiAeEE&resource_id=795281657&scm_id=rec.yml..._pcpdymlcppd_1to2_related_pcpdymlcppd_fm-jfy-filter_2209_null_greenScreenFlag_0.023985166475705567.#pcpdymlcppd-4-5|null::r4253475783',
    title: 'ditsy Floral Flounce Sleeve A-line Dress x2N7#',
    imageUrl: 'https://image.dhgate.com/f2/albu/g22/M00/DA/5D/rBVaEmKsXY6ARHLZAAj5wc7S898191.jpg',
    price: 62.96,
    rate: '15%'
  },
  {
    productId: 248813550865,
    productUrl: 'https://www.dhgate.com/product/women-wristband-for-apple-watch-band-straps/795281657.html?dspm=pcen.pd.alsobuy.4.qR7OMQTolrf90GOiAeEE&resource_id=795281657&scm_id=rec.yml..._pcpdymlcppd_1to2_related_pcpdymlcppd_fm-jfy-filter_2209_null_greenScreenFlag_0.023985166475705567.#pcpdymlcppd-4-5|null::r4253475783',
    title: 'men Coconut Tree Print Baseball Collar Shirt & Shorts Without Tee T3FM#',
    imageUrl: 'https://image.dhgate.com/f2/albu/g22/M00/8B/25/rBVaE2KsEUiAAMw6AAVN5H2jrxE676.jpg',
    price: 50.07,
    rate: '15%'
  },
  {
    productId: 248821390848,
    productUrl: 'https://www.dhgate.com/product/women-wristband-for-apple-watch-band-straps/795281657.html?dspm=pcen.pd.alsobuy.4.qR7OMQTolrf90GOiAeEE&resource_id=795281657&scm_id=rec.yml..._pcpdymlcppd_1to2_related_pcpdymlcppd_fm-jfy-filter_2209_null_greenScreenFlag_0.023985166475705567.#pcpdymlcppd-4-5|null::r4253475783',
    title: 'backless Drawstring Side Dress e8Ha#',
    imageUrl: 'https://image.dhgate.com/f2/albu/g22/M01/F0/89/rBVaE2KsbjKAMrnPAAXURPwhIYk943.jpg',
    price: 34.10,
    rate: '15%'
  },
  {
    productId: 246509506818,
    productUrl: 'https://www.dhgate.com/product/women-wristband-for-apple-watch-band-straps/795281657.html?dspm=pcen.pd.alsobuy.4.qR7OMQTolrf90GOiAeEE&resource_id=795281657&scm_id=rec.yml..._pcpdymlcppd_1to2_related_pcpdymlcppd_fm-jfy-filter_2209_null_greenScreenFlag_0.023985166475705567.#pcpdymlcppd-4-5|null::r4253475783',
    title: 'DHgate Affiliate Products (60% Commission)',
    imageUrl: null,
    price: null,
    rate: '15%'
  },
  {
    productId: 250226313227,
    productUrl: 'https://www.dhgate.com/product/women-wristband-for-apple-watch-band-straps/795281657.html?dspm=pcen.pd.alsobuy.4.qR7OMQTolrf90GOiAeEE&resource_id=795281657&scm_id=rec.yml..._pcpdymlcppd_1to2_related_pcpdymlcppd_fm-jfy-filter_2209_null_greenScreenFlag_0.023985166475705567.#pcpdymlcppd-4-5|null::r4253475783',
    title: 'Men Letter & Bear Print Sweatshirt 08S2#',
    imageUrl: 'https://image.dhgate.com/f2/albu/g20/M01/C6/65/rBVaqWIHzCWABfINAAY7KslQZ-c666.jpg',
    price: 29.75,
    rate: '15%'
  },
  {
    productId: 242793129472,
    productUrl: 'https://www.dhgate.com/product/women-wristband-for-apple-watch-band-straps/795281657.html?dspm=pcen.pd.alsobuy.4.qR7OMQTolrf90GOiAeEE&resource_id=795281657&scm_id=rec.yml..._pcpdymlcppd_1to2_related_pcpdymlcppd_fm-jfy-filter_2209_null_greenScreenFlag_0.023985166475705567.#pcpdymlcppd-4-5|null::r4253475783',
    title: 'bai',
    imageUrl: '',
    price: null,
    rate: '15%'
  }
]
const userData = {
  userId: 'd16edf46947fa936fe1bfe7db6d8e111',
  username: 'akiko',
  affiliateCode: '267989',
  email: 'asdf@gmail.com',
  img: ''
}

Mock.mock(`${VUE_APP_BASE_API}${VUE_APP_GATEWAY_DS}/product/find/links`, {
  code: 200,
  message: 'success',
  success: true,
  data: linkList
})

Mock.mock(`${VUE_APP_BASE_API}${VUE_APP_GATEWAY_DS}/product/get/user-collection-links`, {
  code: 200,
  message: 'success',
  success: true,
  data: {
    headerNum: 10,
    normalNum: 4,
    productsNum: 2
  }
})

Mock.mock(`${VUE_APP_BASE_API}${VUE_APP_GATEWAY_DS}/product/add/single-link`, {
  success: true,
  code: 200,
  data: '285832662016',
  message: 'success'
})

Mock.mock(RegExp(`${VUE_APP_BASE_API}${VUE_APP_GATEWAY_DS}/product/find/user-links.*`), {
  code: 200,
  data: linkList.filter(item => item.isAvailable)
})

Mock.mock(`${VUE_APP_BASE_API}${VUE_APP_GATEWAY_DS}/user-detail-info`, {
  code: 200,
  data: userData
})

Mock.mock(RegExp(`${VUE_APP_BASE_API}${VUE_APP_GATEWAY_DS}/user-detail-info-by-name.*`), {
  code: 200,
  data: userData
})
Mock.mock(`${VUE_APP_BASE_API}${VUE_APP_GATEWAY_DS}/openai/recommend`, {
  code: 200,
  data: {
    code: 0,
    count: 6,
    data: recommendData
  }
})

Mock.setup({
  // 随机延时200-300毫秒，模拟网络延时
  timeout: '200-300'
})
