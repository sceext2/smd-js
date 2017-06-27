# null_fill.coffee, smd-js/ssad_app/src/sub/
# css class: sub_null_fill

{ createElement: cE } = require 'react'
cC = require 'create-react-class'


NullFill = cC {
  displayName: 'NullFill'

  render: ->
    (cE 'div', {
      className: 'sub_null_fill'
      })
}

module.exports = NullFill
