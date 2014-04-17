# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(document).on 'click', '.unfollow', (e) ->
    e.preventDefault();
    user_id = $(this).data('user')
    user_name = $(this).data('name')
    $.post "/users/#{user_id}/unfollow", (data) ->
      if !data.follow
        $('#follow_info').empty()
        $("<a class='follow' href='#' data-user='#{user_id}' data-name='#{user_name}'>Follow</a>")
          .appendTo('#follow_info')

  $(document).on 'click', '.follow', (e) ->
    event.preventDefault();
    user_id = $(this).data('user')
    user_name = $(this).data('name')
    $.post "/users/#{user_id}/follow", (data) ->
        if data.follow
          $('#follow_info').empty()
          $('#follow_info').text("You are following #{user_name}. ")
          $("<a class='unfollow' href='#' data-user='#{user_id}' data-name='#{user_name}'>Unfollow</a>")
            .appendTo('#follow_info')