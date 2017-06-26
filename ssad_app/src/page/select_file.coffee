# select_file.coffee, smd-js/ssad_app/src/page/
# css class: page_select_file

{ createElement: cE } = require 'react'
cC = require 'create-react-class'

NavTop = require '../sub/nav_top'
SsadFileList = require '../sub/ssad_file_list'


PageSelectFile = cC {
  display: 'PageSelectFile'

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
          # TODO
          })
        (cE 'div', {
          className: 'foot'
          },
          # TODO
        )
      )
    )
}

module.exports = PageSelectFile
