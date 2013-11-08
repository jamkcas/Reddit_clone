# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->

  # $('.voteUp').click ->
  #   event.preventDefault()

  #   id = $(this).data('id')


  #   ajaxcall = $.ajax('/votes', {
  #     data: {vote:
  #       {
  #         up_down: 1,
  #         votable_id: id,
  #         votable_type: "Link"
  #       }
  #     },
  #     method: 'POST'
  #   })

  #   ajaxcall.done (data) ->

  # $('.voteDown').click ->
  #   event.preventDefault()

  #   id = $(this).data('id')


  #   ajaxcall = $.ajax('/votes', {
  #     data: {vote:
  #       {
  #         up_down: -1,
  #         votable_id: id,
  #         votable_type: "Link"
  #       }
  #     },
  #     method: 'POST'
  #   })

  #   ajaxcall.done (data) ->
  $('.newLink').on 'submit', ->
    event.preventDefault()
    title = $('.linkTitle').val()
    url = $('.linkUrl').val()
    user_id = $('.linkUser').val()

    call = $.ajax('/links', {
      data: {
        link: {
          title: title,
          url: url,
          user_id: user_id
        }
      },
      method: 'POST'
    })

    call.done (data) ->
      entry = JST['templates/link_list']({
          data: data
        })
      $('.linkList').prepend(entry)


  $('.linkList').on 'click', '.addLinkComment', ->
    id = $(this).parent().data('id')
    entry = JST['templates/comment_form']({
        commentable_type: 'Link',
        commentable_id: id
      })
    $('.linkComments').append(entry)
    $(this).remove()

  $('.linkList').on 'submit', 'form', ->
    event.preventDefault()
    commentable_type = $('.commentable_type').val()
    commentable_id = $('.commentable_id').val()
    content = $('.content').val()
    console.log commentable_type

    call = $.ajax('/comments', {
      data: {
        comment: {
          commentable_id: commentable_id,
          commentable_type: commentable_type,
          content: content
        }
      },
      method: 'POST'
    })

    call.done (data) ->
      entry = JST['templates/comment_list']({
          comment: data
        })
      if data.commentable_type == 'Link'
        $('.linkComments').append(entry)
        $('.linkComments').append("<button class='addLinkComment'>Add Link Comment</button>")
      else
        $('.comments').append(entry)
    $(this).remove()

  $('.linkList').on 'click', '.addCommentComment', ->
    id = $(this).parent().data('id')
    entry = JST['templates/comment_form']({
        commentable_type: 'Comment',
        commentable_id: id
      })
    $(this).prev().append(entry)
    $(this).remove()

