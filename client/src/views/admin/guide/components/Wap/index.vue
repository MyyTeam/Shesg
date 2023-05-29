<template>
  <div class="guide-main">
    <div class="menu-card">
      <div v-for="item in menuList" :key="item.id" class="menu-item" @click="jump(item.path)">
        <div class="menu-img">
          <b-img-lazy :src="item.icon" alt="" />
        </div>
        <div class="menu-right">
          <div>
            <p class="title">{{item.name}}</p>
            <p class="info">{{item.info}}</p>
          </div>
          <b-icon icon="chevron-right" class="right-icon" />
        </div>
      </div>
    </div>
    <div class="statistics-card">
      <svg-icon icon-class="report" class="report-icon" />
      <div class="link-card pt-3">
        <div class="statistics-title">
          <span>Links Added</span>
          <svg-icon v-if="linkTotal" icon-class="add" class="add-icon" @click="jump('/admin/links')" />
        </div>
        <div class="link-card__content my-2 px-3 py-2">
          <template v-if="userInfo">
            <template v-if="linkTotal">
              <div class="link-item d-flex" v-for="item in linkList" :key="item.id">
                <div class="d-flex">
                  <div class="link-img">
                    <b-img-lazy :src="item.icon" alt="" />
                  </div>
                  <span>{{item.name}}</span>
                </div>
                <span class="link-count">{{ linkInfo[item.id] }}</span>
              </div>
            </template>
            <div v-else class="empty-card" @click="jump('/admin/links')">
              <p class="pb-3">You don't add any link</p>
              <div class="add-link">
                <svg-icon icon-class="add" class="add-icon" />
                <span class="pl-1">Click to Add</span>
              </div>
            </div>
          </template>
          <div v-else class="empty-card">
            <p class="pb-2">Start your affiliate businesss with shESG!</p>
            <b-button
              class="main-plain-btn login-btn"
              variant="outline-primary"
              size="sm"
              @click="handleLogin"
            >Sign in</b-button>
          </div>
        </div>
      </div>
      <div class="income-card pt-3">
        <div class="statistics-title">
          <span>Income</span>
          <b-icon icon="chevron-right" class="right-icon" @click="jump('/admin/commission-income')" />
        </div>
        <div class="income-card__content mt-2 px-3 py-2">
          <div class="link-item d-flex" v-for="item in incomeList" :key="item.id">
            <div class="d-flex">
              <div class="link-img">
                <b-img-lazy :src="item.icon" alt="" />
              </div>
              <span>{{item.name}}</span>
            </div>
            <span class="link-count">
              <span v-if="item.showUSD" class="usd pr-1">USD</span>
              <span>{{ referralInfo[item.id] }}</span>
            </span>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
import { getLinksCount } from '@/api/product'
export default {
  name: 'GuideInformation',
  data() {
    return {
      menuList: [
        {
          icon: require('@/assets/guide/bio-link.png'),
          name: 'Bio Link Tool',
          info: 'All in one link',
          path: '/admin/links',
          id: 'bioLink'
        }
      ],
      linkList: [
        {
          icon: require('@/assets/guide/wap-product.png'),
          name: 'Products',
          id: 'productsNum'
        },
        {
          icon: require('@/assets/guide/wap-link.png'),
          name: 'Normal Links',
          id: 'normalNum'
        },
        {
          icon: require('@/assets/guide/wap-header.png'),
          name: 'Module Header',
          id: 'headerNum'
        }
      ],
      incomeList: [
        {
          icon: require('@/assets/guide/wap-commission.png'),
          name: 'Commission',
          showUSD: true,
          count: '',
          id: 'pendingCommission'
        },
        {
          icon: require('@/assets/guide/wap-amount.png'),
          name: 'Sales Amount',
          showUSD: true,
          count: '',
          id: 'ordersTotalAmount'
        },
        {
          icon: require('@/assets/guide/wap-orders.png'),
          name: 'Orders',
          showUSD: false,
          count: '',
          id: 'ordersTotalNum'
        }
      ],
      linkTotal: 0,
      linkInfo: {
        headerNum: 0,
        normalNum: 0,
        productsNum: 0
      },
      referralInfo: {
        pendingCommission: '190.00',
        ordersTotalAmount: '220.00',
        ordersTotalNum: '4300.00'
      }
    }
  },
  created() {
    if (this.userInfo) {
      this.getReferralInfo()
      this.getLinksCount()
    }
  },
  computed: {
    ...mapGetters(['userInfo'])
  },
  methods: {
    getReferralInfo() {

    },
    getLinksCount() {
      getLinksCount().then(res => {
        console.log(res.data)
        this.linkInfo = res.data
        const { headerNum, normalNum, productsNum } = this.linkInfo
        this.linkTotal = headerNum + normalNum + productsNum
      })
    },
    jump(path) {
      this.$router.push(path)
    },
    handleLogin() {
      this.$router.push('/login')
    },
    linkAffiliate() {
      const url = 'https://www.myyaffiliate.com/en/'
      this.openUrl(url)
    },
    openUrl(url) {
      const u = navigator.userAgent
      const isiOS = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/)
      if (isiOS) {
        window.location.href = url
      } else {
        window.open(url, '_blank')
      }
    }
  }
}
</script>

<style lang="scss" scoped>
.guide-main {
  color: $black;
  font-size: 14px;
  .menu-card {
    margin-top: 10px;
    padding: 10px 0;
    // font-size: 12px;
    background-color: $white;
    .menu-item {
      display: flex;
      align-items: center;
      padding: 0 20px;
      &:last-child .menu-right{
        border-bottom: none;
      }
    }
    .menu-img {
      margin-right: 20px;
      width: 30px;
      height: 30px;
      img {
        width: 100%;
      }
    }
    .menu-right {
      flex: 1;
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 10px 0;
      border-bottom: 1px solid #eee;
      .title {
        font-size: 14px;
      }
      .info {
        font-size: 12px;
        color: $gray;
      }
    }
  }
  .statistics-card {
    margin-top: 10px;
    padding: 10px 14px;
    background-color: $white;
    .report-icon {
      font-size: 20px;
      color: #abd9fa;
    }
    .statistics-title {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding-right: 6px;
      font-weight: 600;
      font-size: 16px;
    }
    .link-card {
      .add-icon {
        color: $main;
        font-size: 24px;
      }
      &__content {
        background-color: #f3f3f1;
        border-radius: 8px;
      }
    }
    .income-card .right-icon {
      color: $gray;
    }
    .link-item {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 6px 0;
      .link-img {
        margin-right: 16px;
        width: 20px;
        height: 20px;
        img {
          width: 100%;
        }
      }
      .usd {
        color: $main;
      }
    }
    .empty-card {
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      min-height: 120px;
      font-size: 15px;
      text-align: center;
      p {
        width: 200px;
      }
      .add-link {
        display: flex;
        align-items: center;
        color: $main;
        font-weight: 600;
        line-height: 24px;
      }
    }
  }
  .affiliate-card {
    margin-top: 10px;
    padding: 10px;
    // height: 60px;
    color: $white;
    text-align: center;
    background-color: #b2dcdb;
  }
}
</style>
