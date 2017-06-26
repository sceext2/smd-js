# nav_top.coffee, smd-js/ssad_app/src/sub/
# css class: nav_top

{ createElement: cE } = require 'react'
cC = require 'create-react-class'

{ Button } = require 'react-bootstrap'


NavTop = cC {
  displayName: 'NavTop'

  _render_back: ->
    if @props.on_back?
      (cE 'span', {
        className: 'back'
        onClick: @props.on_back
        },
        (cE 'span', null,
          '<'
        )
      )

  _render_right: ->
    if @props.right
      (cE 'span', {
        className: 'right'
        onClick: @props.on_click_right
        },
        (cE 'span', null,
          '>'
        )
      )
    else if @props.right_button?
      (cE 'div', {
        className: 'button'
        },
        (cE Button, {
          onClick: @props.on_click_right
          },
          @props.right_button
        )
      )

  render: ->
    title_class = 'title'
    if @props.title_center
      title_class += ' center'

    (cE 'div', {
      className: 'nav_top'
      },
      @_render_back()
      (cE 'span', {
        className: title_class
        },
        @props.title
      )
      @_render_right()
    )
}

module.exports = NavTop
