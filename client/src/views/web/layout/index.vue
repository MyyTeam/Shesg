<template>
    <div id="web-layout">
        <!-- web header -->

        <WebLayoutContent/>

        <!-- web footer -->

    </div>
</template>

<script>
import WebLayoutContent from './Content.vue'

export default {
  name: 'WebLayout',
  components: {
    WebLayoutContent: WebLayoutContent
  }
}
</script>
