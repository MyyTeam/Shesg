<template>
  <div class="link-item--shadow">
    <div class="link-item">
      <div class="link-item__left d-none d-md-flex">
        <svg-icon icon-class="list" class="list-icon" />
      </div>
      <div class="link-item__main py-3 px-3">
        <!-- <div class="header d-flex d-md-none pb-3">
          <div class="link-item__left">
            <svg-icon icon-class="list" class="list-icon" />
          </div>
          <div class="toggle">
            <b-form-checkbox
              v-trace:productlink.click="traceEventInfo"
              spm-index="onoff"
              v-model="linkInfo.isAvailable"
              :value="1"
              :unchecked-value="0"
              name="check-button"
              button-variant="success"
              switch
              size="lg"
              @change="changeLinkStatus" />
          </div>
        </div> -->
        <div class="link-item__url d-none d-md-block">{{linkInfo.url}}</div>
        <div class="link-item__product d-flex mt-0 mt-md-3">
          <div class="product-img">
            <b-img-lazy :src="linkInfo.image" alt="product-img" />
            <label v-if="canEditLink" class="img-change" :for="`upload${linkInfo.id}`" v-trace:productlink.click="traceEventInfo"
            spm-index="changeimage">Change</label>
          </div>
          <div class="product-info">
            <div class="link-item__title d-none d-md-block">
              <span v-trace:productlink.click="traceEventInfo" spm-index="edittitle" v-if="!showTitleInput" class="content-wrapper">
                <div v-if="canEditLink" class="content" @click="showTitleInput=true">
                  <svg-icon icon-class="edit" class="edit-icon icon-1" />
                  <span class="text">{{linkInfo.title}}</span>
                  <svg-icon icon-class="edit" class="edit-icon icon-2" />
                </div>
                <div v-else class="content">
                  <span class="text">{{linkInfo.title}}</span>
                </div>
              </span>
              <b-form-textarea v-else id="title-input" class="link-input title-input" v-model.trim="linkInfo.title" max="128" rows="2" autofocus  @blur="saveInput" @keyup.enter="saveInput"></b-form-textarea>
            </div>
            <div class="link-item__url d-block d-md-none">{{linkInfo.url}}</div>
            <div class="link-item__price">
              <span v-trace:productlink.click="traceEventInfo" spm-index="changeprice" v-if="!showPriceInput" @click="showPriceInput=true">
                <span class="text">$ {{linkInfo.productPrice || '0'}}</span>
                <svg-icon icon-class="edit" class="edit-icon" />
              </span>
              <div class="d-flex align-items-center" v-else>
                <span>$</span>
                <b-form-input
                  id="price-input"
                  class="link-input price-input"
                  v-model.trim="linkInfo.productPrice"
                  max="100"
                  autofocus
                  @blur="savePriceInput"
                  @keyup.enter="savePriceInput" />
              </div>
            </div>
            <div v-if="linkInfo.commissionAmount || linkInfo.rate" class="link-item__commission">
              <span v-if="linkInfo.commissionAmount">Commission ≥ ${{ linkInfo.commissionAmount }}</span>
              <span v-if="linkInfo.rate" class="product-rate">Rate: {{ linkInfo.rate }}%</span>
            </div>
          </div>
        </div>
        <div class="link-item__title d-block d-md-none pt-2 pb-1">
          <span v-trace:productlink.click="traceEventInfo" spm-index="edittitle" v-if="!showTitleInput" class="content-wrapper" >
            <div v-if="canEditLink" class="content" @click="showTitleInput=true">
              <svg-icon icon-class="edit" class="edit-icon icon-1" />
              <span class="text">{{linkInfo.title}}</span>
              <div class="icon-2">
                <svg-icon icon-class="edit" class="" />
              </div>
            </div>
            <div v-else class="content">
              <span class="text">{{linkInfo.title}}</span>
            </div>
          </span>
          <b-form-textarea v-else id="title-input" class="link-input title-input" v-model.trim="linkInfo.title" max="128" rows="2" autofocus  @blur="saveInput" @keyup.enter="saveInput"></b-form-textarea>
        </div>
        <div class="link-item__icons d-flex d-md-none justify-content-end align-items-center">
          <svg-icon
            v-trace:productlink.click="traceEventInfo"
            spm-index="sharelink"
            icon-class="share"
            class="share-icon icon"
            @click="openCollapse('share')" />
          <b-icon
            v-trace:productlink.click="traceEventInfo"
            spm-index="delete"
            icon="trash"
            class="delete-icon icon"
            @click="openCollapse('delete')" />
        </div>
      </div>
      <div class="link-item__right d-none d-md-flex py-3 pr-3">
        <div class="toggle">
          <b-form-checkbox
            v-trace:productlink.click="traceEventInfo"
            spm-index="onoff"
            v-model="linkInfo.isAvailable"
            :value="1"
            :unchecked-value="0"
            name="check-button"
            button-variant="success"
            switch
            size="lg"
            @change="changeLinkStatus" />
        </div>
        <div class="link-item__icons d-flex align-items-center">
          <svg-icon
            v-trace:productlink.click="traceEventInfo"
            spm-index="sharelink"
            icon-class="share"
            class="share-icon icon"
            @click="openCollapse('share')" />
          <b-icon
            v-trace:productlink.click="traceEventInfo"
            spm-index="delete"
            icon="trash"
            class="delete-icon icon"
            @click="openCollapse('delete')" />
        </div>

      </div>
    </div>
    <Collapse v-model="showCollapse" :data="linkInfo" :type="collapseType"  @deleteItem="deleteItem" />
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
      showPriceInput: false,
      showCollapse: false,
      collapseType: 'delete',
      linkInfo: {}
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
    ...mapGetters(['userInfo'])
  },
  methods: {
    saveInput() {
      this.showTitleInput = false
      this.showPriceInput = false
      this.changeLinks(this.linkInfo)
    },
    savePriceInput(e) {
      const matchValue = e.target.value.match(/^\d*(\.?\d+)/g)
      this.linkInfo.productPrice = matchValue ? matchValue[0] : null
      this.saveInput()
    },
    openCollapse(type) {
      this.showCollapse = true
      this.collapseType = type
    },
    changeLinkStatus() {
      this.changeLinks(this.linkInfo)
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
    changeImage(data) {
      this.linkInfo.image = data
      this.changeLinks(this.linkInfo)
    }
  }
}
</script>

<style lang="scss" scoped>
@import './index.scss';
</style>
