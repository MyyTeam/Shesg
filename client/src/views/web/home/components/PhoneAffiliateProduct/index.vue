<template>
  <div class="phone-product" id="phoneProduct">
    <div v-for="productItem in productList" :key="productItem.id" class="list-item">
      <ProductItem
        :productInfo="productItem" />
    </div>
    <div class="loading-wrapper" v-if="finish">-- No Data --</div>
    <div class="loading-wrapper" v-else>Load More...</div>
  </div>
</template>

<script>
import { getAffiliateProductList } from '@/api/product'
import ProductItem from '@/components/ProductItem'
import { joinUrl } from '@/utils'
export default {
  components: { ProductItem },
  props: {
    traceEventInfo: {
      type: Object,
      default: () => {}
    },
    linkItem: {
      type: Object,
      default: () => {}
    }
  },
  data() {
    return {
      query: {
        keyWord: '',
        page: 1,
        pageSize: 6
      },
      total: 0,
      finish: false,
      productList: [],
      loading: false
    }
  },
  // computed: {
  //   spmc() {
  //     return this.activeGroup.type === 1 ? 'userproduct' : 'pickedproduct'
  //   }
  // },
  created() {
    this.loadData()
  },
  methods: {
    loadData() {
      if (this.finish) return
      getAffiliateProductList(this.query).then(res => {
        const data = res.data || []
        data.forEach(item => {
          // if (item.productUrl.includes('dhgate.com')) {
          item.redirectUrl = joinUrl(item.productUrl, { f: `bm|aff|yfaf|${this.traceEventInfo.aid}|||new|` })
          // } else if (!/^(https?):\/\//.test(item.productUrl)) {
          //   item.redirectUrl = `https://${item.productUrl}`
          // }
        })
        this.productList = this.productList.concat(data)
        this.total = res.data.count
        if (this.productList.length >= this.total) {
          this.finish = true
        }
        this.query.page++
      }).finally(() => {
        this.loading = false
      })
    }
  }
}
</script>

<style lang="scss" scoped>
.phone-product {
  display: flex;
  flex-wrap: wrap;
  margin: 0 -6px;
  .list-item {
    padding: 0 6px;
    width: 50%;
  }
  .loading-wrapper {
    padding-bottom: 10px;
    width: 100%;
    text-align: center;
    color: #888;
  }
}
</style>
