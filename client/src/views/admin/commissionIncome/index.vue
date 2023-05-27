<template>
  <b-container fluid class="commission-income p-0 p-md-3">
    <MHeader v-if="isMobile" />
    <div class="commission-main">
      <b-row>
        <b-col cols="6" md="3" class="commission-balance commission-total">
          <div class="commission-item">
            <div class="title">
              <b-icon icon="credit-card2-back-fill" class="total-icon" />
              <span>Commission</span>
            </div>
            <div class="count py-1 py-md-2">
              ${{ referralInfo.pendingCommission }}
            </div>
            <b-button
              v-trace:withdraw.click="traceEventInfo"
              spm-index="withdrawbtn"
              class="withdraw-btn main-btn"
              variant="primary"
              size="sm"
              @click="linkWithdraw"
            >Withdraw</b-button>
          </div>
        </b-col>
        <b-col cols="6" md="3" class="commission-total">
          <div class="commission-item">
            <div class="title">
              <b-icon icon="credit-card2-back-fill" class="total-icon" />
              <span>Sales</span>
            </div>
            <div class="d-flex justify-content-center py-2">
              <div class="order-count">
                <span class="count">${{ referralInfo.ordersTotalAmount }}</span>
                <span class="info">Amount</span>
              </div>
              <div class="divider" />
              <div class="order-count">
                <span class="count">{{ referralInfo.ordersTotalNum }}</span>
                <span class="info">Orders</span>
              </div>
            </div>
          </div>
        </b-col>
        <b-col cols="12" md="6" class="commission-info-wrap">
          <div class="commission-info">
            <div class="commission-info__title">
              <span>How to earn commission?</span>
              <div
                class="question-collapse-btn d-block d-md-none"
                :class="{'collapsed question-collapse-up':showInfoCollapse}"
                aria-controls="collapse-question"
                @click="changeInfoCollapse">
                  <svg-icon icon-class="down-arrow" class="down-icon" :class="{'up-icon':showInfoCollapse}" />
              </div>
            </div>
            <b-collapse id="collapse-question" v-model="showInfoCollapse" class="collapse-question">
              <div class="commission-info__content">
                <p>Step 1: Use link tool of SHEsg to add DHgate product link url</p>
                <p>Step 2: Copy your own SHEsg page link</p>
                <p>Step 3: Put your SHEsg page link on your bio accounts</p>
                <p>Step 4: Promote the products to your audiences</p>
              </div>
              <div v-trace:gotoearn.click="traceEventInfo" spm-index="clickgotoearn" class="commission-info__link mt-2" @click="goEarn">Go to earn >></div>
            </b-collapse>
          </div>
        </b-col>
      </b-row>
    </div>
    <div class="commission-list mt-3 mt-md-4 p-3 p-md-4">
      <div class="commission-list__title pb-3">Oder List</div>
      <div class="commission-list-search pb-md-2">
        <div class="date-group">
          <b-form-datepicker v-model="minDate" locale="en" placeholder="Start date" size="sm" class="search-input" :date-format-options="{ year: 'numeric', month: 'numeric', day: 'numeric' }" @input="onBlur"></b-form-datepicker>
          <b-form-datepicker v-model="maxDate" locale="en" placeholder="End date" size="sm" class="search-input" :date-format-options="{ year: 'numeric', month: 'numeric', day: 'numeric' }" @input="onBlur"></b-form-datepicker>
          <b-button
            v-trace:orderlist.click="traceEventInfo"
            spm-index="searchbtn"
            class="search-btn main-plain-btn d-none d-md-block ml-md-3"
            variant="outline-primary"
            size="sm"
            @click="search"
          >Search</b-button>
          <p v-show="showDateError" class="error-tip">Start date should be less than end date</p>
        </div>
        <div class="search-group">
          <b-button
            v-trace:orderlist.click="traceEventInfo"
            spm-index="searchbtn"
            class="search-btn main-plain-btn d-block d-md-none"
            variant="outline-primary"
            size="sm"
            @click="search"
          >Search</b-button>
          <span v-trace:orderlist.click="traceEventInfo" spm-index="outputorder" class="export-link" @click="exportOrder">Export the order list</span>
        </div>
      </div>
      <b-table hover borderless small head-variant="light" :items="list" :fields="fields" :busy="loading">
      </b-table>
      <div class="empty-text py-5" v-show="!list.length">No Affiliate Orders</div>
      <b-pagination
        v-if="total > query.pageSize"
        v-model="query.page"
        :total-rows="total"
        :per-page="query.pageSize"
        align="end"
        size="sm"
        hide-goto-end-buttons
        @change="handleChangePagination"
      ></b-pagination>
    </div>
    <div class="commission-question my-3 my-md-4">
      <div class="commission-question__title">
        Frequently Asked Questions
        <div
          class="question-collapse-btn"
          :class="{'collapsed question-collapse-up':showCollapse}"
          aria-controls="collapse-question"
          @click="changeCollapse">
            <svg-icon icon-class="down-arrow" class="down-icon" :class="{'up-icon':showCollapse}" />
        </div>
      </div>
      <b-collapse id="collapse-question" v-model="showCollapse" class="collapse-question">
        <div class="commission-question__content p-3 p-md-4">
          <div class="question-item">
            <p class="q">Q:  When and how do I get paid?</p>
            <p class="a">A:  When the order is completed on our merchants’ site, we will send sales data to DHgate in-house affiliate network. A completed order means the buyer is satisfied with the purchase and releases payment to the seller within 45 days from the original purchase date.</p>
          </div>
          <div class="question-item">
            <p class="q">Q:  When can I withdraw my commission?</p>
            <p class="a">A: You can withdraw your commission to PayPal when the Available Balance is over $50, and to your bank account when the Available Balance is over $300.</p>
          </div>
          <div class="question-item">
            <p class="q">Q:  When can I receive my money?</p>
            <p class="a">A: We will release payment to you within 15 working days after receiving your application.</p>
          </div>
        </div>
      </b-collapse>
    </div>
  </b-container>
