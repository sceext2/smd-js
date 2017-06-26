# reducer.coffee, smd-js/ssad_app/src/redux/

Immutable = require 'immutable'

state = require './state'
ac = require './action'


_nav_back = ($$o) ->
  # check can go back
  stack = $$o.getIn(['nav', 'stack']).toJS()
  if stack.length <= 1
    return $$o  # can not go back
  # make current right
  current = $$o.getIn ['nav', 'current']
  $$o = $$o.setIn ['nav', 'page', current], 'right'
  # make new main
  current = stack.pop()
  $$o = $$o.setIn ['nav', 'current'], current
  $$o = $$o.setIn ['nav', 'page', current], 'main'
  $$o = $$o.setIn ['nav', 'stack'], Immutable.fromJS(stack)
  $$o

_nav_go = ($$o, page) ->
  # check can go
  if $$o.getIn(['nav', 'page', page]) != 'right'
    return $$o  # can not goto that page
  # push current to stack
  current = $$o.getIn ['nav', 'current']
  $$o = $$o.updateIn ['nav', 'stack'], ($$stack) ->
    $$o = $$stack.push current
  # make current left
  $$o = $$o.setIn ['nav', 'page', current], 'left'
  # make page main
  $$o = $$o.setIn ['nav', 'page', page], 'main'
  # set new current
  $$o = $$o.setIn ['nav', 'current'], page
  $$o


_check_init_state = ($$state) ->
  $$o = $$state
  if ! $$o?
    $$o = Immutable.fromJS state
  $$o

reducer = ($$state, action) ->
  $$o = _check_init_state $$state
  switch action.type
    # nav
    when ac.NAV_BACK
      $$o = _nav_back $$o
    when ac.NAV_GO
      $$o = _nav_go $$o, action.payload
    # welcome page
    when ac.WELCOME_CHANGE_APP_ID
      $$o = $$o.setIn ['welcome', 'app_id'], action.payload
    when ac.WELCOME_CHANGE_KEY
      $$o = $$o.setIn ['welcome', 'key'], action.payload
    #when ac.WELCOME_CHECK_KEY
    when ac.WELCOME_KEY_OK
      # update app_id / ssad_key
      $$o = $$o.set 'app_id', $$o.getIn(['welcome', 'app_id'])
      $$o = $$o.set 'ssad_key', $$o.getIn(['welcome', 'key'])
      # clear key
      $$o = $$o.setIn ['welcome', 'key'], null
    when ac.WELCOME_KEY_ERR
      # TODO improve error style ?
      $$o = $$o.setIn ['welcome', 'error'], action.payload.toString()
  $$o

# not use  redux.combineReducers
module.exports = reducer
