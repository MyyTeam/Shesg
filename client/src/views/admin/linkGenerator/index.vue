<template>
  <b-container fluid class="link-generator p-0 p-md-3">
    <template v-if="!showLinkInfo">
      <div class="link-generator-main">
        <div class="link-generator-main__inner">
          <div class="link-generator-search">
            <b-input-group>
              <b-form-input v-model.trim="query.url" :placeholder="placeholder" @keyup.enter.native="search" @focus.native="showPlaceholder=false" @blur="showPlaceholder=true" />
              <b-input-group-append class="d-none d-md-block">
                <b-button
                  spm-index="generatebtn"
                  variant="primary"
                  class="search-btn main-btn"
                  @click="search">
                  Generate
                </b-button>
              </b-input-group-append>
            </b-input-group>
            <div class="tip d-none d-md-block">Note: only for DHgate link</div>
            <b-button
              spm-index="generatebtn"
              variant="primary"
              block
              class="search-btn-m main-btn d-block d-md-none"
              @click="search">
              Generate
            </b-button>
          </div>
          <div class="link-generator-use">
            <div class="link-generator-use__title">How to use?</div>
            <div class="link-generator-use__content">
              <p>1. Find your desired page on <a href="https://www.dhgate.com/" target="_blank">DHgate.com</a></p>
              <p>2. Copy the link and paste it in the URL field</p>
              <p>3. Click  generate to get your promotion link</p>
              <p>4. Share the link and earn a commission for conversion of sales</p>
            </div>
          </div>
        </div>
      </div>
    </template>
    <template v-else>
      <div class="link-generator-link p-3 p-md-4">
        <p>{{ link.originalUrl }}</p>
        <b-button
          spm-index="generateanotherbtn"
          class="main-plain-btn toggle-btn mt-3"
          variant="outline-primary"
          @click="toggleGeneration"
        >
          Generate Another
        </b-button>
      </div>
      <div class="link-generator-product mt-3 p-4">
        <b-row>
          <b-col cols="12" md="8" class="">
            <div class="title">Customized Link</div>
            <div class="gray-info pt-2">Share this customized link, then when a customer clicks the link and places an order, you will earn commission</div>
            <div class="product-card mt-2 mt-md-3">
              <p v-if="link.productName" class="product-title">{{ link.productName }}</p>
              <p class="short-link">{{`https://new.dhgate.com/${link.shortUrl}`}}</p>
            </div>
            <div class="copy-btns mt-2 mt-md-3">
              <b-button
                spm-index="copyallbtn"
                variant="outline-dark"
                class="copy-btn second-btn"
                @click="copyAll">
                Copy All
              </b-button>
              <b-button
                spm-index="onlycopylinkbtn"
                variant="primary"
                class="copy-btn main-btn"
                @click="copyLink">
                Only Copy Link
              </b-button>
            </div>
          </b-col>
          <b-col cols="12" md="4" v-if="!isNotProduct">
            <div class="title mt-4 mt-md-0">Images</div>
            <div class="gray-info pt-2">Download the images for your promotion</div>
            <div class="image-list mt-2 mt-md-3">
              <template v-if="link.sampleImageVOS">
                <b-row>
                  <b-col cols="4" v-for="(item,index) in link.sampleImageVOS" :key="index" class="img-wrapper mb-3">
                    <div class="product-img">
                      <b-img-lazy :src="item.imgUrl" alt="product-img" />
                    </div>
                  </b-col>
                </b-row>
                <div class="download-btn text-center">
                  <b-button
                    spm-index="imagebtn"
                    variant="outline-dark"
                    class="download-btn second-btn"
                    @click="handleDownload"
                  >
                    <svg-icon icon-class="download" class="download-icon" />
                    Download All
                  </b-button>
                </div>
              </template>
              <div v-if="!loading && !link.sampleImageVOS" class="empty-card">
                <b-img-lazy :src="emptyImg" class="empty-img" alt="" />
                <p>No Data</p>
              </div>
              <b-overlay :show="loading" no-wrap />
            </div>
          </b-col>
        </b-row>
      </div>
    </template>
  </b-container>
</template>

