<template>
  <div class="product-item" ref="productItem" @click="linkProduct(productInfo)">
    <div class="product-img">
      <b-img-lazy :src="productInfo.image || productInfo.imageUrl||noDataImg"  alt="product-img" />
    </div>
    <div class="product-price">
      <span>${{productInfo.price?productInfo.price:productInfo.productPrice}}</span>
      <b-icon icon="cart3" class="cart-icon" />
    </div>
    <div class="product-title">【ESG】{{title||"title"}}</div>
    <i class="esg-flag">ESG</i>
  </div>
</template>

<script>
export default {
  props: {
    productInfo: {
      type: Object,
      default: () => {}
    }
  },
  data() {
    return {
      noDataImg: require('@/assets/common/no-data.png')
    }
  },
  computed: {
    title() {
      return this.productInfo.title || this.productInfo.productName
    },
    url() {
      let { url } = this.productInfo
      if (url && !/^(https?):\/\//.test(url)) {
        url = `https://${url}`
      }
      return this.productInfo.redirectUrl || url || this.productInfo.productUrl
    }
  },
  methods: {
    linkProduct({ url, redirectUrl }) {
      if (!url && !redirectUrl) return
      window.open(redirectUrl || url)
    }
  }
}
</script>

<style lang="scss" scoped>
.product-item {
  margin-bottom: 14px;
  position: relative;
  cursor: pointer;
  background: $white;
  padding: 10px;
  border-radius: 4px;
  .product-img {
    position:relative;
    width:100%;
    height:0;
    padding-top:100%;
    img {
      width:100%;
      height:100%;
      top:0;
      left:0;
      position: absolute;
      object-fit: contain;
      &:after{
        content: "";
        display: inline-block;
        position: absolute;
        z-index: 2;
        top: 0;
        left: 0;
        width: 100%;
        height:  100%;
        background: url("~@/assets/common/no-image.png") no-repeat center center;
        background-size: contain;
        background-color: #fff;
      }
    }

  }
  .product-price {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 14px 0 10px;
    font-weight: 600;
    font-size: 16px;
  }
  .product-title {
    font-size: 14px;
    color: #555555;
    font-weight: 600;
    width: 100%;
    overflow: hidden;
    line-height: 16px;
    height: 32px;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 2;
    word-break: break-all;
  }
  .cart-icon {
    color: $main;
  }
  .esg-flag{
      position: absolute;
      right: 10px;
      top: 12px;
      list-style: none;
      background-color: #A0D9F6;
      color: white;
      font-size: 12px;
      font-weight: bolder;
    }
}
</style>
