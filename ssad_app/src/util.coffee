# util.coffee, smd-js/ssad_app/src/
#
# use global:
#   localStorage

config = require './config'


# return null if error
get_config = ->
  value = localStorage.getItem config.LOCAL_STORAGE_KEY
  if value?
    try
      value = JSON.parse value
    catch e
      # ignore error
  value

set_config = (data) ->
  value = JSON.stringify data
  localStorage.setItem config.LOCAL_STORAGE_KEY, value


module.exports = {
  get_config
  set_config
}
