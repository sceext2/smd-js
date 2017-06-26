# nav_host.coffee, smd-js/ssad_app/src/sub/
# css class: nav_host

{ createElement: cE } = require 'react'
cC = require 'create-react-class'


NavHost = cC {
  displayName: 'NavHost'

  render: ->
    (cE 'div', {
      className: 'nav_host'
      },
      @props.children
    )
}

module.exports = NavHost
