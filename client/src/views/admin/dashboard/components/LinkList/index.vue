<template>
  <div class="link-list pt-3">
    <template v-if="userInfo">
      <AddLinks :linkHeaders="linkHeaders" :canEditLink="canEditLink" @add-link="addLink" />
      <template >
        <draggable
          class="wrapper px-2"
          v-model="linkList"
          handle=".link-item__left"
          filter=".undraggable"
          group="link"
          :move="onMove"
          @end="onEndDrag">
          <transition-group>
            <div v-for="(linkItem,index) in linkList" :key="linkItem.id" class="link-list-group" :ref="`linkLeft-${linkItem.id}`">
              <LinkItem
                v-if="!linkItem.type||linkItem.type===4"
                :data="linkItem"
                :index="index"
                :key="linkItem.id"
                :canEditLink="canEditLink"
                class="control-link"
                @deleteItem="deleteItem"
                @update="updateLink"
              />
              <LinkGateProductItem
                v-if="linkItem.type===5"
                :data="linkItem"
                :index="index"
                :key="linkItem.id"
                :canEditLink="canEditLink"
                class="control-link"
                @deleteItem="deleteItem"
                @update="updateLink"
              />
              <RecommendProduct
                v-if="linkItem.type===6"
                :data="linkItem"
                :index="index"
                :key="linkItem.id"
                class="control-link undraggable"
                @update="updateLink" />
            </div>
          </transition-group>
        </draggable>
        <template v-if="linkList.length">
          <div class="loading-wrapper" v-if="finish">-- No Data --</div>
          <div class="loading-wrapper" v-else>Load More...</div>
        </template>
      </template>
      <b-overlay :show="loading" no-wrap />
      <b-overlay :show="copyLoading" no-wrap class="copy-loading-card">
        <template #overlay>
          <svg-icon icon-class="loading-simple" class="loading-icon" />
          <p>商品复制中，请勿执行其他操作！</p>
        </template>
      </b-overlay>
    </template>
    <div v-else class="login-card px-3 px-md-5">
      <p>Start your affiliate business with SHEsg!</p>
      <p>Sign in to unlock products of 51% commission.</p>
      <b-button
        class="login-btn main-plain-btn mt-4"
        variant="outline-primary"
        @click="handleLogin"
      >Sign in</b-button>
    </div>

    <Modal v-model="showCopyLinksModal" title="Copy" height="200px" customClass="select-product-modal md-modal">
      <Copy @copy-links="copyLinks" />
    </Modal>

  </div>
</template>

