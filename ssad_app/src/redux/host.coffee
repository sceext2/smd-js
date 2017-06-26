# host.coffee, smd-js/ssad_app/src/redux/

{ connect } = require 'react-redux'

Host = require '../host'
action = require './action'


mapStateToProps = ($$state, props) ->
  {
    # nav
    nav_state_welcome: $$state.getIn ['nav', 'page', 'welcome']
    nav_state_main: $$state.getIn ['nav', 'page', 'main']
    nav_state_about: $$state.getIn ['nav', 'page', 'about']
    nav_state_input: $$state.getIn ['nav', 'page', 'input']
    nav_state_output: $$state.getIn ['nav', 'page', 'output']
    nav_state_select_file_i: $$state.getIn ['nav', 'page', 'select_file_i']
    nav_state_select_file_o: $$state.getIn ['nav', 'page', 'select_file_o']

    # TODO
  }

mapDispatchToProps = (dispatch, props) ->
  {
    # nav
    nav_back: ->
      dispatch action.nav_back()
    nav_goto_main: ->
      dispatch action.nav_go 'main'
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
