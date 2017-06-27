# host.coffee, smd-js/ssad_app/src/redux/

{ connect } = require 'react-redux'

Host = require '../host'
action = require './action'


mapStateToProps = ($$state, props) ->
  # welcome
  wel_app_id = $$state.getIn ['welcome', 'app_id']
  if ! wel_app_id?
    wel_app_id = ''
  wel_key = $$state.getIn ['welcome', 'key']
  if ! wel_key?
    wel_key = ''
  # select file
  path_sfi = $$state.getIn ['sfi', 'path']
  path_sfo = $$state.getIn ['sfo', 'path']
  filename_sfi = $$state.getIn ['sfi', 'filename']
  filename_sfo = $$state.getIn ['sfo', 'filename']
  if ! path_sfi?
    path_sfi = ''
  if ! path_sfo?
    path_sfo = ''
  if ! filename_sfi?
    filename_sfi = ''
  if ! filename_sfo?
    filename_sfo = ''

  {
    # nav
    nav_state_welcome: $$state.getIn ['nav', 'page', 'welcome']
    nav_state_main: $$state.getIn ['nav', 'page', 'main']
    nav_state_about: $$state.getIn ['nav', 'page', 'about']
    nav_state_input: $$state.getIn ['nav', 'page', 'input']
    nav_state_output: $$state.getIn ['nav', 'page', 'output']
    nav_state_select_file_i: $$state.getIn ['nav', 'page', 'select_file_i']
    nav_state_select_file_o: $$state.getIn ['nav', 'page', 'select_file_o']

    # for select_file page
    app_id: $$state.get 'app_id'
    ssad_key: $$state.get 'ssad_key'

    # welcome page
    wel_app_id
    wel_key
    wel_error: $$state.getIn ['welcome', 'error']

    # input/output page
    text_input: $$state.get 'text_input'
    text_output: $$state.get 'text_output'
    input_error: $$state.getIn ['sfi', 'error']

    # select file
    path_sfi
    path_sfo
    filename_sfi
    filename_sfo

    # logs
    logs: $$state.get('log').toJS()
  }

mapDispatchToProps = (dispatch, props) ->
  {
    # nav
    nav_back: ->
      dispatch action.nav_back()
    nav_goto_about: ->
      dispatch action.nav_go 'about'
    nav_goto_input: ->
      dispatch action.nav_go 'input'
    nav_goto_output: ->
      dispatch action.nav_go 'output'
    nav_goto_sfi: ->
      dispatch action.nav_go 'select_file_i'
    nav_goto_sfo: ->
      dispatch action.nav_go 'select_file_o'

    # welcome page
    on_wel_ok: ->
      dispatch action.wel_check_key()
    on_wel_change_id: (id) ->
      dispatch action.wel_change_app_id(id)
    on_wel_change_key: (key) ->
      dispatch action.wel_change_key(key)

    # page main
    on_compile: ->
      dispatch action.compile()

    # input/output page
    on_change_input: (text) ->
      dispatch action.change_input(text)
    on_change_output: (text) ->
      dispatch action.change_output(text)

    # page select file
    on_reset_sfi: ->
      dispatch action.sf_reset 'sfi'
    on_reset_sfo: ->
      dispatch action.sf_reset 'sfo'
    on_msg_sfi: (msg) ->
      dispatch action.sf_msg 'sfi', msg
    on_msg_sfo: (msg) ->
      dispatch action.sf_msg 'sfo', msg
    on_change_filename_sfi: (text) ->
      dispatch action.sf_change_filename 'sfi', text
    on_change_filename_sfo: (text) ->
      dispatch action.sf_change_filename 'sfo', text
    on_ok_sfi: ->
      dispatch action.sf_ok()
  }

O = connect(mapStateToProps, mapDispatchToProps)(Host)
module.exports = O
