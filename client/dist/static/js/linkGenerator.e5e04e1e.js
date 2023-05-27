(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["linkGenerator"],{"0ff7":function(t,e,n){"use strict";n.r(e);var a=function(){var t=this,e=t._self._c;return e("b-container",{staticClass:"link-generator p-0 p-md-3",attrs:{fluid:""}},[t.showLinkInfo?[e("div",{staticClass:"link-generator-link p-3 p-md-4"},[e("p",[t._v(t._s(t.link.originalUrl))]),e("b-button",{staticClass:"main-plain-btn toggle-btn mt-3",attrs:{"spm-index":"generateanotherbtn",variant:"outline-primary"},on:{click:t.toggleGeneration}},[t._v(" Generate Another ")])],1),e("div",{staticClass:"link-generator-product mt-3 p-4"},[e("b-row",[e("b-col",{attrs:{cols:"12",md:"8"}},[e("div",{staticClass:"title"},[t._v("Customized Link")]),e("div",{staticClass:"gray-info pt-2"},[t._v("Share this customized link, then when a customer clicks the link and places an order, you will earn commission")]),e("div",{staticClass:"product-card mt-2 mt-md-3"},[t.link.productName?e("p",{staticClass:"product-title"},[t._v(t._s(t.link.productName))]):t._e(),e("p",{staticClass:"short-link"},[t._v(t._s("https://new.dhgate.com/"+t.link.shortUrl))])]),e("div",{staticClass:"copy-btns mt-2 mt-md-3"},[e("b-button",{staticClass:"copy-btn second-btn",attrs:{"spm-index":"copyallbtn",variant:"outline-dark"},on:{click:t.copyAll}},[t._v(" Copy All ")]),e("b-button",{staticClass:"copy-btn main-btn",attrs:{"spm-index":"onlycopylinkbtn",variant:"primary"},on:{click:t.copyLink}},[t._v(" Only Copy Link ")])],1)]),t.isNotProduct?t._e():e("b-col",{attrs:{cols:"12",md:"4"}},[e("div",{staticClass:"title mt-4 mt-md-0"},[t._v("Images")]),e("div",{staticClass:"gray-info pt-2"},[t._v("Download the images for your promotion")]),e("div",{staticClass:"image-list mt-2 mt-md-3"},[t.link.sampleImageVOS?[e("b-row",t._l(t.link.sampleImageVOS,(function(t,n){return e("b-col",{key:n,staticClass:"img-wrapper mb-3",attrs:{cols:"4"}},[e("div",{staticClass:"product-img"},[e("b-img-lazy",{attrs:{src:t.imgUrl,alt:"product-img"}})],1)])})),1),e("div",{staticClass:"download-btn text-center"},[e("b-button",{staticClass:"download-btn second-btn",attrs:{"spm-index":"imagebtn",variant:"outline-dark"},on:{click:t.handleDownload}},[e("svg-icon",{staticClass:"download-icon",attrs:{"icon-class":"download"}}),t._v(" Download All ")],1)],1)]:t._e(),t.loading||t.link.sampleImageVOS?t._e():e("div",{staticClass:"empty-card"},[e("b-img-lazy",{staticClass:"empty-img",attrs:{src:t.emptyImg,alt:""}}),e("p",[t._v("No Data")])],1),e("b-overlay",{attrs:{show:t.loading,"no-wrap":""}})],2)])],1)],1)]:[e("div",{staticClass:"link-generator-main"},[e("div",{staticClass:"link-generator-main__inner"},[e("div",{staticClass:"link-generator-search"},[e("b-input-group",[e("b-form-input",{attrs:{placeholder:t.placeholder},on:{blur:function(e){t.showPlaceholder=!0}},nativeOn:{keyup:function(e){return!e.type.indexOf("key")&&t._k(e.keyCode,"enter",13,e.key,"Enter")?null:t.search.apply(null,arguments)},focus:function(e){t.showPlaceholder=!1}},model:{value:t.query.url,callback:function(e){t.$set(t.query,"url","string"===typeof e?e.trim():e)},expression:"query.url"}}),e("b-input-group-append",{staticClass:"d-none d-md-block"},[e("b-button",{staticClass:"search-btn main-btn",attrs:{"spm-index":"generatebtn",variant:"primary"},on:{click:t.search}},[t._v(" Generate ")])],1)],1),e("div",{staticClass:"tip d-none d-md-block"},[t._v("Note: only for DHgate link")]),e("b-button",{staticClass:"search-btn-m main-btn d-block d-md-none",attrs:{"spm-index":"generatebtn",variant:"primary",block:""},on:{click:t.search}},[t._v(" Generate ")])],1),e("div",{staticClass:"link-generator-use"},[e("div",{staticClass:"link-generator-use__title"},[t._v("How to use?")]),e("div",{staticClass:"link-generator-use__content"},[e("p",[t._v("1. Find your desired page on "),e("a",{attrs:{href:"https://www.dhgate.com/",target:"_blank"}},[t._v("DHgate.com")])]),e("p",[t._v("2. Copy the link and paste it in the URL field")]),e("p",[t._v("3. Click generate to get your promotion link")]),e("p",[t._v("4. Share the link and earn a commission for conversion of sales")])])])])])]],2)},o=[],i=n("21a6"),s=n.n(i),r=n("2f62"),l=n("ed08"),c=n("2934"),d={name:"LinkGenerator",data(){return{loading:!1,query:{url:"",userId:""},link:{},showPlaceholder:!0,showLinkInfo:!1,isNotProduct:!1,emptyImg:n("cf90")}},async created(){},computed:{...Object(r["b"])(["userInfo"]),placeholder(){return this.showPlaceholder?"Paste the DHgate link here":""},itemcode(){const t=/(\d+)\.html/,e=this.query.url.match(t);return e&&e[1]}},methods:{search(){var t;this.link={},this.query.userId=null===(t=this.userInfo)||void 0===t?void 0:t.userId,Object(c["a"])(this.query).then(t=>{this.showLinkInfo=!0,this.link={...this.link,...t.data}}),this.query.url.includes("dhgate.com/product")?(this.isNotProduct=!1,this.loading=!0,Object(c["b"])(this.query).then(t=>{this.link={...this.link,...t.data}}).finally(()=>{this.loading=!1})):this.isNotProduct=!0},copy(t){Object(l["a"])(t),this.$message("Copy Successfully.")},copyF(){const t=`f=bm|aff|yfaf|${this.userInfo.affiliateCode}|||new|`;this.copy(t)},copyAll(){const t=`${this.link.productName}\nhttps://new.dhgate.com/${this.link.shortUrl}`;this.copy(t)},copyLink(){const t="https://new.dhgate.com/"+this.link.shortUrl;this.copy(t)},toggleGeneration(){this.query.url="",this.showLinkInfo=!1},handleDownload(){this.link.sampleImageVOS.map((t,e)=>{var n;const a=null===(n=t.imgUrl)||void 0===n?void 0:n.replace(/\/300x300/,"");this.downloadIamge(a,`${this.itemcode}-${e+1}-SHEsg`)})},downloadIamge(t,e){var n=new Image;n.setAttribute("crossOrigin","anonymous"),n.onload=function(){var t=document.createElement("canvas");t.width=n.width,t.height=n.height;var a=t.getContext("2d");a.drawImage(n,0,0,n.width,n.height);var o=t.toDataURL("image/png");s.a.saveAs(o,e+".png")},n.src=t}}},u=d,p=(n("7dba"),n("2877")),m=Object(p["a"])(u,a,o,!1,null,"e4ea3520",null);e["default"]=m.exports},"21a6":function(t,e,n){(function(n){var a,o,i;(function(n,s){o=[],a=s,i="function"===typeof a?a.apply(e,o):a,void 0===i||(t.exports=i)})(0,(function(){"use strict";function e(t,e){return"undefined"==typeof e?e={autoBom:!1}:"object"!=typeof e&&(console.warn("Deprecated: Expected third argument to be a object"),e={autoBom:!e}),e.autoBom&&/^\s*(?:text\/\S*|application\/xml|\S*\/\S*\+xml)\s*;.*charset\s*=\s*utf-8/i.test(t.type)?new Blob(["\ufeff",t],{type:t.type}):t}function a(t,e,n){var a=new XMLHttpRequest;a.open("GET",t),a.responseType="blob",a.onload=function(){l(a.response,e,n)},a.onerror=function(){console.error("could not download file")},a.send()}function o(t){var e=new XMLHttpRequest;e.open("HEAD",t,!1);try{e.send()}catch(t){}return 200<=e.status&&299>=e.status}function i(t){try{t.dispatchEvent(new MouseEvent("click"))}catch(a){var e=document.createEvent("MouseEvents");e.initMouseEvent("click",!0,!0,window,0,0,0,80,20,!1,!1,!1,!1,0,null),t.dispatchEvent(e)}}var s="object"==typeof window&&window.window===window?window:"object"==typeof self&&self.self===self?self:"object"==typeof n&&n.global===n?n:void 0,r=s.navigator&&/Macintosh/.test(navigator.userAgent)&&/AppleWebKit/.test(navigator.userAgent)&&!/Safari/.test(navigator.userAgent),l=s.saveAs||("object"!=typeof window||window!==s?function(){}:"download"in HTMLAnchorElement.prototype&&!r?function(t,e,n){var r=s.URL||s.webkitURL,l=document.createElement("a");e=e||t.name||"download",l.download=e,l.rel="noopener","string"==typeof t?(l.href=t,l.origin===location.origin?i(l):o(l.href)?a(t,e,n):i(l,l.target="_blank")):(l.href=r.createObjectURL(t),setTimeout((function(){r.revokeObjectURL(l.href)}),4e4),setTimeout((function(){i(l)}),0))}:"msSaveOrOpenBlob"in navigator?function(t,n,s){if(n=n||t.name||"download","string"!=typeof t)navigator.msSaveOrOpenBlob(e(t,s),n);else if(o(t))a(t,n,s);else{var r=document.createElement("a");r.href=t,r.target="_blank",setTimeout((function(){i(r)}))}}:function(t,e,n,o){if(o=o||open("","_blank"),o&&(o.document.title=o.document.body.innerText="downloading..."),"string"==typeof t)return a(t,e,n);var i="application/octet-stream"===t.type,l=/constructor/i.test(s.HTMLElement)||s.safari,c=/CriOS\/[\d]+/.test(navigator.userAgent);if((c||i&&l||r)&&"undefined"!=typeof FileReader){var d=new FileReader;d.onloadend=function(){var t=d.result;t=c?t:t.replace(/^data:[^;]*;/,"data:attachment/file;"),o?o.location.href=t:location=t,o=null},d.readAsDataURL(t)}else{var u=s.URL||s.webkitURL,p=u.createObjectURL(t);o?o.location=p:location.href=p,o=null,setTimeout((function(){u.revokeObjectURL(p)}),4e4)}});s.saveAs=l.saveAs=l,t.exports=l}))}).call(this,n("c8ba"))},"79cc":function(t,e,n){},"7dba":function(t,e,n){"use strict";n("79cc")},cf90:function(t,e,n){t.exports=n.p+"static/img/no-data.5e1d1a90.png"}}]);