#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require jquery.pjax
#= require_tree .

$ ->
  $(document).pjax '.show-item', '#item'
  $('.show-item').on 'pjax:click', ->
    $('.items .item').removeClass 'active'
    $(@).parent().addClass('active')
  $('#item').on 'pjax:end', ->
    $(@).scrollTop(0)
    $('.items .item.active').removeClass 'unread'
