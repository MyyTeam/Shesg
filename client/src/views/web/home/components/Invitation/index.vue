<template>
  <div class="invition">
    <div v-trace:inviteicon.click.expose="{...traceEventInfo}" class="invitation-icon" @click="showInvitionPopup" />
    <Popup :visible.sync="popupVisible" height="300px" :popupStyle="popupStyle" @close="closeInvitionPopup">
      <div class="popup-content text-center">
        <div class="invitation-img" />
        <h5 class="pt-3">Invitation</h5>
        <p>Hi friend, I am conducting my affiliate business with no start-up fees on SHEsg. I sincerely invite you to join me!</p>
        <div v-trace:invitejoin.click.expose="{...traceEventInfo}" class="join-btn mt-3" @click="join">Join Now</div>
      </div>
    </Popup>
  </div>
</template>

<script>
// import { mapGetters } from 'vuex'
import Popup from '@/components/Popup'
import { isMobile } from '@/utils'
export default {
  components: { Popup },
  props: {
    type: {
      type: String,
      default: 'control'
    },
    userId: {
      type: String,
      default: ''
    },
    traceEventInfo: {
      type: Object,
      default: () => {}
    }
  },
  data() {
    return {
      popupVisible: false
    }
  },
  computed: {
    // ...mapGetters(['invitation']),
    popupStyle() {
      if (this.type === 'user') {
        return {
          position: 'fixed',
          margin: '0 auto',
          width: isMobile() ? '100%' : '700px'
        }
      } else {
        return {}
      }
    }
  },
  mounted() {
    // if (this.type === 'user' && this.invitation === 'show') {
    //   setTimeout(() => {
    //     this.invitation === 'show' && this.showInvitionPopup()
    //   }, 10000)
    // }
  },
  methods: {
    showInvitionPopup() {
      this.popupVisible = true
      this.$emit('togglePopup', this.popupVisible)
    },
    closeInvitionPopup() {
      this.popupVisible = false
      this.$emit('togglePopup', this.popupVisible)
      // this.$store.commit('app/SET_INVITATION', 'hidden')
    },
    join() {
      this.$router.push({ name: 'WebsiteHome', query: { fuid: this.userId } })
    }
  }
}
</script>

<style lang="scss" scoped>
.invition {
  .invitation-icon {
    position: absolute;
    top: 8px;
    right: 8px;
    width: 30px;
    height: 30px;
    border-radius: 50%;
    background: #eee url('~@/assets/dashboard/invitation.png') no-repeat center center;
    background-size: 80%;
    cursor: pointer;
  }
  .invitation-img {
    margin: 0 auto;
    width: 50px;
    height: 50px;
    border-radius: 50%;
    background: #eee url('~@/assets/dashboard/invitation.png') no-repeat center center;
    background-size: 80%;
  }
  .join-btn {
    margin: 0 auto;
    width: 100%;
    line-height: 34px;
    background: $white;
    color: $black;
    font-weight: 600;
    border-radius: 8px;
    cursor: pointer;
  }
  ::v-deep .dialog-body {
    display: flex;
    align-items: center;
    height: 100%;
  }
}

</style>
