import Cookies from 'js-cookie'
import { getLanguage } from '@/lang/index'
import { getInvitation, setInvitation } from '@/utils/auth'
const state = {
  language: getLanguage(),
  invitation: getInvitation(),
  isFirstLoad: false
}

const mutations = {
  SET_LANGUAGE: (state, language) => {
    state.language = language
    Cookies.set('language', language)
  },
  SET_INVITATION: (state, invitation) => {
    state.invitation = invitation
    if (invitation) {
      setInvitation(invitation)
    }
  },
  SET_IS_FIRST_LOAD: (state, status) => {
    state.isFirstLoad = status
  }
}

const actions = {
  setLanguage ({ commit }, language) {
    commit('SET_LANGUAGE', language)
  }

}

export default {
  namespaced: true,
  state,
  mutations,
  actions
}
