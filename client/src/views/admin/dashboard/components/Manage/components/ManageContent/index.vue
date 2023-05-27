<template>
  <div>
    <div class="collapse-link-item group-item">
      <!-- <div class="link-img product"><svg-icon icon-class="product" /></div> -->
      <div class="link-img"></div>
      <div class="link-content">
        <div class="title">{{ $t('dashboard.manage.groupTitle') }}</div>
        <div class="info">{{ $t('dashboard.manage.groupInfo') }}</div>
      </div>
      <div class="add-btn" v-trace:managelink.click="traceEventInfo" spm-index="addheader" @click="addHeader">Add</div>
    </div>
    <div class="collapse-link-item">
      <!-- <div class="link-img"><svg-icon icon-class="link" /></div> -->
      <div class="link-img sort"></div>
      <div class="link-content">
        <div class="title">{{ $t('dashboard.manage.sortTitle') }}</div>
        <div class="info">{{ $t('dashboard.manage.sortInfo') }}</div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {}
  },
  inject: ['traceEventInfo'],
  methods: {
    addHeader() {
      this.$emit('addHeader')
    }
  }
}
</script>

<style lang="scss" scoped>
.collapse-link-item {
  padding: 12px 8px;
  display: flex;
  align-items: center;
  cursor: pointer;
  &.group-item {
    border-bottom: 1px solid $border;
  }
}
.link-img {
  width: 40px;
  height: 40px;
  // border-radius: 4px;
  // background-color: #F7B970;
  background-image: url('~@/assets/dashboard/group.jpg');
  background-size: contain;
  // display: flex;
  // align-items: center;
  // justify-content: center;
  // font-size: 36px;
  &.sort {
    background-image: url('~@/assets/dashboard/sort.jpg');
  }
}
.link-content {
  margin-left: 18px;
  flex: 1;
  .title {
    font-size: 16px;
    font-weight: 600;
  }
  .info {
    padding-top: 6px;
    font-size: 14px;
    color: #555555;
    line-height: 1.2;
  }
}
.add-btn {
  padding-left: 10px;
  font-weight: 600;
  color: $main;
  cursor: pointer;
  text-decoration: underline;
}
</style>