<script>
import { getLinks, addSingleLink, changeLinks, copyLinksByUsername } from '@/api/product'
import Modal from '@/components/Modal'
import AddLinks from '../AddLinks'
import LinkItem from '../LinkItem'
import LinkGateProductItem from '../LinkGateProductItem'
import RecommendProduct from '../RecommendProduct'
import Copy from '../Manage/components/Copy'
import draggable from 'vuedraggable'
import { mapGetters } from 'vuex'
import { isMobile } from '@/utils'
import bus from '@/utils/bus'
export default {
  name: 'Dashboard',
  components: { AddLinks, LinkItem, LinkGateProductItem, draggable, RecommendProduct, Modal, Copy },
  data() {
    return {
      loading: false,
      isMobile: false,
      linkList: [],
      tempList: [], // 用于拖拽对比
      couponInfo: {},
      userProductLinkId: '',
      copyLoading: false,
      showCopyLinksModal: false,
      showCollectionModal: false,
      linkHeaders: [],
      page: 1,
      total: 0,
      finish: false,
      allLinkList: []
    }
  },
  created() {
    const _this = this
    this.isMobile = isMobile()
    this.initLoadData()
    setTimeout(() => {
      _this.showCollectionModal = true
    }, 200)
  },
  computed: {
    ...mapGetters(['userInfo']),
    canEditLink() {
      return this.userInfo?.productEditSign
    }
  },
  methods: {
    getLinkList(refreshIndex = 0, refreshId) {
      this.loading = !this.copyLoading
      const params = {
        userId: this.userInfo?.userId || 'd16edf46947fa936fe1bfe7db6d8e111'
      }
      getLinks(params).then((res) => {
        this.linkList = res.data
        this.linkList.push({
          id: '66666666',
          isAvailable: 1,
          title: 'Women wristband for Apple Watch Ultra Band',
          type: 6
        })

        this.tempList = JSON.parse(JSON.stringify(this.linkList))
        this.getFilterLinkList(refreshIndex, this.linkList, refreshId)
        this.getLinkHeaders()
      }).finally(() => {
        this.loading = false
        this.copyLoading = false
        this.finish = true
      })
    },
    getFilterLinkList(refreshIndex = 0, linkList = this.linkList, refreshId) {
      const filterLinks = linkList.filter(item => item.isAvailable)
      let tempLinks = []
      filterLinks.map((item, index) => {
        if (item.type === 5) {
          item.isBigProduct = false
          tempLinks.push(index)
        } else {
          if (tempLinks.length && tempLinks.length % 2 !== 0) {
            filterLinks[tempLinks[0]].isBigProduct = true
          }
          tempLinks = []
        }
      })
      if (tempLinks.length && tempLinks.length % 2 !== 0) {
        filterLinks[tempLinks[0]].isBigProduct = true
      }
      this.$emit('changeLink', filterLinks)
      bus.$emit('update-link-preview', refreshIndex, refreshId)
    },
    async addHeaderLink(type) {
      const isLogin = await this.$store.dispatch('user/checkLoginHandle')
      if (!isLogin) return false

      // const title = this.initLinkTitle(type)
      const initLink = {
        id: null,
        title: 'Headline Title',
        url: '',
        rank: 0,
        type,
        isAvailable: 1,
        image: ''
      }
      const rank = this.linkList.length ? this.linkList[0].rank + 1 : 0
      this.loading = true
      addSingleLink({ ...initLink, rank }).then(res => {
        const id = res.data
        this.linkList.unshift({ ...initLink, id, rank })
        this.tempList = JSON.parse(JSON.stringify(this.linkList))
        this.getFilterLinkList()
        this.getLinkHeaders()
      }).finally(() => {
        this.loading = false
      })
    },
    getLinkHeaders(linkList = this.linkList) {
      // 现有的header集合（不包含title为空和重复项）
      const linkHeaders = [...linkList]
        .filter(item => item.type === 4 && item.title)
        .map(item => {
          return {
            id: item.id,
            title: item.title
          }
        })
      const hash = {}
      var newArr = linkHeaders.reduce((item, next) => {
        if (!hash[next.title]) {
          hash[next.title] = true
          item.push(next)
        }
        return item
      }, [])
      this.linkHeaders = newArr
    },
    addLink(data) {
      this.loading = true
      const params = {
        url: data.url,
        userId: this.userInfo?.userId || 'd16edf46947fa936fe1bfe7db6d8e111'
      }
      addSingleLink(params).then(res => {
        this.getLinkList(0, res.data)
      }).finally(() => {
        this.loading = false
      })
    },
    async onEndDrag(data) {
      const { newIndex, oldIndex } = data
      const hasChangeList = []
      const minIndex = newIndex > oldIndex ? oldIndex : newIndex
      const maxIndex = newIndex < oldIndex ? oldIndex : newIndex
      this.linkList.forEach((item, index) => {
        if (minIndex <= index && index <= maxIndex) {
          item.rank = this.tempList[index].rank
          hasChangeList.push(item)
        }
      })
      await changeLinks(hasChangeList)
      this.tempList = JSON.parse(JSON.stringify(this.linkList))
      this.getFilterLinkList(newIndex)
      this.getLinkHeaders()
    },
    deleteItem(index) {
      this.getLinkList(index)
    },
    updateLink(data, index) {
      this.linkList.map((item, i) => {
        if (item.id === data.id) {
          this.linkList[i] = data
        }
      })
      this.getFilterLinkList(index)
      this.getLinkHeaders()
    },
    handleLogin() {
      this.$router.push('/login')
    },
    onMove(e) {
      if (e.relatedContext.element.type === 6) return false
      return true
    },
    showcopyLoading(copyLoading = true) {
      this.copyLoading = copyLoading
    },
    copyLinks(userName) {
      this.copyLoading = true
      copyLinksByUsername({ userName }).then(res => {
        this.showCopyLinksModal = false
        this.getLinkList()
      }).catch(() => {
        this.copyLoading = false
      })
    },
    initLoadData() {
      this.loading = true
      const params = {
        userId: this.userInfo?.userId || 'd16edf46947fa936fe1bfe7db6d8e111'
      }
      getLinks(params).then(res => {
        this.allLinkList = res.data
        this.allLinkList.push({
          id: '66666666',
          isAvailable: 1,
          title: 'Women wristband for Apple Watch Ultra Band',
          type: 6
        })
        this.total = res.data.length
        this.linkList = this.allLinkList.slice(0, 20)

        this.tempList = JSON.parse(JSON.stringify(this.linkList))
        this.getFilterLinkList(0, this.allLinkList)
        this.getLinkHeaders(this.allLinkList)
        if (this.linkList.length >= this.total) {
          this.finish = true
        }
        this.page++
      }).finally(() => {
        this.loading = false
      })
    },
    loadData() {
      if (this.finish) return
      this.linkList = this.allLinkList.slice(0, 20 * this.page)

      this.tempList = JSON.parse(JSON.stringify(this.linkList))
      if (this.linkList.length >= this.total) {
        this.finish = true
      }
      this.page++
    }
  }
}
</script>

<style lang="scss" scoped>
@import './index.scss';
</style>
