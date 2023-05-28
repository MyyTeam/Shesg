<template>
  <div class="collapse-share p-2">
    <p class="share-info px-0 px-md-5 text-center">Share this customized link, then when a customer clicks the link and places an order, you will earn commission</p>
    <div class="title">Customized link</div>
    <div class="short-link-card p-2">
      <span class="short-link">{{ linkUrl }}</span>
      <b-button
        v-trace:[linkSpmc].click="traceEventInfo"
        spm-index="copyflink"
        class="copy-btn main-btn"
        variant="primary"
        size="sm"
        @click="handelCopy"
      >{{ $t('common.Copy') }}</b-button>
    </div>
  </div>
</template>

<script>
import FileSaver from 'file-saver'
import { copy } from '@/utils'
export default {
  props: {
    data: {
      type: Object,
      default: () => {}
    },
    linkSpmc: {
      type: String,
      default: ''
    }
  },
  data() {
    return {
      productImages: []
    }
  },
  inject: ['traceEventInfo'],
  computed: {
    linkUrl() {
      return this.data.redirectUrl || this.data.url
    },
    itemcode() {
      const reg = /(\d+)\.html/
      const match = this.data.url.match(reg)
      return match && match[1]
    }
  },
  watch: {
    linkUrl: {
      handler(val) {

      },
      immediate: true
    }
  },
  methods: {
    handelCopy() {
      copy(this.linkUrl)
      this.$message(this.$t('commission.downlines.copySuccessInfo'))
    },
    handleDownload() {
      this.productImages.map((item, i) => {
        const originalImg = item?.replace(/\/300x300/, '')
        this.downloadIamge(originalImg, `${this.itemcode}-${i + 1}-shesg`)
      })
    },
    downloadIamge(imgsrc, name) {
      var image = new Image()
      image.setAttribute('crossOrigin', 'anonymous')
      image.onload = function() {
        var canvas = document.createElement('canvas')
        canvas.width = image.width
        canvas.height = image.height
        var context = canvas.getContext('2d')
        context.drawImage(image, 0, 0, image.width, image.height)
        var url = canvas.toDataURL('image/png') // Get the base64-encoded data of the image
        FileSaver.saveAs(url, `${name}.png`)
      }
      image.src = imgsrc
    }
  }
}
</script>

<style lang="scss" scoped>
.collapse-share {
  font-size: 16px;
  p {
    color: $text;
  }
  .title {
    padding: 16px 0 4px;
    font-weight: 600;
  }
  .short-link-card {
    border: 1px solid $border;
    display: flex;
    align-items: center;
    width: 100%;
    .copy-btn {
      margin-left: 10px;
      width: 60px;
    }
    span {
      flex: 1;
      word-break: break-all;
      color: $baseFont;
    }
  }
  .product-image {
    width: 100%;
    height: 100%;
    object-fit: contain;
    border-radius: 4px;
    overflow: hidden;
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
  @media screen and (max-width: 540px) {
    font-size: 14px;
    ::v-deep {
      .product-images-list {
        &.container {
          padding-left: 10px;
          padding-right: 10px;
        }
        .col-6 {
          padding: 5px;
        }
      }
    }
  }
}
</style>
