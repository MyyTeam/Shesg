<template>
  <div class="add-link pt-3 pt-lg-4 pb-3 pb-lg-4 d-flex justify-content-center align-items-center">
    <div class="add-btns">
      <b-button
        id="addLinkBtn"
        class="add-btn main-btn"
        variant="primary"
        pill
        v-trace:addlink.click="traceEventInfo"
        spm-index="addnewlinkbtn"
        @click="toggleCollapse"
      >{{ $t('dashboard.add.addLink') }}</b-button>

      <b-collapse id="collapse-link-add" v-model="showCollapse" class="collapse-card">
        <ManageContent v-if="showCollapse" v-bind="$attrs" @add-link="addLink" />
        <b-icon icon="x" class="collapse-x" @click="closeCollapse"></b-icon>
      </b-collapse>
    </div>

    <ActionSheet :visible.sync="popupVisible" title="Add New Link" customClass="manage-link-dialog" height="320px" @close="closeCollapse">
      <ManageContent v-if="popupVisible" v-bind="$attrs" @add-link="addLink"  />
    </ActionSheet>
  </div>
</template>

<script>
import ActionSheet from '@/components/ActionSheet'
import ManageContent from './components/ManageContent'
import { isMobile } from '@/utils'
export default {
  components: { ActionSheet, ManageContent },
  data() {
    return {
      popupVisible: false,
      showCollapse: false
    }
  },
  inject: ['traceEventInfo'],
  methods: {
    addLink(data) {
      this.showCollapse = false
      this.popupVisible = false
      this.$emit('add-link', data)
    },
    toggleCollapse() {
      if (isMobile()) {
        this.popupVisible = !this.popupVisible
      } else {
        this.showCollapse = !this.showCollapse
      }
    },
    closeCollapse() {
      if (isMobile()) {
        this.popupVisible = false
      } else {
        this.showCollapse = false
      }
    }
  }
}
</script>

<style lang="scss" scoped>
.add-link {
  position: sticky;
  width: 100%;
  top: 0;
  left: -10px;
  z-index: 11;
  background: #f5f8ff;
  .add-btns {
    position: relative;
    width: 100%;
  }
  .add-btn {
    margin: 0 auto;
    padding-left: 0;
    padding-right: 0;
    min-width: 250px;
    width: 60%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: 600;
    box-shadow: 0 4px 8px 0 rgb(0 0 0 / 16%);
    .store-icon {
      margin-right: -4px;
      width: 20px;
      height: 20px;
      border-radius: 50%;
      border: 1px solid $main;
    }
    .add-icon {
      display: flex;
      padding-right: 8px;
    }
  }
  .collapse-card {
    position: relative;
    z-index: 11;
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
}
</style>
