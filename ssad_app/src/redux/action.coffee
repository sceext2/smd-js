# action.coffee, smd-js/ssad_app/src/redux/

path = require 'path'

util = require '../util'
ssad_server_api = require '../ssad_server_api'
event_api = require '../event_api'

# action types

# nav
NAV_BACK = 'nav_back'
NAV_GO = 'nav_go'

# welcome page
WELCOME_CHANGE_APP_ID = 'welcome_change_app_id'
WELCOME_CHANGE_KEY = 'welcome_change_key'
WELCOME_CHECK_KEY = 'welcome_check_key'
WELCOME_KEY_OK = 'welcome_key_ok'
WELCOME_KEY_ERR = 'welcome_key_err'

# select file
SF_RESET = 'sf_reset'
SF_MSG = 'sf_msg'
SF_CHANGE_FILENAME = 'sf_change_filename'
SF_OK = 'sf_ok'  # sfi OK

# input / output
TEXT_CHANGE_INPUT = 'text_change_input'
TEXT_CHANGE_OUTPUT = 'text_change_output'
TEXT_LOAD_INPUT_ERROR = 'text_load_input_error'
# log
TEXT_LOG = 'text_log'


# nav
nav_back = ->
  {
    type: NAV_BACK
  }
nav_go = (page) ->
  {
    type: NAV_GO
    payload: page
  }

# welcome page
wel_change_app_id = (id) ->
  {
    type: WELCOME_CHANGE_APP_ID
    payload: id
  }
wel_change_key = (key) ->
  {
    type: WELCOME_CHANGE_KEY
    payload: key
  }

wel_check_key = ->
  (dispatch, getState) ->
    dispatch {
      type: WELCOME_CHECK_KEY
    }
    $$state = getState()
    app_id = $$state.getIn ['welcome', 'app_id']
    key = $$state.getIn ['welcome', 'key']
    # try ssad_key
    if ((! key?) || ('' == key)) && $$state.get('ssad_key')?
      key = $$state.get 'ssad_key'
    # current page
    current = $$state.getIn ['nav', 'current']
    # check key
    try
      await ssad_server_api.check_key(app_id, key)
    catch e
      dispatch wel_key_err(e)
      if current != 'welcome'
        # ERR: go back to welcome page
        dispatch nav_back()
      return
    # OK
    dispatch wel_key_ok()
    # save config
    util.set_config {
      app_id
      ssad_key: key
    }
    # goto main page
    if current != 'main'
      dispatch nav_go('main')

wel_key_ok = ->
  {
    type: WELCOME_KEY_OK
  }
wel_key_err = (error) ->
  {
    type: WELCOME_KEY_ERR
    error: true
    payload: error
  }

# select file
sf_reset = (type) ->
  {
    type: SF_RESET
    payload: type  # 'sfi' / 'sfo'
  }
sf_msg = (type, msg) ->
  {
    type: SF_MSG
    payload: {
      type  # 'sfi' / 'sfo'
      msg
    }
  }
sf_change_filename = (type, filename) ->
  {
    type: SF_CHANGE_FILENAME
    payload: {
      type
      filename
    }
  }
sf_ok = ->
  (dispatch, getState) ->
    dispatch {
      type: SF_OK
    }
    # load sfi (text file)
    $$state = getState()
    opt = {
      app_id: $$state.getIn ['sfi', 'app_id']
      sub_root: $$state.getIn ['sfi', 'sub_root']
      root_path: $$state.getIn ['sfi', 'root_path']
      path: $$state.getIn ['sfi', 'path']
      filename: $$state.getIn ['sfi', 'filename']

      ssad_key: $$state.get 'ssad_key'
    }
    try
      text = await ssad_server_api.load_text_file path.join(opt.path, opt.filename), opt
      dispatch change_input(text)
      # TODO auto-gen output filename
      # go back to input page
      dispatch nav_back()
    catch e
      dispatch load_input_err(e)

# input/output
change_input = (text) ->
  {
    type: TEXT_CHANGE_INPUT
    payload: text
  }

change_output = (text) ->
  {
    type: TEXT_CHANGE_OUTPUT
    payload: text
  }

load_input_err = (e) ->
  {
    type: TEXT_LOAD_INPUT_ERROR
    error: true
    payload: e
  }

# log
log = (text) ->
  {
    type: TEXT_LOG
    payload: text
  }

module.exports = {
  NAV_BACK
  NAV_GO

  WELCOME_CHANGE_APP_ID
  WELCOME_CHANGE_KEY
  WELCOME_CHECK_KEY
  WELCOME_KEY_OK
  WELCOME_KEY_ERR

  SF_RESET
  SF_MSG
  SF_CHANGE_FILENAME
  SF_OK

  TEXT_CHANGE_INPUT
  TEXT_CHANGE_OUTPUT
  TEXT_LOAD_INPUT_ERROR
  TEXT_LOG

  nav_back
  nav_go

  wel_change_app_id
  wel_change_key
  wel_check_key  # thunk
  wel_key_ok
  wel_key_err

  sf_reset
  sf_msg
  sf_change_filename
  sf_ok  # thunk

  change_input
  change_output
  load_input_err
  log
}