<script>
import FileSaver from 'file-saver'
import { mapGetters } from 'vuex'
import { copy } from '@/utils'
import { generateShortLink, getGateImg } from '@/api/common'
export default {
  name: 'LinkGenerator',
  data() {
    return {
      loading: false,
      query: {
        url: '',
        userId: ''
      },
      link: {},
      showPlaceholder: true,
      showLinkInfo: false,
      isNotProduct: false,
      emptyImg: require('@/assets/common/no-data.png')
    }
  },
  async created() {

  },
  computed: {
    ...mapGetters(['userInfo']),

    placeholder() {
      return this.showPlaceholder ? 'Paste the DHgate link here' : ''
    },
    itemcode() {
      const reg = /(\d+)\.html/
      const match = this.query.url.match(reg)
      return match && match[1]
    }
  },
  methods: {
    search() {
      this.link = {}
      this.query.userId = this.userInfo?.userId
      generateShortLink(this.query).then(res => {
        this.showLinkInfo = true
        this.link = { ...this.link, ...res.data }
      })
      if (!this.query.url.includes('dhgate.com/product')) {
        this.isNotProduct = true
        return
      } else {
        this.isNotProduct = false
      }
      this.loading = true
      getGateImg(this.query).then(res => {
        this.link = { ...this.link, ...res.data }
      }).finally(() => {
        this.loading = false
      })
    },
    copy(copyText) {
      copy(copyText)
      this.$message('Copy Successfully.')
    },
    copyF() {
      const copyText = `f=bm|aff|yfaf|${this.userInfo.affiliateCode}|||new|`
      this.copy(copyText)
    },
    copyAll() {
      const copyText = `${this.link.productName}
https://new.dhgate.com/${this.link.shortUrl}`
      this.copy(copyText)
    },
    copyLink() {
      const copyText = `https://new.dhgate.com/${this.link.shortUrl}`
      this.copy(copyText)
    },
    toggleGeneration() {
      this.query.url = ''
      this.showLinkInfo = false
    },
    handleDownload() {
      this.link.sampleImageVOS.map((item, i) => {
        const originalImg = item.imgUrl?.replace(/\/300x300/, '')
        this.downloadIamge(originalImg, `${this.itemcode}-${i + 1}-SHEsg`)
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
        var url = canvas.toDataURL('image/png') // 得到图片的base64编码数据
        FileSaver.saveAs(url, `${name}.png`)
      }
      image.src = imgsrc
    }
  }
}
</script>

<style lang="scss" scoped>
.link-generator {
  font-size: 16px;
  &-main {
    padding: 100px 0;
    background-color: $white;
    &__inner {
      max-width: 1000px;
      margin: 0 auto;
    }
    .form-control {
      padding-left: 24px;
      padding-right: 24px;
      height: 56px;
      border-radius: 0;
    }
    .search-btn {
      padding-left: 24px;
      padding-right: 24px;
      height: 100%;
      font-weight: 600;
      border-radius: 0;
    }
    .tip {
      padding-top: 6px;
      font-size: 14px;
      color: #aaa;
    }
    .search-btn-m {
      margin-top: 16px;
      padding: 12px;
      border-radius: 0;
    }
  }
  &-use {
    padding-top: 60px;
    color: $gray;
    &__title {
      padding-bottom: 10px;
      font-size: 18px;
      color: #282828;
    }
    a {
      color: $main;
      text-decoration: underline;
    }
  }
  &-copy {
    background: #f2f2f0;
    .title {
      font-weight: 600;
      color: #282828;
    }
    .copy-card {
      display: flex;
      .f-value {
        display: flex;
        justify-content: center;
        align-items: center;
        margin-right: 4px;
        width: 310px;
        height: 50px;
        background: $white;
        border: 1px solid $border;
      }
      .copy-btn {
        width: 90px;
        border-radius: 0;
      }
    }
    .info {
      color: #282828;
    }
  }
  &-link {
    background-color: $white;
    p {
      padding: 0 20px;
      width: 100%;
      overflow: hidden;
      line-height: 56px;
      height: 56px;
      background-color: #f1f3f0;
      text-overflow: ellipsis;
      display: -webkit-box;
      -webkit-box-orient: vertical;
      -webkit-line-clamp: 1;
      word-break: break-all;
    }
    .toggle-btn {
      padding: 10px 30px;
      border-radius: 0;
    }
  }
  &-product {
    background-color: $white;
    .gray-info {
      color: $gray;
    }
    .product-card {
      margin-right: 30px;
      padding: 0 30px;
      border: 1px solid $border;
      border-radius: 8px;
      .product-title {
        border-bottom: 1px solid $border;
      }
      p {
        padding: 20px 0;
      }
    }
    .copy-btns {
      display: flex;
      justify-content: center;
      align-items: center;
      .copy-btn {
        margin: 0 20px;
        padding: 10px 30px;
        border-radius: 0;
      }
    }
    .image-list {
      position: relative;
      min-height: 100px;
      max-width: 400px;
    }
    .product-img {
      position: relative;
      width: 100%;
      height: 0;
      padding-top: 100%;
      border: 1px solid #eee;
      border-radius: 4px;
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
    .download-icon {
      color: #282828;
    }
    .download-btn {
      padding: 10px 30px;
      border-radius: 0;
    }
    .empty-card {
      width: 100%;
      text-align: center;
      color: #484848;
      font-size: 16px;
      .empty-img {
        width: 200px;
      }
    }
    .row {
      margin-left: -10px;
      margin-right: -10px;
    }
    .img-wrapper {
      padding-left: 10px;
      padding-right: 10px;
    }
  }
  .title {
    font-size: 18px;
  }
  @media screen and (max-width: 540px) {
    font-size: 14px;
    &-main {
      padding: 30px 16px;
      .form-control {
        padding-left: 16px;
        height: 46px;
        font-size: 14px;
      }
    }
    &-use {
      padding: 60px 30px 0;
      &__title {
        text-align: center;
      }
    }
    &-copy {
      .copy-card .f-value {
        height: 40px;
      }
    }
    &-link {
      p {
        margin-top: 14px;
        padding: 0 16px;
        height: 46px;
        line-height: 46px;
      }
      .toggle-btn {
        margin-bottom: 14px;
        padding: 12px;
        width: 100%;
      }
    }
    &-product {
      .product-card {
        margin: 0;
        padding: 0 14px;
        border-radius: 4px;
        p {
          padding: 10px 0;
        }
      }
      .copy-btns {
        justify-content: flex-start;
        .copy-btn {
          margin: 0 16px 0 0;
          padding: 7px 20px;
        }
      }
      .download-btn {
        padding: 7px 20px;
      }
    }
    .title {
      font-size: 16px;
    }
    .btn {
      font-size: 14px;
    }
  }
}
</style>
