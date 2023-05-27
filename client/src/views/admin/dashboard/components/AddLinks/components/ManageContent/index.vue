<template>
  <div class="add-link-modal p-4">
    <b-form>
      <b-form-group v-if="canEditLink" id="title-group">
        <b-form-input
          id="title"
          name="title"
          autocomplete="off"
          class="title-input"
          v-trace:addlink.click="traceEventInfo"
          spm-index="inputitle"
          v-model.trim="linkForm.title"
          placeholder="Title">
        </b-form-input>
      </b-form-group>
      <b-form-group id="url-group">
        <b-form-input
          id="url"
          name="url"
          autocomplete="off"
          class="url-input"
          v-trace:addlink.click="traceEventInfo"
          spm-index="inputurl"
          v-model.trim="linkForm.url"
          placeholder="Url"
          v-validate="{ required: true}"
          :state="validateState('url')"
          aria-describedby="input-url-feedback"
          data-vv-as="url">
        </b-form-input>
        <b-form-invalid-feedback id="input-link-feedback">{{ veeErrors.first('url') }}</b-form-invalid-feedback>
      </b-form-group>
      <div v-if="headerList.length" class="header-group pt-3">
        <p class="info">[optional] Choose a header for this link, then it will be displayed under the header </p>
        <div class="header-list pt-2">
          <div class="header-item-wrap" v-for="(item,index) in linkHeadersTop" :key="item.id">
            <div
              class="header-item"
              :class="{'active': item.active}"
              v-trace:addlink.click="traceEventInfo"
              spm-index="chooseheader"
              @click="chooseHeader(item,index)">
              {{ item.title }}
            </div>
          </div>
        </div>
        <template v-if="linkHeadersElse.length">
          <b-collapse id="collapse-header" v-model="showCollapse" class="collapse-header">
            <div class="header-list">
              <div class="header-item-wrap" v-for="(item,index) in linkHeadersElse" :key="item.id">
                <div
                  class="header-item"
                  :class="{'active': item.active}"
                  v-trace:addlink.click="traceEventInfo"
                  spm-index="chooseheader"
                  @click="chooseHeader(item,index+6)">
                  {{ item.title }}
                </div>
              </div>
            </div>
          </b-collapse>
          <div
            class="header-collapse-btn mb-3"
            :class="{'collapsed header-collapse-up':showCollapse}"
            aria-controls="collapse-header"
            @click="changeCollapse">
              <svg-icon icon-class="down-arrow" class="down-icon" :class="{'up-icon':showCollapse}" />
          </div>
        </template>

      </div>
      <div class="footer-btn text-center mt-3">
        <b-button
          class="main-btn"
          variant="primary"
          :disabled="loading"
          v-trace:addlink.click="traceEventInfo"
          spm-index="submitlink"
          @click="handleSubmit">
          <b-spinner small v-show="loading" />
          Submit
        </b-button>
      </div>
    </b-form>
  </div>
</template>

<script>
export default {
  props: {
    linkHeaders: {
      type: Array,
      default: () => []
    },
    canEditLink: {
      type: Number,
      default: 0
    }
  },
  data() {
    return {
      loading: false,
      linkForm: {
        title: '',
        url: '',
        headerLinkId: ''
      },
      showCollapse: false,
      headerList: [],
      linkHeadersTop: [],
      linkHeadersElse: []
    }
  },
  watch: {
    linkHeaders: {
      handler(val) {
        this.headerList = val.map(item => {
          item.active = false
          return item
        })
      },
      immediate: true
    },
    headerList: {
      handler(val) {
        this.linkHeadersTop = val.slice(0, 6)
        this.linkHeadersElse = val.slice(6)
      },
      immediate: true
    }
  },
  inject: ['traceEventInfo'],
  methods: {
    handleSubmit() {
      this.$validator.validateAll().then(result => {
        if (!result) {
          return
        }
        let { url } = this.linkForm
        if (url && !/^(https?):\/\//.test(url)) {
          url = `https://${url}`
        }
        const activeHeader = this.headerList.find(item => item.active)
        this.linkForm.headerLinkId = activeHeader?.id
        this.$emit('add-link', { ...this.linkForm, url })
      })
    },
    validateState(ref) {
      if (
        this.veeFields[ref] &&
        (this.veeFields[ref].dirty || this.veeFields[ref].validated)
      ) {
        return !this.veeErrors.has(ref)
      }
      return null
    },
    changeCollapse() {
      this.showCollapse = !this.showCollapse
    },
    chooseHeader(item, index) {
      if (item.active) {
        this.headerList[index].active = false
        this.headerList = JSON.parse(JSON.stringify(this.headerList))
      } else {
        this.headerList = this.headerList.map((headerItem, headerIndex) => {
          headerItem.active = (index === headerIndex)
          return headerItem
        })
      }
    }
  }
}
</script>

<style lang="scss" scoped>
.add-link-modal {
  .form-group {
    display: flex;
    margin-bottom: 0;
    .form-control {
      font-size: 14px;
      background: $white;
      border: 1px solid $border;
      border-radius: 22px;
      box-shadow: none;
    }
    .invalid-feedback {
      position: absolute;
      bottom: 0;
      text-align: left;
      color: #FF0000;
      line-height: 1.2;
    }
    ::v-deep {
      >div {
        position: relative;
        flex: 1;
        width: 100%;
        padding-bottom: 16px;
        margin-bottom: 6px;
      }
      .form-text {
        line-height: 1.2;
      }
    }
  }
  .header-group {
    border-top: 1px solid $border;
    .info {
      color: $gray;
    }
    .header-list {
      display: flex;
      flex-wrap: wrap;
      .header-item-wrap {
        width: 33%;
        margin-bottom: 10px;
        padding: 0 5px;
      }
    }
    .header-item {
      padding: 0 10px;
      border: 1px solid $border;
      border-radius: 4px;
      cursor: pointer;
      font-size: 14px;
      text-align: center;
      width: 100%;
      overflow: hidden;
      line-height: 40px;
      height: 40px;
      text-overflow: ellipsis;
      display: -webkit-box;
      -webkit-box-orient: vertical;
      -webkit-line-clamp: 1;
      word-break: break-all;
      &:hover {
        color: $main;
        border-color: $main;
      }
      &.active {
        color: $main;
        border-color: #abd9fa;
        background: #abd9fa;
      }
    }
  }
  .header-collapse-btn {
    height: 20px;
    display: flex;
    justify-content: center;
    align-items: center;
    background: $white;
    cursor: pointer;
    transition: all 0.4s;
    border-color: $border !important;
    &.header-collapse-up {
      // background-color: #b2accf;
      transition: all 0.4s;
    }
    .down-icon {
      color: #484848;
      font-size: 20px;
      transition: transform 0.2s;
      &.up-icon {
        transform:rotate(180deg);
        transition: transform 0.2s;
      }
    }
  }
  .footer-btn {
    button {
      padding: 4px 20px;
    }
  }
  @media screen and (max-width: 540px) {
    .header-group .header-list .header-item-wrap {
      width: 50%;
    }
  }
}
</style>
