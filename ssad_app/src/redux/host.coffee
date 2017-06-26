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

  {
    # nav
    nav_state_welcome: $$state.getIn ['nav', 'page', 'welcome']
    nav_state_main: $$state.getIn ['nav', 'page', 'main']
    nav_state_about: $$state.getIn ['nav', 'page', 'about']
    nav_state_input: $$state.getIn ['nav', 'page', 'input']
    nav_state_output: $$state.getIn ['nav', 'page', 'output']
    nav_state_select_file_i: $$state.getIn ['nav', 'page', 'select_file_i']
    nav_state_select_file_o: $$state.getIn ['nav', 'page', 'select_file_o']

    # welcome page
    wel_app_id
    wel_key
    wel_error: $$state.getIn ['welcome', 'error']

    # TODO
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
      # TODO

    # page select file
    on_reset_sfi: ->
      # TODO
    on_reset_sfo: ->
      # TODO
  }

O = connect(mapStateToProps, mapDispatchToProps)(Host)
module.exports = O
