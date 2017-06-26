# ssad_server_api.coffee, smd-js/ssad_app/src/

async_ = require './async'
config = require './config'


check_key = (app_id, ssad_key) ->
  url = config.SSAD_SERVER_ROOT + app_id + '/'
  await async_.get_json url, {
    ssad_key
  }


module.exports = {
  check_key  # async
}
