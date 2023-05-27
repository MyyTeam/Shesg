<template>
  <div class="textarea-control">
    <b-form-textarea
      id="textarea"
      v-model="text"
      :maxlength="maxlength"
      :placeholder="placeholder"
      :size="size"
      :rows="rows"
      no-resize
      trim
      @blur="handleBlur"
    />
    <span class="textarea-length">{{ length }}/{{ maxlength }}</span>
  </div>
</template>

<script>
export default {
  name: 'Textarea',
  props: {
    value: {
      type: String,
      default: ''
    },
    maxlength: {
      type: Number,
      default: 0
    },
    rows: {
      type: String,
      default: '3'
    },
    size: {
      type: String,
      default: 'sm'
    },
    placeholder: {
      type: String,
      default: ''
    }
  },
  data() {
    return {
      text: ''
    }
  },
  watch: {
    value: {
      handler(val) {
        this.text = val
      },
      immediate: true
    }
  },
  computed: {
    length() {
      return this.text?.length || 0
    }
  },
  methods: {
    handleBlur() {
      this.$emit('input', this.text)
      this.$emit('on-blur', this.text)
    }
  }
}
</script>
<style lang="scss" scoped>
.textarea-control {
  position: relative;
  .textarea-length {
    position: absolute;
    bottom: 0;
    right: 4px;
    color: $gray;
    font-size: 12px;
  }
}
</style>
