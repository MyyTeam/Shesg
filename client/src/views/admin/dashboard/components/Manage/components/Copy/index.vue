<template>
  <div>
    <div class="collapse-link-copy">
      <div class="collapse-link-copy__title pb-2 pb-md-4">Copy links from other SHEsg account</div>
      <div class="collapse-link-copy__content">
        <span class="label">SHEsg Username</span>
        <b-form-input
          id="username-input"
          class="username-input"
          v-trace:copylink.click="traceEventInfo"
          spm-index="inputcopyname"
          v-model.trim="userName"
          max="256"
          placeholder="Input the username that contains the links you want to copy"
          @blur="onBlur">
        </b-form-input>
        <b-button
          class="copy-btn main-btn"
          variant="primary"
          v-trace:copylink.click="traceEventInfo"
          spm-index="copybtn"
          @click="copyLinks">
          Copy
        </b-button>
      </div>
      <div v-show="showError" class="error-tip">shesg Username cannot be empty</div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      showError: false,
      userName: ''
    }
  },
  inject: ['traceEventInfo'],
  methods: {
    copyLinks() {
      this.showError = !this.userName
      if (this.showError) return
      this.$emit('copy-links', this.userName)
    },
    onBlur() {
      this.showError = !this.userName
    }
  }
}
</script>

<style lang="scss" scoped>
.collapse-link-copy {
  position: relative;
  padding: 24px 8px;
  &__title {
    text-align: center;
    font-weight: 600;
    font-size: 16px;
  }
  &__content {
    display: flex;
    align-items: center;
    padding-bottom: 10px;
    .label {
      font-size: 16px;
    }
    .username-input {
      flex: 1;
      margin: 0 10px;
      height: 40px;
      font-size: 14px;
      border-radius: 0;
    }
    .copy-btn {
      width: 100px;
      height: 40px;
      font-size: 14px;
      border-radius: 0;
    }
  }
  .error-tip {
    position: absolute;
    left: 156px;
    bottom: 8px;
    font-size: 12px;
    color: #FF0000;
  }
  @media screen and (max-width: 540px) {
    padding: 14px 8px;
    &__title {
      font-size: 14px;
      text-align: left;
    }
    &__content {
      flex-direction: column;
      align-items: flex-start;
      padding-bottom: 0;
      .label {
        padding-bottom: 6px;
        font-size: 14px;
      }
      .username-input {
        margin: 0 0 20px;
        padding: 10px 12px;
        font-size: 12px;
      }
      .copy-btn {
        align-self: center;
        height: 36px;
      }
    }
    .error-tip {
      left: 10px;
      top: 110px;
      height: 20px;
    }
  }
}
</style>
