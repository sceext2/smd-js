# action.coffee, smd-js/ssad_app/src/redux/

path = require 'path'

ssad_server_api = require '../ssad_server_api'
event_api = require '../event_api'


# action types

# nav
NAV_BACK = 'nav_back'
NAV_GO = 'nav_go'

# TODO


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


# TODO


module.exports = {
  NAV_BACK
  NAV_GO

  nav_back
  nav_go
}
