# action.coffee, smd-js/ssad_app/src/redux/

path = require 'path'

ssad_server_api = require '../ssad_server_api'
event_api = require '../event_api'


# action types

# nav
NAV_BACK = 'nav_back'

# TODO


# nav

nav_back = ->
  {
    type: NAV_BACK
  }

module.exports = {
  NAV_BACK

  nav_back
}
