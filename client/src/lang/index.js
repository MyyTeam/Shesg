import Vue from 'vue'
import VueI18n from 'vue-i18n'
import Cookies from 'js-cookie'
import enLocale from './en'
import zhLocale from './zh'

Vue.use(VueI18n)

const messages = {
  en: {
    ...enLocale
  },
  zh: {
    ...zhLocale
  }
}
export function getLanguage () {
  const chooseLanguage = Cookies.get('language')
  if (chooseLanguage) return chooseLanguage
  return 'en'
}
const i18n = new VueI18n({
  // set locale
  // options: en | zh | es
  // locale: getLanguage(),
  locale: 'en',
  // set locale messages
  messages
})

export default i18n
