<template>
  <div class="recommend-card">
    <div class="recommend-card__title p-3 d-flex justify-content-between">
      <div class="title">ESG for you</div>
    </div>
    <div class="recommend-card__info px-3 pb-3">
      Shesg officials have already listed the following affiliate products for you. The products could be displayed on your customers' end
    </div>
    <div v-if="!showCollapse" class="recommend-card--closed px-3 py-2">
      Status: closed ( you can turn on the gray button to activate this part)
    </div>
    <b-collapse id="collapse-recommend" v-model="showCollapse" class="collapse-card pb-3">
      <div class="collapse-card__content px-3" @scroll="scrollChange">
        <div class="product-card">
          <div v-for="item in affiliateProductList" :key="item.productId" class="product-item-wrap">
            <div class="product-item" @click="linkProduct(item.productUrl)">
              <div class="product-title">【ESG】{{ item.title }}</div>
              <div class="product-info">
                <div class="product-img">
                  <b-img-lazy :src="item.imageUrl" alt="product-img" />
                </div>
                <div class="product-info__right">
                  <div class="product-price">
                    <span>${{ item.price }}</span>
                    <div class="share-wrap" @click.stop="onShare(item.productUrl)">
                      <svg-icon icon-class="share" />
                    </div>
                  </div>
                  <div v-if="item.commissionAmount || item.rate" class="product-commission">
                    <!-- <span v-if="item.commissionAmount">Commission ≥ ${{ item.commissionAmount }}</span> -->
                    <span v-if="item.rate" class="product-rate">Rate: {{ item.rate }}</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="loading-wrapper" v-if="finish">-- No Data --</div>
        <div class="loading-wrapper" v-else>Load More...</div>
      </div>
    </b-collapse>
  </div>
</template>

<script>
import { getAffiliateProductList, changeLinks } from '@/api/product'
import { isMobile, throttle, joinUrl, copy } from '@/utils'
// import bus from '@/utils/bus'
export default {
  props: {
    data: {
      type: Object,
      default: () => {}
    },
    index: {
      type: Number,
      default: 0
    }
  },
  data() {
    return {
      showCollapse: true,
      linkInfo: {},
      query: {
        keyWord: '',
        page: 1,
        pageSize: 6
      },
      total: 0,
      finish: false,
      affiliateProductList: []
    }
  },
  inject: ['traceEventInfo'],
  watch: {
    data: {
      handler(val) {
        this.linkInfo = val
        this.showCollapse = !!this.linkInfo.isAvailable
      },
      immediate: true
    }
  },
  created() {
    this.query.pageSize = !isMobile() ? 8 : 3
    this.getRecommendProduct()
  },
  // mounted() {
  //   bus.$on('open-affiliate', () => {
  //     this.openAffiliateModal()
  //   })
  // },
  // beforeDestroy() {
  //   bus.$off('open-affiliate')
  // },
  methods: {
    getRecommendProduct() {
      if (this.finish) return
      this.loading = true
      this.query.userId = 'd16edf46947fa936fe1bfe7db6d8e111'
      getAffiliateProductList(this.query).then(res => {
        const { data, count } = res
        this.affiliateProductList = this.affiliateProductList.concat(data)
        this.total = count
        if (this.affiliateProductList.length >= this.total) {
          this.finish = true
        }
        this.query.page++
      }).finally(() => {
        this.loading = false
      })
    },
    changeLinkStatus() {
      this.showCollapse = !!this.linkInfo.isAvailable
      changeLinks([this.linkInfo]).then(() => {
        this.$emit('update', this.linkInfo, this.index)
      })
    },
    scrollChange: throttle(function(e) {
    }, 500),
    onShare(productUrl) {
      const copyText = joinUrl(productUrl, { f: `bm|aff|yfaf|${this.traceEventInfo.aid}|||new|` })
      copy(copyText)
      this.$message(this.$t('commission.downlines.copySuccessInfo'))
    },
    linkProduct(productUrl) {
      const url = joinUrl(productUrl, { f: `bm|aff|yfaf|${this.traceEventInfo.aid}|||new|` })
      window.open(url)
    }
  }
}
</script>

<style lang="scss" scoped>
.recommend-card {
  margin: 16px;
  background: $white;
  box-shadow: 0 4px 8px 0 rgb(0 0 0 / 16%);
  &__info {
    color: $gray;
  }
  &--closed {
    font-weight: 600;
    color: #484848;
    background: #f3f3f1;
  }
  .title {
    font-weight: 600;
    font-size: 16px;
  }
  .toggle {
    margin-top: -3px;
    margin-right: -10px;
  }
  .collapse-card__content {
    max-height: 360px;
    overflow: auto;
    .product-card {
      display: flex;
      flex-wrap: wrap;
    }
    .loading-wrapper {
      padding-bottom: 10px;
      text-align: center;
      color: #888;
    }
    .product-item-wrap {
      padding: 0 8px;
      width: 50%;
    }
    .product-item {
      margin-bottom: 16px;
      padding: 10px;
      background: #f5f7f9;
      border-radius: 6px;
      cursor: pointer;
      .product-title {
        line-height: 16px;
        height: 16px;
        font-size: 14px;
        color: #282828;
        font-weight: 400;
        word-break: break-all;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 1;
        overflow: hidden;
      }
      .product-info {
        padding: 10px 0 0;
        display: flex;
        &__right {
          flex: 1;
          display: flex;
          flex-direction: column;
        }
      }
      .product-img {
        overflow: hidden;
        position:relative;
        flex-shrink: 0;
        margin-right: 10px;
        width: 60px;
        height: 60px;
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
        justify-content: space-between;
        align-items: center;
        margin-bottom: auto;
        padding-top: 4px;
        font-weight: 600;
        font-size: 16px;
        // cursor: pointer;
      }
      .product-commission {
        font-size: 13px;
        color: #8e8c8c;
      }
      .product-rate {
        margin-left: 8px;
        color: #a5a2a2;
      }
    }
  }
  @media screen and (max-width: 540px) {
    margin: 0 0 30px;
    .title {
      font-size: 14px;
    }
    .collapse-card__content .product-item-wrap {
      padding: 0;
      width: 100%;
    }
  }
}
</style>
