# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
html = $('.b-slide', '#html')

$('#fotorama').fotorama
  width: '100%'
  height: 'auto'
  html:
    0: html.eq(0)
    1: html.eq(2)
    2: html.eq(1)
    3: html.eq(3)
    4: html.eq(4)