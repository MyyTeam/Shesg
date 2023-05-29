<template>
  <div class="guide-main mt-3">
    <div class="guide-information p-4">
      <h3 class="guide-title">Why choose shESG to start your social business?</h3>
      <p class="guide-info mt-3">shESG offering thousands of ESG product suppliers, up to x% commission affiliate program, and empower you with useful tools!</p>
      <div class="tool-container">
        <div v-for="item in toolList" :key="item.id" class="tool-item" :class="{'coming':!item.path}">
          <div class="tool-item-main">
            <div class="tool-img">
              <b-img-lazy :src="item.icon" alt="" />
            </div>
            <h5 class="tool-title">{{item.title}}</h5>
            <p class="tool-info my-3">{{item.info}}</p>
            <p class="tool-keyword">
              <b>Key words: </b>
              <span>{{item.keywords}}</span>
            </p>
            <div class="tool-flag">{{item.flag}}</div>
          </div>
          <div class="operation-btns operation-hide pt-2">
            <b-button
              class="main-btn operation-btn mb-2"
              :class="{'disabled':!item.path}"
              variant="primary"
              size="sm"
              @click="jump(item.path)"
            >
              {{item.btnText}}
            </b-button>
          </div>

        </div>
      </div>
    </div>
    <div class="guide-mode my-5">
      <div class="mode-item">
        <div class="mode-title">Commission Based Mode</div>
        <ul>
          <li>
            <b-icon icon="check2-square" class="check-icon" />
            <span>No worries about supply chain and product fulfillment</span>
          </li>
          <li>
            <b-icon icon="check2-square" class="check-icon" />
            <span>No cost investment</span>
          </li>
          <li>
            <b-icon icon="check2-square" class="check-icon" />
            <span>Customers buy on supplier's end. The more sales amount, the more commission you will earn</span>
          </li>
        </ul>
      </div>
      <div class="vs">VS</div>
      <div class="mode-item mode-item--yellow">
        <div class="mode-title">Margin Based Mode</div>
        <ul>
          <li>
            <b-icon icon="check2-square" class="check-icon" />
            <span>No worries about supply chain and product fulfillment</span>
          </li>
          <li>
            <b-icon icon="check2-square" class="check-icon" />
            <span>No cost investment</span>
          </li>
          <li>
            <b-icon icon="check2-square" class="check-icon" />
            <span>Customer will not know suppliers, and how much you earn totally depends on yourself</span>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'GuideInformation',
  data() {
    return {
      toolList: [
        {
          icon: require('@/assets/guide/guide-link.png'),
          title: 'Tool for Affiliate Program',
          info: 'Specialized for affiliate marketers, with all product links in one link.',
          keywords: 'Free Sample, Earn 51% Commission, Linktree Alternative',
          flag: 'Earn Commission',
          path: '/admin/links',
          btnText: 'Direct to Use',
          id: 'affiliate'
        },
        {
          icon: require('@/assets/guide/guide-dropshipping.png'),
          title: 'Tool for Drop Shipping',
          info: 'No need to decorate the website shop,  one click to add your margin and earn.',
          keywords: 'Free Sample, Decide Your Margin, Drop Shipping',
          flag: 'Earn Margin',
          path: '/admin/products',
          btnText: 'Direct to Use',
          id: 'dropshipping'
        }
      ]
    }
  },
  created() {},
  methods: {
    jump(path) {
      if (!path) return
      this.$router.push(path)
    }
  }
}
</script>

<style lang="scss" scoped>
.guide-main {
  color: #282828;
  .guide-information {
    text-align: center;
    background-color: $white;
    .guide-title {
      font-size: 26px;
      font-weight: 600;
    }
    .guide-info {
      margin: 0 auto;
      max-width: 700px;
    }
    .tool-container {
      display: flex;
      justify-content: space-between;
      margin-top: 30px;
    }
    .tool-item {
      position: relative;
      overflow: hidden;
      margin: 0 10px;
      width: calc(50% - 20px);
      border: 1px solid $border;
      border-radius: 8px;
      cursor: pointer;
      &:hover {
        overflow: visible;
        background: #e3efff;
        box-shadow: 0 4px 8px 0 rgb(88 146 242 / 10%);
        transition: all 0.6;
        .tool-item-main {
          filter: opacity(50%);
        }
        .operation-btns {
          opacity: 1;
          transition: opacity .6s;
        }
      }
      &.coming {
        overflow: visible;
        background: #ddd;
        box-shadow: 0 4px 8px 0 rgb(88 146 242 / 10%);
        transition: all 0.6;
        .tool-item-main {
          filter: opacity(50%);
        }
        .operation-btns {
          opacity: 1;
          transition: opacity .6s;
        }
      }
      .tool-item-main {
        padding: 40px 20px;
      }
      .tool-img {
        margin: 0 auto 16px;
        padding: 26px;
        width: 100px;
        height: 100px;
        background: linear-gradient(#d2e6fd, #fff);
        border-radius: 6px;
        img {
          width: 100%;
        }
      }
      .tool-title {
        color: $main;
        font-weight: 600;
      }
      .tool-info {
        padding: 0 50px;
      }
      .tool-keyword {
        font-size: 14px;
        color: $gray;
        b {
          color: #282828;
        }
      }
      .tool-flag {
        position: absolute;
        top: 0;
        left: 0;
        width: 140px;
        line-height: 2;
        text-align: center;
        font-size: 14px;
        background: #fdb40b;
        font-weight: 600;
        border-radius: 0 0 8px;
      }
      .operation-btns {
        position: absolute;
        left: 0;
        right: 0;
        bottom: 0;
        z-index: 4;
        opacity: 0;
        width: 100%;
        padding: 0 10px 10px;
        transition: opacity .6s;
        .operation-btn {
          padding: 6px 40px;
          box-shadow: none;
          font-weight: 600;
          border-radius: 30px;
          &.disabled {
            background: #666;
            border-color: #666;
          }
        }
      }
    }
  }
  .guide-mode {
    display: flex;
    justify-content: center;
    align-items: center;
    // padding-bottom: 50px;
    .mode-item {
      padding: 20px 20px 10px;
      width: 360px;
      background: #cee3ff;
      border-radius: 6px;
      &.mode-item--yellow {
        background: #f7ebc0
      }
      .mode-title {
        margin-bottom: 8px;
        text-align: center;
        font-weight: 600;
        font-size: 18px;
      }
      .check-icon {
        margin-top: 3px;
        margin-right: 10px;
        color: #349933;
      }
      li {
        display: flex;
        margin-bottom: 10px;
      }
    }
    .vs {
      margin: 0 calc(25% - 190px);
      font-size: 20px;
      font-style: italic;
      font-weight: 600;
      color: #fdb40b;
    }
  }
}
</style>
