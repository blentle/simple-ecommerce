/**
 * this file depends on jquery.validate,please import jquery.validate first
 * if confilcts,please define yours
 */
function validateForm(selector) {
  var params = {
    errorElement:"span",
    errorClass:'validate-error'
  }
  var result = $(selector).validate(params).form();
  return result;
}