<template>
  <b-nav vertical class="sidebar">
    <b-nav-item v-for="item in navList" :key="item.id" :class="{'not-collapsed': item.collapse}">
      <b-nav-text @click="toggleCollapse(item)" :class="{'menu--active':item.path===$route.path}">
        <div class="d-flex align-items-center">
          <!-- <svg-icon v-if="item.icon" :icon-class="item.icon" class="menu-icon" /> -->
          <div class="menu-img-wrap">
            <b-img-lazy :src="item.icon" alt="" class="menu-img" :class="`img-${item.id}`" />
          </div>
          <span>{{item.title}}</span>
        </div>
        <b-icon v-if="item.children" icon="chevron-down" class="sidebar-down" />
      </b-nav-text>
      <b-collapse v-if="item.children" :id="`collapse-${item.id}`" v-model="item.collapse" class="sub-menu">
        <b-nav-item v-for="subItem in item.children" :key="subItem.id">
          <b-nav-text @click="jump(subItem)" :class="{'menu--active':subItem.path===$route.path}">
            <span>{{subItem.title}}<svg-icon v-if="subItem.isExternal" icon-class="external-link" class="link-icon" /></span>
          </b-nav-text>
        </b-nav-item>
      </b-collapse>
    </b-nav-item>
  </b-nav>

</template>

<script>
import { mapGetters } from 'vuex'
export default {
  data () {
    return {
      navList: [{
        title: 'Bio Link',
        path: '/admin/links',
        id: 'links',
        icon: require('@/assets/guide/bio-link.png')
      }, {
        title: 'Orders',
        path: '/admin/commission-income',
        id: 'commission',
        icon: require('@/assets/guide/orders.png')
      }]
    }
  },
  watch: {
    '$route.name': {
      handler(val) {
        this.navList.forEach(item => {
          if (item.childrenPath?.includes(val)) {
            item.collapse = true
          }
        })
      },
      immediate: true
    }
  },
  computed: {
    ...mapGetters(['userInfo']),
    thirdAccessToken() {
      return this.userInfo?.thirdAccessToken
    }
  },
  mounted () { },
  methods: {
    toggleCollapse(item) {
      if (item.children) {
        item.collapse = !item.collapse
      } else {
        this.jump(item)
      }
    },
    jump({ path, isExternal }) {
      if (path) {
        if (isExternal) {
          window.open(`${path}&token=${this.thirdAccessToken}`)
          return
        }
        this.$router.push(path)
      }
    }
  }
}
</script>

<style lang="scss" scoped>
.sidebar {
  flex-shrink: 0;
  padding-top: 8px;
  width: 240px;
  background: $white;
  color: #282828;
  font-size: 16px;
  // font-weight: 600;
  a {
    color: #282828;
  }
  ::v-deep {
    .nav-item {
      .sidebar-down {
        font-size: 15px;
        transition: transform 0.2s;
      }
      &.not-collapsed .sidebar-down {
        transform:rotate(180deg);
        transition: transform 0.2s;
      }
      .menu-icon {
        margin-right: 8px;
        font-size: 18px;
      }
    }
    .navbar-text {
      padding: 8px 16px;
      display: flex;
      width: 100%;
      justify-content: space-between;
      align-items: center;
    }
    .nav-link {
      padding: 8px 0;
      .navbar-text {
        &:hover {
          color: $main;
        }
        &.menu--active {
          color: $main;
          background: #cee3ff;
          border-radius: 4px;
          font-weight: 600;
        }
      }
      .menu-img-wrap {
        margin-right: 10px;
        width: 28px;
        display: flex;
        align-items: center;
        justify-content: center;
      }
      .menu-img {
        width: 24px;
        &.img-commission {
          width: 22px;
        }
        &.img-downlines {
          width: 20px;
        }
        &.img-sample {
          width: 26px;
        }
        &.img-linkGenerator {
          width: 28px;
        }
      }
    }
    .sub-menu {
      .nav-link {
        padding: 0;
      }
      .navbar-text {
        padding: 8px 16px 8px 50px;
      }
    }
  }
}
</style>
