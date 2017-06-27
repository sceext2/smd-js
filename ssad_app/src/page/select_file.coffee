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
            (cE InputGroup, null,
              (cE FormControl, {
                type: 'text'
                value: @props.filename
                placeholder: 'filename'
                onChange: @_on_change_filename
                })
              (cE InputGroup.Button, null,
                (cE Button, {
                  onClick: @props.on_ok
                  },
                  'OK'
                )
              )
            )
          )
        )
      )
    )
}

module.exports = PageSelectFile
