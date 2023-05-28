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
