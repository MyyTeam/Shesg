<template>
  <div id="admin-header" class="admin-header">
    <b-navbar type="light" variant="faded">
      <b-navbar-brand class="logo"><img src="@/assets/logo.svg" alt="logo" width="150"></b-navbar-brand>
        <b-navbar-nav class="ml-auto" v-if="userInfo">
          <b-nav-item-dropdown right variant="link" toggle-class="text-decoration-none" no-caret class="header-avatar d-none d-md-block">
            <template #button-content>
              <div v-trace:usercenter.click="traceEventInfo" spm-index="clickuserimage" class="avatar" :style="{backgroundImage: `url(${avatar || baseAvatar})`}"></div>
            </template>
            <b-dropdown-text class="username">{{username}}</b-dropdown-text>
            <b-dropdown-text class="email">{{userInfo.email}}</b-dropdown-text>
            <b-dropdown-text class="email">{{$t('dashboard.affiliate.affiliate')}} {{userInfo.affiliateCode}}</b-dropdown-text>
            <b-dropdown-text class="logout">
              <div v-trace:usercenter.click="traceEventInfo" spm-index="logout" class="logout-btn" @click="handleLogout">
                Logout
              </div>
            </b-dropdown-text>
          </b-nav-item-dropdown>
          <b-nav-text class="d-block d-md-none">
            <div class="d-flex align-items-center" v-trace:usercenter.click="traceEventInfo" spm-index="clickuserimage">
              <div class="avatar" :style="{backgroundImage: `url(${avatar || baseAvatar})`}" @click="showModal=true"></div>
              <b-icon icon="chevron-right" class="right-icon" />
            </div>
          </b-nav-text>
        </b-navbar-nav>
    </b-navbar>
    <ActionSheet v-if="userInfo" :visible.sync="showModal" title="Profile" customClass="user-popup" height="210px" @close="showModal=false">
      <div class="username user-item">{{username}}</div>
      <div class="email user-item">{{userInfo.email}}</div>
      <div class="email user-item">{{$t('dashboard.affiliate.affiliate')}} {{userInfo.affiliateCode}}</div>
      <div class="logout user-item">
        <div v-trace:usercenter.click="traceEventInfo" spm-index="logout" class="logout-btn" @click="handleLogout">Logout</div>
      </div>
    </ActionSheet>

  </div>
</template>

<script>
import ActionSheet from '@/components/ActionSheet'
import { mapGetters } from 'vuex'
import { isMobile } from '@/utils'
export default {
  components: { ActionSheet },
  data() {
    return {
      avatar: '',
      baseAvatar: require('@/assets/dashboard/avatar.png'),
      showModal: false
    }
  },
  computed: {
    ...mapGetters(['userInfo']),
    username() {
      return this.userInfo?.username?.toUpperCase()
    },
    traceEventInfo() {
      const { username, affiliateCode } = this.userInfo
      return {
        username,
        aid: affiliateCode
      }
    },
    thirdAccessToken() {
      return this.userInfo?.thirdAccessToken
    }
  },
  watch: {
    userInfo: {
      handler(val) {
        if (!val) return
        this.avatar = val.img
      },
      immediate: true
    }
  },
  created() {
    this.isMobile = isMobile()
  },
  methods: {
    handleLogout() {

    },
    jump(path, blank) {
      if (blank) {
        const { href } = this.$router.resolve(path)
        window.open(href, '_blank')
      } else {
        this.$router.push(path)
      }
    }

  }
}
</script>

<style lang="scss" scoped>
.admin-header {
  position: fixed;
  z-index: 99;
  width: 100%;
  height: 60px;
  background: $white;
  border-bottom: 1px solid $border;
  .right-icon {
    color: #ccc;
  }
  .more-icon {
    height: 60px;
    color: #484848;
    margin-right: 10px;
  }

  .logo {
    margin-right: 40px;
  }
 .avatar {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    background-color: #A0D9F6;
    background-size: contain;
  }

  .username {
    color: $black;
  }
  .email {
    font-size: 18px;
    color: #555555;
  }
  .logout-btn {
    width: 180px;
    cursor: pointer;
    color: $main;
  }
  .contact-card {
    position: relative;
    cursor: pointer;

    .badge {
      position: absolute;
      top: 0;
      right: -10px;
      min-width: 18px;
      height: 18px;
      color: $white;
      background: #f56c6c;
      border-radius: 9px;
    }
  }
  @media screen and (max-width: 540px) {
    ::v-deep {
      .navbar {
        padding: 0 10px 0 14px;
      }
      .header-nav-item .nav-link {
        font-size: 14px;
        padding: 0 6px !important;
      }
      .logo {
        margin-right: 16px;
        img {
          width: 120px;
          height: 34px;
        }
      }
      .login-btn .nav-link {
        min-width: 54px;
        font-size: 14px;
        padding: 2px;
        text-align: center;
      }
    }
  }
}
</style>
