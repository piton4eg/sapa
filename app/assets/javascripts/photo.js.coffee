# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#galleries').css({'height': (($(window).height()) - 35)+'px'})

  $(window).resize(
    $('#galleries').css({'height': (($(window).height()) - 35)+'px'})
  )
