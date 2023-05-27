<template>
    <div class="collecton">
        <div class="con-title">
          Social post analysis by AI
        </div>
        <div class="con-content">
          <b-form-textarea
            id="textarea"
            class="content-text"
            v-model="info"
            placeholder="Meet my new favorite accessory: the Wallace Tote-Chevron from @VIVAIA! 🌈👜 Not only is this tote incredibly stylish, but it's also made from recycled plastic bottles, making it a sustainable choice. With its spacious interior and durable construction, it's perfect for carrying"
            rows="12"
            no-resize
          ></b-form-textarea>
        </div>
        <div class="con-btn" style="margin-top: 50px;">
          <b-button
          id="addLinkBtn"
          class="sub-btn"
          variant="primary"
          spm-index="addnewlinkbtn"
          pill
          @click="submit"
        >Submit</b-button>
        </div>
    </div>

</template>
<script>
import { socialPost } from '@/api/common'

export default {
  name: 'collecion',
  data() {
    return {
      info: ''
    }
  },
  methods: {
    submit() {
      socialPost({ socialPost: this.info, userId: 'ae9b2b71eb09c54faf16686e117daaff' }).then(res => {
        this.$emit('submit')
      })
    }
  }
}
</script>
<style lang="scss" scoped>
    .collecton{
    background: #F5F5F5;
    box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
    border-radius: 10px;
    height: 370px;
    padding: 10px;
    .con-title{
        font-weight: 700;
        font-size: 20px;
        line-height: 24px;
        text-align: center;
        color: #000000;
    }
    .con-content{
        margin-top: 18px;
        .content-text{
            border: none;
            background: #FFFFFF;
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            border-radius: 10px;

        }
    }
    .con-btn{
        margin-top: 50px;
        position: relative;
        width: 100%;
        .sub-btn{
            margin: 0 auto;
            padding-left: 0;
            padding-right: 0;
            min-width: 250px;
            width: 60% !important;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 600;
            box-shadow: 0 4px 8px 0 rgb(0 0 0 / 16%);
        }
    }
}
textarea::-webkit-input-placeholder{
  color: #D9D9D9 !important;
}

</style>
