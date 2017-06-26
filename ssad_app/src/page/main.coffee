# main.coffee, smd-js/ssad_app/src/page/
# css class: page_main

{ createElement: cE } = require 'react'
cC = require 'create-react-class'

NavTop = require '../sub/nav_top'
SubItem = require '../sub/sub_item'
NullFill = require '../sub/null_fill'
MainButton = require '../sub/main_button'


PageMain = cC {
  displayName: 'PageMain'

  render: ->
    (cE 'div', {
      className: 'page_main'
      },
      (cE NavTop, {
        title: 'smd-js'
        title_center: true
        right: true
        on_click_right: @props.on_goto_about
        })
      (cE 'div', {
        className: 'page_body'
        },
        (cE SubItem, {
          left: 'Input'
          right_text: 'TODO'
          on_click: @props.on_goto_input
          })
        (cE SubItem, {
          left: 'Output'
          right_text: 'TODO'
          on_click: @props.on_goto_output
          })
        # TODO
        (cE NullFill)
        (cE MainButton, {
          text: 'Compile'
          on_click: @props.on_compile
          })
      )
    )
}

module.exports = PageMain
