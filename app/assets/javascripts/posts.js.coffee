# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(document).on 'click', '.like', (e) ->
    e.preventDefault()
    post_id = $(@).data('post')
    $.post "/posts/#{post_id}/like", (data) ->
      $("#like_info_#{post_id}").text(data.like_info)
      if data.like
        $("#like_#{post_id}").text('Unlike')
      else
        $("#like_#{post_id}").text('Like')

  $('.new-comment').keyup (e) ->
    if e.which is 13
      if $(@).val() is ''
        return false
      post_id = $(@).data('post')
      comment_box = $(@)
      comment = comment_box.val()
      $.post "/posts/#{post_id}/comment", {comment: comment}, (data) ->
        if data.success
          comment_box.val('').blur()
          $("#comments_#{post_id} > .new-comment-container").before(data.html)

  $(document).on 'click', '.add-step', (e) ->
    e.preventDefault()
    count = $('.counter').val()
    $("<li><input class='instruction-input' name='recipestep[#{count}][description]' placeholder='Instructions' type='text'></input>
      <br/><input class='measurement' name='recipestep[#{count}][amount]' placeholder='1 Cup' type='text'></input>
      <input class='ingredient' name='recipestep[#{count}][name]' placeholder='Milk' type='text'></input></li>").appendTo('#steps-input')
    $('.counter').val(++count)
    
  $('textarea').autosize()