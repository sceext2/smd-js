# welcome.coffee, smd-js/ssad_app/src/page/
# css class: page_welcome

{ createElement: cE } = require 'react'
cC = require 'create-react-class'

{
  FormGroup
  ControlLabel
  FormControl
  Alert
} = require 'react-bootstrap'

NavTop = require '../sub/nav_top'
NullFill = require '../sub/null_fill'
MainButton = require '../sub/main_button'


PageWelcome = cC {
  displayName: 'PageWelcome'

  _on_change_id: (event) ->
    @props.on_change_id event.target.value

  _on_change_key: (event) ->
    @props.on_change_key event.target.value

  _render_form: ->
    (cE 'form', null,
      (cE FormGroup, null,
        (cE ControlLabel, null,
          'APP_ID'
        )
        (cE FormControl, {
          type: 'text'
          value: @props.app_id
          placeholder: 'input APP_ID here'
          onChange: @_on_change_id
          })
      )
      (cE FormGroup, null,
        (cE ControlLabel, null,
          'SSAD_KEY'
        )
        (cE FormControl, {
          type: 'text'
          value: @props.ssad_key
          placeholder: 'input SSAD_KEY here'
          onChange: @_on_change_key
          })
      )
    )

  _render_error: ->
    if @props.error?
      (cE Alert, {
        bsStyle: 'danger'
        },
        (cE 'strong', null,
          'Error '
        )
        @props.error
      )

  render: ->
    (cE 'div', {
      className: 'page_welcome'
      },
      (cE NavTop, {
        title: 'Welcome'
        title_center: true
        })
      (cE 'div', {
        className: 'page_body'
        },
        # TODO
        (cE 'div', {
          className: 'pad'
          },
          # input app_id / key
          @_render_form()
          # error info
          @_render_error()
        )
        # main button
        (cE NullFill)
        (cE MainButton, {
          text: 'OK'
          right: true
          on_click: @props.on_ok
          })
      )
    )
}

module.exports = PageWelcome
