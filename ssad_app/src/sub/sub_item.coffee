# sub_item.coffee, smd-js/ssad_app/src/sub/
# css class: sub_item

{ createElement: cE } = require 'react'
cC = require 'create-react-class'


SubItem = cC {
  displayName: 'SubItem'

  _render_right_text: ->
    if @props.right_text?
      (cE 'span', {
        className: 'right_text'
        },
        @props.right_text
      )

  render: ->
    (cE 'div', {
      className: 'sub_item'
      onClick: @props.on_click
      },
      (cE 'span', {
        className: 'left'
        },
        @props.left
      )
      @_render_right_text()
      (cE 'span', {
        className: 'right'
        },
        '>'
      )
    )
}

module.exports = SubItem
