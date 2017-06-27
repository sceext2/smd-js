# input_output.coffee, smd-js/ssad_app/src/page/
# css class: page_io

path = require 'path'

{ createElement: cE } = require 'react'
cC = require 'create-react-class'

{
  FormGroup
  FormControl
  Alert
} = require 'react-bootstrap'

NavTop = require '../sub/nav_top'
NullFill = require '../sub/null_fill'
MainButton = require '../sub/main_button'


PageIO = cC {
  displayName: 'PageIO'

  _on_change: (event) ->
    @props.on_change event.target.value

  _check_path_filename: ->
    if (! @props.path?) || ('' == @props.path)
      return false
    if (! @props.filename?) || ('' == @props.filename)
      return false
    true

  _render_form: ->
    if @_check_path_filename()
      (cE 'div', {
        className: 'output_to'
        },
        (cE 'span', {
          className: 'label'
          },
          'Output to'
        )
        (cE 'span', {
          className: 'value'
          },
          path.join @props.path, @props.filename
        )
      )
    else
      (cE 'form', null,
        (cE FormGroup, null,
          (cE FormControl, {
            componentClass: 'textarea'
            placeholder: @props.placeholder
            value: @props.text
            onChange: @_on_change
            })
        )
      )

  _render_error: ->
    if @props.error_info?
      (cE 'div', {
        className: 'error_info'
        },
        (cE Alert, {
          bsStyle: 'danger'
          },
          (cE 'strong', null,
            'Error '
          )
          @props.error_info
        )
      )

  render: ->
    (cE 'div', {
      className: 'page_io'
      },
      (cE NavTop, {
        title: @props.title
        on_back: @props.on_back
        })
      (cE 'div', {
        className: 'page_body'
        },
        @_render_form()
        @_render_error()
        (cE MainButton, {
          text: 'Select file'
          right: true
          on_click: @props.on_goto_select_file
          })
      )
    )
}

module.exports = PageIO
