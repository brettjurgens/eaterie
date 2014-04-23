# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(document).on 'click', '.like', (e) ->
    e.preventDefault();
    post_id = $(this).data('post')
    $.post "/posts/#{post_id}/like", (data) ->
      $("#like_info_#{post_id}").text(data.like_info)
      if data.like
        $("#like_#{post_id}").text('Unlike')
      else
        $("#like_#{post_id}").text('Like')