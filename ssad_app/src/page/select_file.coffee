# select_file.coffee, smd-js/ssad_app/src/page/
# css class: page_select_file

{ createElement: cE } = require 'react'
cC = require 'create-react-class'

{
  FormGroup
  FormControl
  InputGroup
  Button
  ControlLabel
  Alert
} = require 'react-bootstrap'

NavTop = require '../sub/nav_top'
SsadFileList = require '../sub/ssad_file_list'


PageSelectFile = cC {
  display: 'PageSelectFile'

  _on_change_filename: (event) ->
    @props.on_change_filename event.target.value

  _is_disable_ok_button: ->
    # check filename is null
    if (! @props.filename?) || ('' == @props.filename)
      return true
    # check path is null
    if (! @props.path?) || ('' == @props.path)
      return true
    false

  _is_disable_filename: ->
    # check path is null
    if (! @props.path?) || ('' == @props.path)
      return true
    false

  _render_filename: ->
    if @props.hide_ok_button
      (cE FormControl, {
        type: 'text'
        value: @props.filename
        placeholder: 'filename'
        disabled: @_is_disable_filename()
        onChange: @_on_change_filename
        })
    else
      (cE InputGroup, null,
        (cE FormControl, {
          type: 'text'
          value: @props.filename
          placeholder: 'filename'
          disabled: @_is_disable_filename()
          onChange: @_on_change_filename
          })
        (cE InputGroup.Button, null,
          (cE Button, {
            bsStyle: 'primary'
            disabled: @_is_disable_ok_button()
            onClick: @props.on_ok
            },
            'OK'
          )
        )
      )

  render: ->
    (cE 'div', {
      className: 'page_select_file'
      },
      (cE NavTop, {
        title: 'Select file'
        right_button: 'reset'
        on_back: @props.on_back
        on_click_right: @props.on_reset
        })
      (cE 'div', {
        className: 'page_body'
        },
        (cE SsadFileList, {
          app_id: @props.app_id
          ssad_key: @props.ssad_key
          on_msg: @props.on_msg
          })
        (cE 'form', {
          className: 'foot'
          },
          (cE 'div', {
            className: 'path'
            },
            (cE 'span', {
              className: 'label'
              },
              'path:'
            )
            (cE 'span', {
              className: 'value'
              },
              @props.path
            )
          )
          (cE FormGroup, null,
            @_render_filename()
          )
        )
      )
    )
}

module.exports = PageSelectFile
