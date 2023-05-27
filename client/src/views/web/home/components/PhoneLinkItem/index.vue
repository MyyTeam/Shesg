<template>
  <div
    v-trace:normallink.click.expose="{...traceEventInfo,title:linkItem.title,url:(linkItem.redirectUrl||linkItem.url||'')}"
    class="phone-link-item phone-item"
    :class="{'phone-header-item':linkItem.type===4}"
    @click="linkUrl(linkItem)">
    <div class="img-card">
      <img v-if="linkItem.image" :src="linkItem.image" alt="link-img" class="link-img">
    </div>
    <span class="link-title">{{linkItem.title}}</span>
    <div class="icon-card"></div>
  </div>
</template>

<script>
export default {
  props: {
    traceEventInfo: {
      type: Object,
      default: () => {}
    },
    linkItem: {
      type: Object,
      default: () => {}
    }
  },
  data() {
    return {}
  },
  methods: {
    linkUrl({ url, redirectUrl }) {
      if (!url && !redirectUrl) return
      window.open(redirectUrl || url)
    }
  }
}
</script>

<style lang="scss" scoped>
.phone-item {
  position: relative;
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 12px;
  padding: 15px 10px;
  min-height: 40px;
  color: #000;
  background: $white;
  border-radius: 4px;
  cursor: pointer;
  &.phone-header-item {
    margin-bottom: 0;
    font-size: 16px;
    background: transparent;
  }
  .img-card {
    width: 50px;
  }
  .link-img {
    width: 50px;
    height: 50px;
    border-radius: 50%;
  }
  .icon-card {
    width: 50px;
  }
  .link-title {
    padding: 0 10px;
    flex: 1;
    text-align: center;
    font-weight: 600;
    word-break: break-all;
  }
}
</style>
