<template>
  <div>
    <b-navbar type="light" variant="faded" toggleable id="common-header" class="common-header">
    <b-navbar-toggle v-if="showMenu" target="nav-collapse">
      <template #default="{ expanded }">
        <b-icon v-if="expanded" icon="x"></b-icon>
        <b-icon v-else icon="list"></b-icon>
      </template>
    </b-navbar-toggle>
    <b-icon v-else icon="chevron-left" @click="goBack"></b-icon>
    <span class="title">{{title}}</span>
    <div class="right-icon">
      <b-icon v-if="rightPath" icon="question-octagon" class="question-icon" @click="linkHelp"></b-icon>
    </div>
    <b-collapse id="nav-collapse" is-nav>
      <b-navbar-nav>
        <b-nav-item
          v-for="item in navList"
          :key="item.id"
          :active="isActive(item.path)"
          :disabled="item.disable"
          class="header-nav-item"
          @click="jump(item.path)">
          <div class="menu-img" :class="`img-${item.id}`">
            <b-img-lazy :src="item.icon" alt="" />
          </div>
          <div class="menu-right">
            <span class="title">{{item.title}}</span>
            <b-icon icon="chevron-right" class="right-icon" />
          </div>
        </b-nav-item>
      </b-navbar-nav>
    </b-collapse>

  </b-navbar>
    <Modal v-model="showCollectionModal" height="480px" :hideHeader="true"  customClass="select-product-modal md-modal">
      <Collection @submit="showCollectionModal=!showCollectionModal"/>
    </Modal>
  </div>

</template>
<script>
import Cookies from 'js-cookie'
import Modal from '@/components/Modal'
import Collection from '@/components/Collection'
export default {
  components: {
    Modal, Collection
  },
  data() {
    return {
      title: '',
      rightPath: '',
      upperRouter: '',
      showCollectionModal: false,
      showMenu: false,
      navList: [{
        icon: require('@/assets/guide/wap-home.png'),
        title: 'Back to homepage',
        path: '/admin/guide',
        disable: false,
        id: 'guide'
      }, {
        icon: require('@/assets/guide/bio-link.png'),
        title: 'Bio Link Tool',
        path: '/admin/links',
        disable: false,
        id: 'links'
      },
      {
        icon: require('@/assets/guide/link-generator.png'),
        title: 'Social post analysis by AI',
        path: 'socialAnalysis',
        disable: false,
        id: 'socialAnalysis'
      }, {
        icon: require('@/assets/guide/link-generator.png'),
        title: 'Video analysis by AI',
        path: '#',
        disable: true,
        id: 'videoAnalysis'
      },
      {
        icon: require('@/assets/guide/link-generator.png'),
        title: 'Image analysis by AI',
        path: '#',
        disable: true,
        id: 'imageAnalysis'
      }]
    }
  },
  watch: {
    '$route.meta': {
      handler(val) {
        this.title = val.headerTitle
        this.rightPath = val.rightPath
        this.upperRouter = val.upperRouter
        this.showMenu = val.showMenu
      },
      immediate: true
    }
  },
  created() {
    const _this = this
    if (!Cookies.get('new-user-flag')) {
      setTimeout(() => {
        _this.showCollectionModal = true
        Cookies.set('new-user-flag', 'true', { expires: 1 })
      }, 100)
    }
  },
  methods: {
    goBack() {
      if (this.upperRouter) {
        this.$router.push('/admin')
      } else {
        this.$router.go(-1)
      }
    },
    linkHelp() {
      this.$router.push(`/${this.rightPath}`)
    },
    isActive(path) {
      return this.$route.path === path
    },
    jump(path) {
      if (path === 'socialAnalysis') {
        this.showCollectionModal = true
      } else if (path === '#') {
        return false
      } else {
        this.$router.push(path)
      }
    }
  }
}
</script>

<style lang="scss" scoped>
.common-header {
  position: fixed;
  z-index: 99;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0 10px;
  width: 100%;
  height: 60px;
  color: #282828;
  background: $white;
  border-bottom: 1px solid $border;
  .right-icon {
    width: 16px;
  }
  .question-icon {
    color: $gray;
  }
  ::v-deep {
    .navbar-toggler {
      padding: 0;
      border: 0;
      height: 60px;
      .b-icon {
        font-size: 30px;
      }
    }
    .navbar-collapse {
      margin: 0 -10px;
      background-color: $white;
      box-shadow: 0 4px 8px 0 rgb(0 0 0 / 16%);
      .navbar-nav {
        flex-direction: column;
      }
      .header-nav-item {
        &:last-child .menu-right{
          border-bottom: none;
        }
        .nav-link {
          padding: 0 14px;
          display: flex;
          justify-content: space-between;
          align-items: center;
          color: #282828;
          &.active {
            background-color: #c5e3f9;
            color: $main;
            font-weight: 600;
          }
        }
        .disabled{
          color: #bbb8b8;
        }
      }
      .menu-img {
        margin-right: 14px;
        width: 24px;
        // height: 30px;
        &.img-linkGenerator {
          width: 28px;
        }
        img {
          width: 100%;
        }
      }
      .menu-right {
        flex: 1;
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 16px 0;
        border-bottom: 1px solid #eee;
        .title {
          font-size: 14px;
        }
        .right-icon {
          color: $gray;
        }
      }
    }

  }
}
</style>
