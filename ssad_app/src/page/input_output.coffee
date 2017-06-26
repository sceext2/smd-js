# input_output.coffee, smd-js/ssad_app/src/page/
# css class: page_io

{ createElement: cE } = require 'react'
cC = require 'create-react-class'

NavTop = require '../sub/nav_top'
NullFill = require '../sub/null_fill'
MainButton = require '../sub/main_button'


PageIO = cC {
  displayName: 'PageIO'

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
        # TODO
        (cE NullFill)
        (cE MainButton, {
          text: 'Select file'
          right: true
          on_click: @props.on_goto_select_file
          })
      )
    )
}

module.exports = PageIO
