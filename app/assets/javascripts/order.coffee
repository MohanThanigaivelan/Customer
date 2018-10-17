# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'change', '#quantity #price', ->
  price = $('#price').val() or 0
  quantity = $('#quantity').val() or 0
  $('#total_amount').val price * quantity
  return