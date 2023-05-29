<template>
  <div class="product-item">
    <div class="product-img">
      <b-img-lazy :src="productInfo.productImage" alt="product-img" />
    </div>
    <div class="product-price">
      <span>{{isSelection?'$':''}} {{productInfo.productPrice}}</span>
      <div v-if="isSelection||isCommission" class="share-wrap" @click.stop="onShare">
        <svg-icon icon-class="share" />
      </div>
    </div>
    <div class="product-title">{{productInfo.productName}}</div>
    <div v-if="productInfo.commissionAmount" class="product-commission">Commission ≥ ${{ productInfo.commissionAmount }}</div>
    <div v-if="productInfo.rate" class="product-rate">Rate {{ productInfo.rate }}%</div>
    <div class="footer-btn" :class="{'footer-btn-show':productInfo.active}">
      <div class="operation-box">
        <b-button
          class="second-btn operation-btn d-none d-md-block"
          @click.stop="onLeftClick('pc')"
          size="sm"
        >
          {{ leftBtn }}
        </b-button>
        <b-button
          class="second-btn operation-btn d-block d-md-none"
          @click.stop="onLeftClick('m')"
          size="sm"
        >
          {{ leftBtn }}
        </b-button>
        <b-button
          class="primary-btn operation-btn"
          variant="primary"
          size="sm"
          @click.stop="onRightClick"
        >
          {{ $t('common.remove') }}
        </b-button>
      </div>
    </div>
    <div v-if="productInfo.productSource" class="product-source" @click.stop="onOpenClick">
      Source: <span>Sync shESG Affiliate</span>
    </div>
    <div v-if="showSyncBtn" class="operation-btns pt-2">
      <b-button
        v-if="productInfo.isImported"
        class="success-btn operation-btn"
        variant="outline-success"
        size="sm"
      >
        <b-icon icon="check-circle-fill" />
        Sync Success
      </b-button>
      <b-overlay
        v-else
        :show="productInfo.loading"
        rounded
        opacity="0.6"
        spinner-small
        spinner-variant="primary"
        class="d-inline-block"
      >
        <b-button
          class="main-btn operation-btn"
          variant="primary"
          size="sm"
          @click.stop="onBtnClick"
        >
          <span class="d-none d-md-block">Sync to  my shESG products</span>
          <span class="d-block d-md-none">Sync to  my shESG</span>
        </b-button>
      </b-overlay>
    </div>
  </div>
</template>

<script>
import { joinUrl, copy } from '@/utils'
export default {
  props: {
    type: {
      type: String,
      default: ''
    },
    productInfo: {
      type: Object,
      default: () => {}
    },
    productHeight: {
      type: [String, Number],
      default: ''
    },
    leftBtn: {
      type: String,
      default: ''
    },
    showSyncBtn: {
      type: Boolean,
      default: false
    },
    index: {
      type: Number,
      default: 0
    }
  },
  data() {
    return {
    }
  },
  inject: ['traceEventInfo'],
  computed: {
    isSelection() {
      return !this.type
    },
    isCommission() {
      return this.type === 'commissionProduct'
    }
  },
  mounted() {
    const modalEle = document.querySelector('#affiliateModal #affiliateModal___BV_modal_content_')
    if (modalEle && modalEle.getAttribute('tabindex')) {
      modalEle.removeAttribute('tabindex')
    }
  },
  methods: {
    onRightClick() {
      this.$emit('onRightClick', this.productInfo)
    },
    onLeftClick(device) {
      this.$emit('onLeftClick', this.productInfo, device)
    },
    onBtnClick() {
      this.$emit('onBtnClick', this.productInfo, this.index)
    },
    onOpenClick() {
      this.$emit('onOpenClick')
    },
    onShare() {
      const copyText = joinUrl(this.productInfo.productUrl, { f: `bm|aff|yfaf|${this.traceEventInfo.aid}|||new|` })
      copy(copyText)
      this.$message(this.$t('commission.downlines.copySuccessInfo'))
    }
  }
}
</script>

<style lang="scss" scoped>
.product-item {
  position: relative;
  cursor: pointer;
  overflow: hidden;
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
    line-height: 15px;
    height: 30px;
    font-size: 12px;
    color: #555555;
    font-weight: 400;
    word-break: break-all;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 2;
    overflow: hidden;
  }
  .share-wrap {
    padding-left: 10px;
  }
  .product-commission {
    padding-top: 6px;
    font-size: 16px;
  }
  .product-rate {
    font-size: 12px;
    color: #888;
  }
  .product-source {
    padding-top: 2px;
    font-size: 12px;
    span {
      color: $main;
    }
  }
  .footer-btn {
    position: absolute;
    left: 0;
    right: 0;
    bottom: -48px;
    text-align: center;
    opacity: 0;
    width: 100%;
    background: $white;
    transition: all .6s;
    &-show {
      bottom: 0;
      display: block;
      opacity: 1;
      transition: all .6s;
    }
    .operation-box {
      display: flex;
      justify-content: space-between;
      padding: 10px 0 0;
    }
    .operation-btn {
      margin: 0 6px;
      width: 50%;
      font-size: 12px;
    }
  }
  .operation-btns {
    .b-overlay-wrap {
      width: 100%;
    }
    .operation-btn {
      width: 100%;
      box-shadow: none;
    }
    .success-btn {
      color: #63d860;
      background: $white;
      border-color: #ccc;
      box-shadow: none !important;
      .b-icon {
        font-size: 16px;
      }
    }
  }
  @media screen and (max-width: 540px) {
    .product-commission {
      font-size: 14px;
    }
  }
}
</style>
