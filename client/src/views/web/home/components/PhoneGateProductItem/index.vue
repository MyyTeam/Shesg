<template>
  <div
    v-trace:normallink.click.expose="{...traceEventInfo,title,url}"
    class="phone-product-item"
    @click="linkUrl(linkItem)">
    <div class="product-img">
      <b-img-lazy :src="linkItem.image || linkItem.productImage" alt="product-img" />
    </div>
    <div class="product-info">
      <div class="product-title">{{title}}</div>
      <div v-if="linkItem.productPrice" class="product-price">
        <span>${{linkItem.productPrice}}</span>
        <!-- <b-icon icon="cart3" class="cart-icon" /> -->
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    traceEventInfo: {
      type: Object,
      default: () => {}
    },
    linkItem: {
      type: Object,
      default: () => {}
    }
  },
  data() {
    return {}
  },
  computed: {
    title() {
      return this.linkItem.title || this.linkItem.productName
    },
    url() {
      return this.linkItem.redirectUrl || this.linkItem.url || this.linkItem.productUrl
    }
  },
  methods: {
    linkUrl({ url, redirectUrl }) {
      if (!url && !redirectUrl) return
      window.open(redirectUrl || url)
    }
  }
}
</script>

<style lang="scss" scoped>
.phone-product-item {
  overflow: hidden;
  margin-bottom: 14px;
  // padding-bottom: 14px;
  cursor: pointer;
  background: $white;
  padding: 10px;
  border-radius: 4px;
  display: flex;
  .product-img {
    overflow: hidden;
    position:relative;
    flex-shrink: 0;
    margin-right: 10px;
    width: 80px;
    height: 80px;
    background: $white;
    border-radius: 6px;
    img {
      width:100%;
      height:100%;
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
    padding: 6px 0;
    font-weight: 600;
    font-size: 16px;
  }
  .product-title {
    width: 100%;
    overflow: hidden;
    line-height: 15px;
    height: 45px;
    font-size: 12px;
    color: #555555;
    font-weight: 600;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 3;
    word-break: break-all;
  }
  .cart-icon {
    color: $main;
  }
}
</style>
