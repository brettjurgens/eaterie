# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('a.scroller').on 'click.smoothscroll', (e) ->
    e.preventDefault()
    target = $(@).data('link')
    $target = $(target)
    offset = $target.offset().top - 20
    $('html, body').stop().animate {
      'scrollTop': offset
    }, 500, 'swing'

  $(window).scroll ->
    if $(@).scrollTop() > 500 and !$('#scroll-header').hasClass('open')
      $('#scroll-header').addClass('open')
      $('#scroll-header').children().fadeIn()
      $('#scroll-header').slideDown()
    else if $(@).scrollTop() <= 500
      $('#scroll-header').removeClass('open')
      $('#scroll-header').children().fadeOut()
      $('#scroll-header').slideUp()