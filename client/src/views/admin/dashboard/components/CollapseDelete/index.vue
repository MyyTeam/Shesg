<template>
  <div class="collapse-delete">
    <div v-if="type===4" class="delete-radios py-1 py-md-2">
      <b-form-group v-slot="{ ariaDescribedby }">
        <b-form-radio-group
          v-model="deleteType"
          :options="options"
          :aria-describedby="ariaDescribedby"
          name="radio-inline"
        ></b-form-radio-group>
      </b-form-group>
    </div>
    <p v-else>{{ $t('dashboard.collapse.deleteInfo') }}</p>
    <b-button
      class="collapse-delete-btn"
      variant="outline-dark"
      @click="handelCancel"
    >{{ $t('common.cancel') }}</b-button>
    <b-button
      class="collapse-delete-btn"
      variant="primary"
      @click="deleteItem"
    >{{ $t('common.delete') }}</b-button>
  </div>
</template>

<script>
import { deleteLink } from '@/api/product'
export default {
  props: {
    id: {
      type: String,
      default: ''
    },
    type: {
      type: Number,
      default: 0
    }
  },
  data() {
    return {
      deleteType: 1,
      options: [
        { text: 'Only delete the header', value: 1 },
        { text: 'Both header & links under the header', value: 2 }
      ]
    }
  },
  methods: {
    handelCancel() {
      this.$emit('close', false)
    },
    deleteItem() {
      const query = {
        linkId: this.id,
        userId: 'd16edf46947fa936fe1bfe7db6d8e111',
        type: this.deleteType
      }
      deleteLink(query).then(() => {
        this.$emit('deleteItem', this.id)
        this.handelCancel()
      })
    }
  }
}
</script>

<style lang="scss" scoped>
.collapse-delete {
  text-align: center;
  font-size: 18px;
  p {
    margin-bottom: 18px;
  }
  .collapse-delete-btn {
    margin: 0 10px;
    width: 217px;
  }
  .delete-radios {
    font-weight: 600;
    font-size: 16px;

  }
  @media screen and (max-width: 540px) {
    font-size: 14px;
    p {
      margin-bottom: 10px;
    }
    .collapse-delete-btn {
      width: 40%;
      font-size: 14px;
    }
    .delete-radios {
      font-size: 14px;
      text-align: left;
    }
  }
}
</style>
