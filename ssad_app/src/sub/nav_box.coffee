# nav_box.coffee, smd-js/ssad_app/src/sub/
# css class: nav_box

{ createElement: cE } = require 'react'
cC = require 'create-react-class'


NavBox = cC {
  displayName: 'NavBox'

  render: ->
    (cE 'div', {
      className: "nav_box #{@props.state}"
      },
      @props.children
    )
}

module.exports = NavBox
