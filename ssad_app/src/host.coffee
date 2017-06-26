# host.coffee, smd-js/ssad_app/src/
# css class: host

{ createElement: cE } = require 'react'
cC = require 'create-react-class'

NavHost = require './sub/nav_host'
NavBox = require './sub/nav_box'

PageWelcome = require './page/welcome'
PageMain = require './page/main'
PageAbout = require './page/about'
PageIO = require './page/input_output'
PageSelectFile = require './page/select_file'


Host = cC {
  displayName: 'Host'

  render: ->
    (cE 'div', {
      className: 'host'
      },
      # TODO
    )
}

module.exports = Host
