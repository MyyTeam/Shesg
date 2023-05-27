// vue.config.js
const path = require('path')
function resolve (dir) {
  return path.join(__dirname, dir)
}
const { VUE_APP_PUBLIC_PATH, VUE_APP_ASSETS_DIR, VUE_APP_BASE_API } = process.env
const port = process.env.port || process.env.npm_config_port || 8000 // dev port
const name = 'SHEsg'
module.exports = {
  publicPath: VUE_APP_PUBLIC_PATH,
  outputDir: 'dist',
  assetsDir: VUE_APP_ASSETS_DIR,
  productionSourceMap: false,
  runtimeCompiler: true,
  devServer: {
    port: port,
    open: false,
    disableHostCheck: true,
    hot: true,
    inline: true,
    watchOptions: {
      poll: 1000,
      ignored: /node_modules/
    },
    overlay: {
      warnings: false,
      errors: true
    },
    proxy: {
      [VUE_APP_BASE_API]: {
        target: 'http://shesg.cc/', // Domain name of the interface service
        changeOrigin: true, //
        pathRewrite: {
          ['^' + VUE_APP_BASE_API]: '/api'
        }
      }
    }

  },
  configureWebpack: {
    // provide the app's title in webpack's name field, so that
    // it can be accessed in index.html to inject the correct title.
    name: name,
    resolve: {
      alias: {
        '@': resolve('src')
      }
    }
  },
  css: {
    loaderOptions: {
      sass: {
        prependData: '@import "~@/styles/variables.scss";'
      }
    }
  },
  chainWebpack(config) {
    // set svg-sprite-loader
    config.module
      .rule('svg')
      .exclude.add(resolve('src/icons'))
      .end()
    config.module
      .rule('icons')
      .test(/\.svg$/)
      .include.add(resolve('src/icons'))
      .end()
      .use('svg-sprite-loader')
      .loader('svg-sprite-loader')
      .options({
        symbolId: 'icon-[name]'
      })
      .end()
  }
}
