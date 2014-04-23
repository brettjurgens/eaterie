# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('a[href^="#"]').on 'click.smoothscroll', (e) ->
    e.preventDefault()
    target = @hash
    $target = $(target)
    offset = $target.offset().top - $('#scroll-header').height()
    $('html, body').stop().animate {
      'scrollTop': offset
    }, 500, 'swing', ->
      window.location.hash = target

  $(window).scroll ->
    if $(@).scrollTop() > 540 and !$('#scroll-header').hasClass('open')
      $('#scroll-header').addClass('open')
      $('#scroll-header').children().fadeIn()
      $('#scroll-header').slideDown()
    else if $(@).scrollTop() <= 540
      $('#scroll-header').removeClass('open')
      $('#scroll-header').children().fadeOut()
      $('#scroll-header').slideUp()