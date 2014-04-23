# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(document).on 'click', '.like', (e) ->
    e.preventDefault();
    post_id = $(this).data('post')
    $.post "/posts/#{post_id}/like", (data) ->
      if data.like
        $('.like').text('Unlike')
      else
        $('.like').text('Like')