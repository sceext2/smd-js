# async.coffee, smd-js/ssad_app/src/
#
# use global:
#   $

get_json = (url, query) ->
  new Promise (resolve, reject) ->
    r = $.getJSON url, query
    r.done () ->
      resolve r.responseJSON
    r.fail (jqxhr, status, e) ->
      reject e

get_text = (url, query) ->
  new Promise (resolve, reject) ->
    r = $.get url, query, 'text'
    r.done () ->
      resolve r.responseText
    r.fail (jqxhr, status, e) ->
      reject e


module.exports = {
  get_json  # async
  get_text  # async
}
