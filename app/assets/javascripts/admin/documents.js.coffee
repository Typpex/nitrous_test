# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Initialize the jQuery File Upload widget:
$ ->
  $('#fileupload-documents').fileupload
      url: $('form').attr('action')

$ ->
  $("#fileupload").bind "fileuploaddone", (e, data) ->
    eval(data)