</template>

<script>
import { mapGetters } from 'vuex'
import { isMobile, parseTime } from '@/utils'
import MHeader from '../dashboard/components/MHeader'

const date = new Date()
const INIT_END_DATE = parseTime(date, '{y}-{m}-{d}')
const INIT_START_DATE = parseTime(new Date(date - 24 * 60 * 60 * 1000 * 30), '{y}-{m}-{d}')

export default {
  name: 'CommissionIncome',
  components: { MHeader },
  data() {
    return {
      isMobile: false,
      referralInfo: {
        pendingCommission: '200.00',
        ordersTotalAmount: '199.00',
        ordersTotalNum: '222.00'
      },
      total: 0,
      minDate: INIT_START_DATE,
      maxDate: INIT_END_DATE,
      showDateError: false,
      query: {
        page: 1,
        pageSize: 10,
        beginDate: '',
        endDate: ''
      },
      loading: false,
      list: [],
      fields: [
        { key: 'orderNo', label: 'Oder No.' },
        { key: 'salesAmount', label: 'Sales Amount（USD）' },
        { key: 'verifyStatus', label: 'Status' },
        { key: 'createTime', label: 'Create Time' }
      ],
      showCollapse: false,
      showInfoCollapse: false
    }
  },
  async created() {
    this.isMobile = isMobile()
    this.showInfoCollapse = !this.isMobile
    this.search()
  },
  provide: function() {
    return {
      traceEventInfo: this.traceEventInfo
    }
  },
  computed: {
    ...mapGetters(['userInfo']),
    traceEventInfo() {
      if (!this.userInfo) return {}
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
  methods: {

    linkWithdraw() {
    },
    goEarn() {
      this.$router.push('/admin/links')
    },
    search() {
      if (this.showDateError) return
      this.query.beginDate = this.minDate + ' 00:00:00'
      this.query.endDate = this.maxDate + ' 23:59:59'
      this.query.page = 1
    },
    getOrderList() {
      this.loading = true
      // 查询
    },
    onBlur() {
      if (this.minDate && this.maxDate && this.minDate > this.maxDate) {
        this.showDateError = true
      } else {
        this.showDateError = false
      }
    },
    changeCollapse() {
      this.showCollapse = !this.showCollapse
    },
    changeInfoCollapse() {
      this.showInfoCollapse = !this.showInfoCollapse
    },
    handleChangePagination(page) {
      this.query.page = page
      this.getOrderList()
    },
    exportOrder() {

    }
  }
}
</script>

<style lang="scss" scoped>
.commission-income {
  font-size: 16px;
  color: $black;
  .commission-main {
    .commission-item {
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      height:100%;
      font-weight: 600;
      font-size: 18px;
      background: $white;
      .title {
        display: flex;
        align-items: center;
      }
      .total-icon {
        margin-right: 8px;
        color: $main;
      }
      .count {
        color: $main;
      }

      .info {
        padding-top: 10px;
        font-size: 14px;
        font-weight: 400;
        color: $gray;
        text-align: center;
      }
      .order-count {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
      }
      .divider {
        margin: 0 20px;
        width: 1px;
        height: 100%;
        background-color: $border;
      }
    }
    .commission-info {
      padding: 14px 18px;
      height:100%;
      background: $white;
      &__title {
        display: flex;
        align-items: center;
        font-weight: 600;
      }
      &__content {
        margin-top: 10px;
        padding: 14px;
        background: #cee3ff;
      }
      &__link {
        text-align: right;
        font-weight: 600;
        color: $main;
        font-size: 14px;
        cursor: pointer;
      }
    }
  }
  .commission-list {
    background: $white;
    &__title {
      font-weight: 600;
    }
    &-search {
      display: flex;
      flex-wrap: wrap;
      justify-content: space-between;
      >div {
        display: flex;
        align-items: center;
        margin-bottom: 20px;
      }
      .date-group {
        position: relative;
        .error-tip {
          position: absolute;
          bottom: -18px;
          font-size: 12px;
          color: red;
        }
      }
      .search-input {
        margin-right: 10px;
        width: 160px;
      }
      .search-btn {
        width: 100px;
      }
      .export-link {
        color: $main;
        font-size: 14px;
        font-weight: 600;
        cursor: pointer;
      }
    }
    .empty-text {
      color: $gray;
      text-align: center;
    }
  }
  .commission-question {
    background: $white;
    &__title {
      display: flex;
      padding: 14px 10px;
      font-weight: 600;
      border-left: 14px solid $main;
    }
    .question-item {
      margin-bottom: 14px;
    }
  }
  .question-collapse-btn {
    padding-left: 10px;
    line-height: 20px;
    cursor: pointer;
  }
  .down-icon {
    // font-size: 18px;
    transition: transform 0.2s;
    &.up-icon {
      transform:rotate(180deg);
      transition: transform 0.2s;
    }
  }
  ::v-deep {
    th,td {
      font-size: 14px;
      vertical-align: middle;
      text-align: center;
    }
    th {
      line-height: 2.2;
      background-color: #cee3ff;
    }
  }
  @media screen and (max-width: 540px) {
    font-size: 14px;
    .commission-main {
      .commission-item {
        font-size: 16px;
      }
      .row{
        margin-right: 0;
        margin-left: 0;
      }
      .commission-info {
        padding: 14px 16px;
      }
    }
    .commission-total {
      background: $white;
      padding: 0;
      margin: 16px 0;
    }
    .commission-info-wrap {
      padding: 16px 0 0 0;
      background: #f5f8ff;
    }
    .commission-balance {
      border-right: 1px solid $main;
    }
    .commission-question {
      background: transparent;
      &__title {
        padding: 0 0 0 16px;
        border: 0;
      }
    }
    .commission-list {
      &-search {
        >div {
          margin-bottom: 14px;
        }
        .export-link {
          font-size: 12px;
        }
        .search-group {
          width: 100%;
          justify-content: space-between;
          align-items: flex-end;
        }
      }
    }

    ::v-deep {
      th,td {
        font-size: 12px;
      }
    }
  }
}
</style>
