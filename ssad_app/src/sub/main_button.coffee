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
    click = @props.on_click
    c = 'sub_main_button'
    if @props.disabled
      click = null
      c += ' disabled'

    (cE 'div', {
      className: c
      onClick: click
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
