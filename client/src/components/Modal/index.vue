<template>
  <div>
    <b-modal
      v-model="showModal"
      :title="title"
      :dialog-class="customClass"
      :size="size"
      :hide-header="hideHeader"
      :centered="centered"
      :hide-backdrop="hideBackdrop"
      @hidden="handleClose"
      hide-footer
    >
      <slot />
    </b-modal>
    <ActionSheet :visible.sync="showWapModal" :title="title" :customClass="customClass" :hideHeader="hideHeader" :height="height" @close="handleClose">
       <slot />
    </ActionSheet>
  </div>
</template>

<script>
import { isMobile } from '@/utils'
import ActionSheet from '@/components/ActionSheet'
export default {
  components: { ActionSheet },
  props: {
    value: {
      type: Boolean,
      default: false
    },
    title: {
      type: String,
      default: ''
    },
    customClass: {
      type: String,
      default: 'select-product-modal'
    },
    size: {
      type: String,
      default: 'lg'
    },
    height: {
      type: String,
      default: '200px'
    },
    hideHeader: {
      type: Boolean,
      default: false
    },
    centered: {
      type: Boolean,
      default: true
    },
    hideBackdrop: {
      type: Boolean,
      default: false
    }
  },
  data() {
    return {
      showModal: false,
      showWapModal: false
    }
  },
  watch: {
    value: {
      handler(val) {
        const showModalName = isMobile() ? 'showWapModal' : 'showModal'
        this[showModalName] = val
      },
      immediate: true
    }
  },
  methods: {
    handleClose() {
      this.showModal = false
      this.showWapModal = false
      this.$emit('input', false)
    }
  }
}
</script>

<style lang="scss" scoped>

</style>
