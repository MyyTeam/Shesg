<template>
  <div class="manage-link">
    <div class="manage-link-inner d-flex align-items-center">
      <svg-icon icon-class="sort" class="manage-icon d-none d-md-block" v-trace:managelink.click="traceEventInfo" spm-index="managelinkicon" @click="toggleCollapse()" />
      <b-icon icon="list-stars" class="manage-icon d-block d-md-none" v-trace:managelink.click="traceEventInfo" spm-index="managelinkicon" @click="popupVisible = !popupVisible" />
      <svg-icon icon-class="copy" class="manage-icon ml-3 d-none d-md-block" v-trace:copylink.click="traceEventInfo" spm-index="copylinkicon" @click="toggleCollapse('merchant')" />
      <svg-icon icon-class="copy" class="manage-icon ml-3 d-block d-md-none" v-trace:copylink.click="traceEventInfo" spm-index="copylinkicon" @click="merchantPopupVisible = !merchantPopupVisible" />
    </div>
    <b-collapse id="collapse-link-manage" v-model="showCollapse" class="collapse-card">
      <ManageContent @addHeader="addHeader" />
      <b-icon icon="x" class="collapse-x" @click="toggleCollapse()"></b-icon>
    </b-collapse>
    <ActionSheet :visible.sync="popupVisible" :title="$t('dashboard.manage.dialogTitle')" customClass="manage-link-dialog" height="230px" @close="popupVisible=false">
      <ManageContent @addHeader="addHeader"  />
    </ActionSheet>

    <b-collapse id="collapse-link-copy" v-model="showMerchantCollapse" class="collapse-card collapse-copy-card">
      <Copy @copy-links="copyLinks" />
      <b-icon icon="x" class="collapse-x" @click="toggleCollapse('merchant')"></b-icon>
    </b-collapse>
    <ActionSheet :visible.sync="merchantPopupVisible" title="Copy" customClass="manage-link-dialog" height="240px" @close="merchantPopupVisible=false">
      <Copy @copy-links="copyLinks"  />
    </ActionSheet>
  </div>
</template>

<script>
import { copyLinksByUsername } from '@/api/product'
import ActionSheet from '@/components/ActionSheet'
import ManageContent from './components/ManageContent'
import Copy from './components/Copy'
export default {
  components: { ActionSheet, ManageContent, Copy },
  data() {
    return {
      popupVisible: false,
      showCollapse: false,
      merchantPopupVisible: false,
      showMerchantCollapse: false
    }
  },

  inject: ['traceEventInfo'],
  methods: {
    toggleCollapse(type) {
      if (type) {
        this.showCollapse = false
        this.showMerchantCollapse = !this.showMerchantCollapse
      } else {
        this.showMerchantCollapse = false
        this.showCollapse = !this.showCollapse
      }
    },
    addHeader() {
      this.showCollapse = false
      this.popupVisible = false
      this.$emit('add-link', 4)
    },
    addNormalLink() {
      this.$emit('add-link', 0)
    },
    copyLinks(userName) {
      this.$emit('show-copy-loading')
      copyLinksByUsername({ userName }).then(res => {
        this.showMerchantCollapse = false
        this.merchantPopupVisible = false
        this.$emit('refresh-links')
      }).catch(() => {
        this.$emit('show-copy-loading', false)
      })
    }
  }
}
</script>

<style lang="scss" scoped>
.manage-link {
  position: sticky;
  width: 100%;
  top: 86px;
  z-index: 10;
  padding-bottom: 16px;
  background: #f5f8ff;
  .manage-icon {
    font-size: 20px;
    color: $main;
    cursor: pointer;
  }

  .collapse-card {
    // position: absolute;
    position: relative;
    top: 6px;
    z-index: 4;
    padding: 10px 14px;
    width: 100%;
    max-width: 716px;
    background: $white;
    border-radius: 4px;
    box-shadow: 0 4px 8px 0 rgb(0 0 0 / 16%);
    .collapse-x {
      position: absolute;
      top: 4px;
      right: 4px;
      font-size: 22px;
      color: #484848;
      cursor: pointer;
    }
  }
  @media screen and (max-width: 540px) {
    top: 60px;
  }
}
</style>
