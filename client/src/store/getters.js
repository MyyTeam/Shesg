const getters = {
  language: state => state.app.language,
  token: state => state.user.token,
  userInfo: state => state.user.userInfo,
  fuid: state => state.user.fuid,
  invitation: state => state.app.invitation,
  setting: state => state.app.setting
}
export default getters
