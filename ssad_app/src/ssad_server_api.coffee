# ssad_server_api.coffee, smd-js/ssad_app/src/

path = require 'path'

async_ = require './async'
config = require './config'

get_version = ->
  await async_.get_json config.SSAD_SERVER_VERSION, {}

check_key = (app_id, ssad_key) ->
  url = config.SSAD_SERVER_ROOT + app_id + '/'
  await async_.get_json url, {
    ssad_key
  }

load_text_file = (filename, opt) ->
  sub_path = path.relative opt.root_path, filename
  url = config.SSAD_SERVER_ROOT + opt.app_id + '/'
  url = path.join url, opt.sub_root, sub_path
  await async_.get_text url, {
    ssad_key: opt.ssad_key
  }

put_text_file = (filename, opt, text) ->
  sub_path = path.relative opt.root_path, filename
  url = config.SSAD_SERVER_ROOT + opt.app_id + '/'
  url = path.join url, opt.sub_root, sub_path
  await async_.put_text url, {
    ssad_key: opt.ssad_key
  }, text


module.exports = {
  get_version  # async
  check_key  # async
  load_text_file  # async
  put_text_file  # async
}
