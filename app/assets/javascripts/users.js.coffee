# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(document).on 'click', '.follow', (e) ->
    e.preventDefault();
    user_id = $(this).data('user')
    user_name = $(this).data('name')
    $.post "/users/#{user_id}/follow", (data) ->
      $('#follow_info').empty()
      if data.follow
        $("<a class='follow' href='#' data-user='#{user_id}' data-name='#{user_name}'>Unfollow</a>")
        .appendTo('#follow_info')
      else
        $("<a class='follow' href='#' data-user='#{user_id}' data-name='#{user_name}'>Follow</a>")
        .appendTo('#follow_info')