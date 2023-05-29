<template>
  <div class="link-item--shadow">
    <div class="link-item" :class="{'link-item--featured':showHeaderInfo}">
      <div class="link-item__left d-none d-md-flex">
        <svg-icon icon-class="list" class="list-icon" />
      </div>
      <div class="link-item__main py-3 px-3">

        <div class="link-item__title">
          <span class="text" v-if="[1,2,3].includes(linkInfo.type)">{{linkInfo.title}}</span>
          <template v-else>
            <span v-trace:[linkSpmc].click="traceEventInfo" spm-index="edittitle" v-if="!showTitleInput" class="content-wrapper" @click="showTitleInput=true">
              <div class="content">
                <svg-icon icon-class="edit" class="edit-icon icon-1" />
                <span class="text">{{linkInfo.title}}</span>
                <div class="icon-2">
                </div>
              </div>
            </span>
            <b-form-textarea v-else id="title-input" class="link-input" v-model.trim="linkInfo.title" max="128" rows="2" autofocus  @blur="saveInput" @keyup.enter="saveInput"></b-form-textarea>
          </template>
        </div>
        <div class="link-item__url" v-if="!linkInfo.type">
          <span v-trace:[linkSpmc].click="traceEventInfo" spm-index="editurl" v-if="!showUrlInput" @click="showUrlInput=true">
            <span class="url-text">{{linkInfo.url || 'URL'}}</span>
          </span>
          <b-form-input v-else id="url-input" class="link-input url-input" v-model.trim="linkInfo.url" max="1024" autofocus @blur="saveUrlInput" @keyup.enter="saveUrlInput"></b-form-input>
          <div v-show="showUrlError" class="url-error">The link URL is not allowed!</div>
        </div>

        <div class="icons pt-md-1 d-flex justify-content-between align-items-center" v-if="linkInfo.id">
          <div class="d-flex justify-content-center align-items-center">
            <template v-if="!linkInfo.type">
              <b-icon
                :id="`image-tooltip-${linkInfo.id}`"
                v-trace:[linkSpmc].click="traceEventInfo"
                spm-index="image"
                icon="image"
                class="picture-icon icon"
                :class="{'picture-icon-active': showImage || linkInfo.image}"
                @click="openCollapse('image')" />
              <b-tooltip :target="`image-tooltip-${linkInfo.id}`" placement="bottom" triggers="hover">
                {{ $t('dashboard.link.thumbnail') }}
              </b-tooltip>
            </template>
          </div>
          <div class="d-block d-md-none">
            <b-icon
              v-trace:[linkSpmc].click="traceEventInfo"
              spm-index="delete"
              icon="trash"
              class="delete-icon"
              @click="openCollapse('delete')" />
          </div>
        </div>
        <div v-if="linkInfo.type===4" class="product-badge">
          <div class="product-badge__content">
            <svg-icon icon-class="header" />
          </div>
        </div>
      </div>

    </div>
    <div class="link-info" v-show="showHeaderInfo">
      <b-icon icon="info-circle-fill" class="alert-icon"></b-icon>
      <span>{{ $t('dashboard.link.headerInfo') }}</span>
    </div>
    <Collapse v-model="showCollapse" :data="linkInfo" :type="collapseType" @change="changeLinks" @deleteItem="deleteItem" />
  </div>
</template>

<script>
import { changeLinks } from '@/api/product'
import { joinUrl } from '@/utils'
import Collapse from '../Collapse'
import { mapGetters } from 'vuex'
export default {
  components: { Collapse },
  props: {
    data: {
      type: Object,
      default: () => {}
    },
    index: {
      type: Number,
      default: 0
    },
    canEditLink: {
      type: Number,
      default: 0
    }
  },
  data() {
    return {
      showTitleInput: false,
      showUrlInput: false,
      showCollapse: false,
      collapseType: 'image',
      linkInfo: {},
      showPlay: false,
      showUrlError: false
    }
  },
  inject: ['traceEventInfo'],
  watch: {
    data: {
      handler(val) {
        this.linkInfo = val
      },
      immediate: true
    },
    'linkInfo.isAvailable': {
      handler(val) {
        if (!val) {
          this.showCollapse = false
        }
      }
    }
  },
  computed: {
    ...mapGetters(['userInfo']),
    showImage() {
      return this.showCollapse && this.collapseType === 'image'
    },
    linkSpmc() {
      return !this.data.type ? 'normallink' : 'header'
    },
    showHeaderInfo() {
      return (this.linkInfo.type === 4 && this.linkInfo.title === 'Headline Title' && this.linkInfo.isAvailable)
    }
  },
  methods: {
    saveInput() {
      if (this.showUrlError) return
      this.showTitleInput = false
      this.showUrlInput = false
      this.changeLinks(this.linkInfo)
    },
    openCollapse(type) {
      this.showCollapse = true
      this.collapseType = type
    },

    changeLinks(data) {
      changeLinks([data]).then(() => {
        if (data.url && data.url.includes('dhgate.com')) {
          data.redirectUrl = joinUrl(data.url, { f: `bm|aff|yfaf|${this.traceEventInfo.aid}|||new|` })
        } else {
          data.redirectUrl = data.url
        }
        this.linkInfo = data
        this.$emit('update', this.linkInfo, this.index)
      })
    },
    deleteItem() {
      this.$emit('deleteItem', this.index)
    },
    saveUrlInput() {
      const { url } = this.linkInfo
      if (!this.canEditLink && url.includes('shESG.cc/product')) {
        this.showUrlError = true
        return
      } else {
        this.showUrlError = false
      }
      if (url && !/^(https?):\/\//.test(url)) {
        this.linkInfo.url = `https://${url}`
      }
      this.linkInfo.redirectUrl = this.linkInfo.url
      this.saveInput()
    }
  }
}
</script>

<style lang="scss" scoped>
@import './index.scss';
</style>
