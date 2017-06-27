# index.coffee, smd-js/ssad_app/src/
#
# use global:
#   $, document

{
  createStore
  applyMiddleware
} = require 'redux'
thunk = require('redux-thunk').default
# DEBUG redux
{ composeWithDevTools } = require 'redux-devtools-extension'

{ Provider } = require 'react-redux'
{ createElement: cE } = require 'react'
cC = require 'create-react-class'
ReactDOM = require 'react-dom'

reducer = require './redux/reducer'
action = require './redux/action'

# use with redux
Host = require './redux/host'
# redux store
middleware = applyMiddleware thunk
if composeWithDevTools?
  middleware = composeWithDevTools middleware
store = createStore reducer, middleware

util = require './util'

_try_load_config = ->
  value = util.get_config()
  if value?
    store.dispatch action.wel_change_app_id(value.app_id)
    store.dispatch action.wel_change_key(value.ssad_key)
    store.dispatch action.wel_check_key()
  else
    # go back to welcome page
    store.dispatch action.nav_back()

O = cC {
  displayName: 'O'

  componentDidMount: ->
    _try_load_config()
  #componentWilUnmount: ->

  render: ->
    (cE Provider, {
      store
      },
      (cE Host)
    )
}

# main entry
init = ->
  console.log "DEBUG: start init "
  # render root element
  ReactDOM.render (cE O), document.getElementById('root')
  # TODO
  await return

_start_init = ->
  init().then( () ->
    console.log "DEBUG: init done"
  ).catch( (e) ->
    console.log "DEBUG: init error !  #{e}"
  )
# start global init after page load
$ _start_init
