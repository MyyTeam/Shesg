<template>
  <div class="phone-product-item">
    <div class="header phone-item" :class="visible ? null : 'collapsed'"
      :aria-expanded="visible ? 'true' : 'false'"
      aria-controls="collapse-phone-product"
      @click="visible = !visible">
      <div class="img-card">
        <img v-if="item.image" :src="item.image" alt="link-img" class="link-img">
      </div>
      <span class="link-title">{{item.title}}</span>
      <div class="icon-card">
        <b-icon icon="chevron-down" class="down-icon" />
      </div>
    </div>
    <b-collapse id="collapse-phone-product" class="collapse-phone-product" v-model="visible">
      <div class="link-info text-center py-1">{{item.description}}</div>
      <Tab v-show="count || !isFromUser" :tabList="groupList" @change-tab="changeTab" />
      <scroll
        ref="scrollWrapper"
        class="wrapper"
        :data="productList"
        :pullup="true"
        @scrollToEnd="loadData">
        <b-container class="product-card">
          <b-row>
            <b-col cols="6" v-bind="mainProps" v-for="(productItem,i) in productList" :key="productItem.id">
              <ProductItem
                v-trace:userproduct.click.expose="{...traceEventInfo,title:item.title}"
                :spm-index="i"
                linkType="userProduct"
                :productInfo="productItem"
                :aid="traceEventInfo.aid" />
            </b-col>
          </b-row>
          <b-img v-if="!productList.length" :src="noDataImg" alt="link-img" class="no-data-img" />
          <div class="loading-wrapper" v-if="finish">-- No Data --</div>
          <div class="loading-wrapper" v-else>Load More...</div>
        </b-container>
      </scroll>
    </b-collapse>
  </div>
</template>

<script>
import { getLinkProduct, getProductGroups, getGroupProductsNum } from '@/api/product'
import Scroll from '@/components/Scroll'
import Tab from '@/components/Tab'
import ProductItem from '@/components/ProductItem'
export default {
  components: { ProductItem, Scroll, Tab },
  props: {
    type: {
      type: String,
      default: 'control'
    },
    needProductReload: {
      type: Boolean,
      default: false
    },
    item: {
      type: Object,
      default: () => {}
    },
    traceEventInfo: {
      type: Object,
      default: () => {}
    }
  },
  data() {
    return {
      query: {
        cateId: '',
        linkId: '',
        page: 1,
        pageSize: 6
      },
      total: 0,
      count: 0,
      finish: false,
      productList: [],
      groupList: [],
      visible: true,
      needReload: false,
      noDataImg: require('@/assets/common/no-data.png')
    }
  },
  computed: {
    isFromUser() {
      return this.type === 'user'
    },
    mainProps() {
      if (this.isFromUser) {
        return { md: '4' }
      } else {
        return {}
      }
    }
  },
  watch: {
    visible(val) {
      if (val) {
        this.$nextTick(() => {
          this.$refs.scrollWrapper._initScroll()
        })
      }
    },
    needProductReload(val) {
      this.needReload = val
    },
    needReload(val) {
      if (val) {
        this.query.page = 1
        this.loadData()
      }
    }
  },
  mounted() {
    this.query.linkId = this.item.id
    this.loadData()
    this.getGroupList()
  },
  methods: {
    loadData() {
      if (this.finish && !this.needReload) return
      getLinkProduct(this.query).then(res => {
        const data = res.data.data || []
        this.productList = this.needReload ? [] : this.productList
        this.productList = this.productList.concat(data)
        this.total = res.data.count
        if (this.productList.length >= this.total) {
          this.finish = true
        }
        if (!this.query.cateId && this.query.page === 1) {
          this.count = this.total
        }
        this.query.page++
        // if (!this.productList.length) {
        //   this.visible = false
        // }
      }).finally(() => {
        if (this.needReload) {
          this.needReload = false
          this.$emit('update:needProductReload', false)
        }
      })
    },
    // linkProduct(item) {
    //   window.open(item.productUrl)
    // },
    getGroupList() {
      getProductGroups().then(async res => {
        let groups = res.data
        if (!groups.length) return false
        if (this.isFromUser) {
          const { data } = await getGroupProductsNum({ linkId: this.query.linkId })
          groups.forEach(groupItem => {
            data.forEach(numItem => {
              if (groupItem.id === numItem.cateId) {
                groupItem.productNum = numItem.productNum
              }
            })
          })
          groups = groups.filter(item => item.productNum)
        } else {
          groups = groups.filter(item => item.name !== 'Aliexpress Selection')
        }
        this.groupList = [
          {
            id: '',
            name: 'ALL'
          },
          ...groups
        ]
      }).finally(() => {
        if (this.needReload) {
          this.$emit('update:needProductReload', false)
        }
      })
    },
    changeTab(id) {
      this.query.cateId = id
      this.needReload = true
      this.$refs.scrollWrapper.scrollTo(0, 0)
    }
  }
}
</script>

<style lang="scss" scoped>
.collapse-phone-product {
  height: 400px;
  .wrapper {
    height: calc(100% - 60px);
    overflow: hidden;
    position: relative;
  }
  .loading-wrapper {
    padding-bottom: 10px;
    text-align: center;
    color: #888;
  }
}
</style>
