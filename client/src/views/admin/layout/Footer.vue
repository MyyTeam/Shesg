<template>
  <div id="admin-footer">
    <div class="copy-right" >
      <router-link to="/#">About Us</router-link>
      <router-link to="/#">Terms and Conditions</router-link>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return { }
  },
  computed: {

  }
}
</script>

<style lang="scss" scoped>
.copy-right {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 40px;
  background: #F5F8FF;
  font-size: 14px;
  a {
    margin: 0 6px;
    color: #999999;
    text-decoration: underline;
  }
  @media screen and (max-width: 540px) {
    font-size: 12px;
  }
}
</style>
