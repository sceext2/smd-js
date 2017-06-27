# main.coffee, smd-js/ssad_app/src/page/
# css class: page_main

{ createElement: cE } = require 'react'
cC = require 'create-react-class'

NavTop = require '../sub/nav_top'
SubItem = require '../sub/sub_item'
Log = require '../sub/log'
MainButton = require '../sub/main_button'


PageMain = cC {
  displayName: 'PageMain'

  _input_state: ->
    none = 'None'
    if ! @props.text_input?
      return none
    len = @props.text_input.length
    if len < 1
      return none
    else
      return len.toString()

  _output_state: ->
    textarea = 'Textarea'
    if (! @props.output_path?) || ('' == @props.output_path)
      return textarea
    if (! @props.output_filename?) || ('' == @props.output_filename)
      return textarea
    return @props.output_filename

  render: ->
    (cE 'div', {
      className: 'page_main'
      },
      (cE NavTop, {
        title: 'smd-js'
        title_center: true
        right: true
        on_click_right: @props.on_goto_about
        on_back: @props.on_back
        })
      (cE 'div', {
        className: 'page_body'
        },
        (cE SubItem, {
          left: 'Input'
          right_text: @_input_state()
          on_click: @props.on_goto_input
          })
        (cE SubItem, {
          left: 'Output'
          right_text: @_output_state()
          on_click: @props.on_goto_output
          })
        # logs
        (cE Log, {
          logs: @props.logs
          })
        (cE MainButton, {
          text: 'Compile'
          on_click: @props.on_compile
          })
      )
    )
}

module.exports = PageMain
