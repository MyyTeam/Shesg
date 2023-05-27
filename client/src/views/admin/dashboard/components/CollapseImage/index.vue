<template>
  <div class="collapse-image">
    <div v-if="image" class="image-card">
      <img :src="image" alt="link-img" class="image-card__left">
      <div class="image-card__main">
        <label
          v-trace:[linkSpmc].click="traceEventInfo"
          spm-index="change"
          class="change-btn upload-btn main-btn"
          :for="uploadName"
        >{{ $t('common.change') }}</label>
        <b-button
          v-trace:[linkSpmc].click="traceEventInfo"
          spm-index="deleteimage"
          class="delete-btn"
          variant="outline-dark"
          block
          @click="changeImage('')"
        >{{ $t('common.delete') }}</b-button>
      </div>
    </div>
    <div v-else class="image-card-empty">
      <p class="empty-info">{{ $t('dashboard.collapse.imageInfo') }}</p>
      <label
        v-trace:[linkSpmc].click="traceEventInfo"
        spm-index="addimage"
        class="add-image-btn upload-btn main-btn"
        :for="uploadName"
      >{{ $t('dashboard.collapse.setThumbnail') }}</label>
    </div>
  </div>
</template>

<script>
export default {
  components: {
  },
  props: {
    img: {
      type: String,
      default: ''
    },
    value: {
      type: Boolean,
      default: false
    },
    id: {
      type: String,
      default: ''
    },
    linkSpmc: {
      type: String,
      default: ''
    }
  },
  data() {
    return {
      image: ''
    }
  },
  inject: ['traceEventInfo'],
  watch: {
    img: {
      handler(val) {
        this.image = val
      },
      immediate: true
    }
  },
  computed: {
    uploadName() {
      return `upload${this.id}`
    }
  },
  methods: {
    changeImage(data) {
      this.image = data
      this.$emit('changeLinks', data, 'image')
    }
  }
}
</script>

<style lang="scss" scoped>
.collapse-image {
  .image-card {
    display: flex;
    &__left {
      margin-right: 24px;
      width: 106px;
      height: 106px;
      border-radius: 8px;
    }
    &__main {
      flex: 1;
      display: flex;
      flex-direction: column;
      justify-content: center;
    }
  }
  .image-card-empty {
    text-align: center;
    font-size: 18px;
    p {
      margin-bottom: 18px;
    }
    .add-image-btn {
      margin: 0 auto;
      width: 268px;
    }
  }
  .upload-btn {
    display: flex;
    align-items: center;
    justify-content: center;
    height: 40px;
    font-size: 18px;
    color: $white;
    border-radius: 4px;
    cursor: pointer;
  }
  @media screen and (max-width: 540px) {
    .image-card__left {
      margin-right: 16px;
      width: 80px;
      height: 80px;
    }
    .upload-btn,
    .btn {
      height: 32px;
    }
    .image-card-empty .empty-info {
      margin: 0 auto 10px;
      width: 60%;
      font-size: 14px;
    }
  }
}
</style>
