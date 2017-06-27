# main_button.coffee, smd-js/ssad_app/src/sub/
# css class: sub_main_button

{ createElement: cE } = require 'react'
cC = require 'create-react-class'


MainButton = cC {
  displayName: 'MainButton'

  _render_right: ->
    if @props.right
      (cE 'span', {
        className: 'right'
        },
        '>'
      )

  render: ->
    (cE 'div', {
      className: 'sub_main_button'
      onClick: @props.on_click
      },
      (cE 'span', {
        className: 'text'
        },
        @props.text
      )
      @_render_right()
    )
}

module.exports = MainButton
