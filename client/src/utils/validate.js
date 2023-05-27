/**
 * Created by PanJiaChen on 16/11/18.
 */

/**
 * @param {string} path
 * @returns {Boolean}
 */
export function isExternal (path) {
  return /^(https?:|mailto:|tel:)/.test(path)
}

/**
 * @param {string} str
 * @returns {Boolean}
 */
export function validUsername (str) {
  const validMap = ['admin', 'editor']
  return validMap.indexOf(str.trim()) >= 0
}

/**
 * @param {string} url
 * @returns {Boolean}
 */
export function validURL (url) {
  const reg = /^(https?|ftp|file):\/\/[-A-Za-z0-9+&@#/%?=~_|!:,.;]+[-A-Za-z0-9+&@#/%=~_|]$/
  return reg.test(url)
}

/**
 * @param {string} str
 * @returns {Boolean}
 */
export function validLowerCase (str) {
  const reg = /^[a-z]+$/
  return reg.test(str)
}

/**
 * @param {string} str
 * @returns {Boolean}
 */
export function validUpperCase (str) {
  const reg = /^[A-Z]+$/
  return reg.test(str)
}

/**
 * @param {string} str
 * @returns {Boolean}
 */
export function validAlphabets (str) {
  const reg = /^[A-Za-z]+$/
  return reg.test(str)
}

/**
 * @param {string} email
 * @returns {Boolean}
 */
export function validEmail (email) {
  const reg = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
  return reg.test(email)
}

/**
 * @param {string} str
 * @returns {Boolean}
 */
export function isString (str) {
  if (typeof str === 'string' || str instanceof String) {
    return true
  }
  return false
}

/**
 * @param {string} str
 * @returns {Boolean}
 */
export function isNumber (str) {
  return Object.prototype.toString.call(str) === '[object Number]'
}

/**
 * @param {string} object
 * @returns {Boolean}
 */
export function isObject (obj) {
  return Object.prototype.toString.call(obj) === '[object Object]'
}

/**
 * @param {Array} arg
 * @returns {Boolean}
 */
export function isArray (arg) {
  if (typeof Array.isArray === 'undefined') {
    return Object.prototype.toString.call(arg) === '[object Array]'
  }
  return Array.isArray(arg)
}

/**
 * @param {Object} arg
 * @returns {Boolean}
 */
export function isBlob(arg) {
  return Object.prototype.toString.call(arg) === '[object Blob]'
}

export function validPassword (password) {
  const reg = /^(?=.*\d)(?=.*[a-zA-Z]).{6,20}$/
  return reg.test(password)
}

export function validNickName (nickName) {
  const reg = /^[\w-\s]{3,20}$/
  return reg.test(nickName)
}

// /**
//  * @param {必填，数字，长度≤30个字符，输入框提示语 Phone} val
//  */
// export function validPhone(val) {
//   const reg = /^1[23456789]\d{9}$/
//   return reg.test(val)
// }

/**
 * 字符类型不限，长度≤64个字符
 * @param {字符类型不限，} val
 * @param {长度≤64个字符} len
 */
export function validStringLen (val) {
  const reg = /^.{0,64}$/
  return reg.test(val)
}

export function validZIPCode (val) {
  const reg = /^.{0,30}$/
  return reg.test(val)
}

/**
 * 字符类型不限，长度≤255个字符
 * @param {字符类型不限，} val
 */
export function validAddress (val, num = 255) {
  const rule = `^.{0,${num}}`
  const reg = new RegExp(rule + '$') // /^.{0,255}$/
  return reg.test(val)
}

/**
 * @param {必填，数字，长度≤30个字符，输入框提示语 Phone} val
 */
export function validPhone (val) {
  const reg = /^(\+?)?\d{1,30}$/
  return reg.test(val)
}

/**
 * @param {必填，长度3-16个字符，输入框提示语 Phone} val
 */
export function validNewPhone (val) {
  const reg = /^\+\d{3,16}$/
  return reg.test(val)
}

/**
 * @param {必填} val
 * @description Order number 仅支持输入数字、英文字母（大小写不限）、下划线_、横线-、斜线/\ 限制长度36个字符
 */
export function validOrderNumber (val) {
  const reg = /^[0-9a-zA-Z_\-\/\\]{1,36}$/
  return reg.test(val)
}

/**
 * Please don't input illegal character.
 * 非法字符校验
 */
export const isIllegalCharCheck = (val) => {
  return /^.*[!@$*+<>&'\"%\\\\].*$/.test(val)
}

/**
 * 只允许使用数字、空格、-和()
 * Only Numbers, "space", "-" and "()" is allowed.
 */
export const onlyNumAndSpace = (val) => {
  return /[^\s\d\-()]/g.test(val)
}
/**
 * Please enter valid name entry using letters only.
 * 纯数字检验
 */
export const onlyNumber = (val) => {
  return /^\d+$/.test(val)
}

export const toHex = (valueStr) => {
  const hexChars = '0123456789abcdef'
  let text = ''
  let symbols = " !\"#$%&'()*+,-./0123456789:;=?@"
  const loAZ = 'abcdefghijklmnopqrstuvwxyz'
  symbols += loAZ.toUpperCase()
  symbols += '[\\]^_`'
  symbols += loAZ
  symbols += '{|}~'

  for (let i = 0; i < valueStr.length; i++) {
    const oneChar = valueStr.charAt(i)
    const asciiValue = symbols.indexOf(oneChar) + 32
    const index1 = asciiValue % 16
    const index2 = (asciiValue - index1) / 16
    if (text !== '') text += ':'
    text += hexChars.charAt(index2)
    text += hexChars.charAt(index1)
  }
  return text
}

/**
 * Please use numbers and English letters only
 * 只使用数字和英文字母
 */
export const chkHexStr = (val) => {
  let ret = false
  const sVal = val.replace(/^\s*|\s*$/g, '')
  const hexStr1 = this.toHex(sVal).split(':')
  for (let i = 0; i < hexStr1.length; i++) {
    if (hexStr1[i] === '1f') {
      ret = true
      return ret
    }
  }
  return ret
}

/**
 *Please enter a valid zip/postal code .5 or 9 characters.
 *请输入有效的邮政编码。5或9个字符。
 */
export const postalcode5Or9Str = (val) => {
  const usPartern1 = /^\d{5}$/
  const usPartern2 = /^\d{9}$/
  const usPartern3 = /^\d{5}\s\d{4}$/
  return usPartern1.test(val) || usPartern2.test(val) || usPartern3.test(val)
}

/**
 *限制输入中文
 *
 */
export const chineseCheck = (val) => {
  const reg = /[\u4E00-\u9FA5]/g
  return reg.test(val)
}

/**
 * @param {WhatsApp仅数字和+-(), 长度20个字符以内} val
 */
export function validWhatsApp (val) {
  return /^[0-9\+\-()]{1,20}$/.test(val)
}

/**
 * 域名校验
 * 6-20个字母和数字，不允许使用空格和特殊符号
 * @param {*} val
 */
export function validDomain(val) {
  const reg = /^[a-zA-Z0-9]{1,20}$/
  return reg.test(val)
}

/**
 * youtube链接校验
 * @param {校验是否为链接且开头是否含“youtube.com”} val
 */
export function validYoutube (val) {
  const reg = /^https?:\/\/.*youtube.com/
  return reg.test(val)
}

/**
 * TikTok链接校验
 * @param {校验是否为链接且开头是否含“tiktok.com”} val
 */
export function validTikTok (val) {
  const reg = /^https?:\/\/.*tiktok.com/
  return reg.test(val)
}

/**
 * Facebook链接校验
 * @param {校验是否为链接且开头是否含“facebook.com”} val
 */
export function validFacebook (val) {
  const reg = /^https?:\/\/.*facebook.com/
  return reg.test(val)
}

/**
 * @param {string} val
 * @returns {Boolean}
 */
export function validNoLink (val) {
  return !/^(https?:\/\/)/.test(val)
}

/**
 * 非中文
 * @param {*} val
 */
export function validNonChinese(val) {
  const reg = /^[^\u4e00-\u9fa5]+$/
  return reg.test(val)
}
