<template>
  <b-collapse id="collapse-link-item" v-model="showCollapse" class="collapse-card">
    <div class="collapse-card__title">
      <span>{{ titleMap[collapseType] }}</span>
      <b-icon icon="x" class="collapse-x" @click="closeCollapse"></b-icon>
    </div>
    <div class="collapse-card__content px-2 py-3 p-md-3">
      <CollapseImage
        v-if="collapseType==='image'"
        :img="data.image"
        :id="data.id"
        :linkSpmc="linkSpmc"
        @changeLinks="changeLinks"  />
      <CollapseShare
        v-else-if="collapseType==='share'"
        :data="data"
        :linkSpmc="linkSpmc" />
      <CollapseDelete
        v-else
        :id="data.id"
        :type="data.type"
        @close="closeCollapse"
        @deleteItem="deleteItem" />
    </div>
  </b-collapse>
</template>

<script>
import CollapseImage from '../CollapseImage'
import CollapseDelete from '../CollapseDelete'
import CollapseShare from '../CollapseShare'
// import { mapGetters } from 'vuex'
export default {
  components: { CollapseImage, CollapseDelete, CollapseShare },
  props: {
    data: {
      type: Object,
      default: () => {}
    },
    value: {
      type: Boolean,
      default: false
    },
    type: {
      type: String,
      default: 'image'
    }
  },
  data() {
    return {
      showCollapse: false,
      titleMap: {
        image: this.$t('dashboard.collapse.imageTitle'),
        delete: this.$t('dashboard.collapse.deleteTitle'),
        share: 'Copy and Share'
      },
      collapseType: 'image'
    }
  },
  watch: {
    value: {
      handler(val) {
        this.showCollapse = val
        this.collapseType = this.type
      },
      immediate: true
    }
  },
  computed: {
    linkSpmc() {
      switch (this.data?.type) {
        case 4:
          return 'header'
        case 5:
          return 'productlink'
        default:
          return 'normallink'
      }
    }
  },
  methods: {
    closeCollapse() {
      this.showCollapse = false
      this.$emit('input', this.showCollapse)
    },
    changeLinks(data, name) {
      this.$emit('change', {
        ...this.data,
        [name]: data
      })
    },
    deleteItem(id) {
      this.$emit('deleteItem', id)
    }
  }
}
</script>

<style lang="scss" scoped>
.collapse-card {
  background: $white;
  &__title {
    position: relative;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 42px;
    background: #F0EDFF;
    font-weight: 600;
    font-size: 16px;
    .collapse-x {
      position: absolute;
      right: 8px;
      font-size: 26px;
      cursor: pointer;
    }
    @media screen and (max-width: 540px) {
      font-size: 14px;
    }
  }
}
</style>
