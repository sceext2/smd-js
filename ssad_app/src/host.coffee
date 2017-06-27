# host.coffee, smd-js/ssad_app/src/
# css class: host

{ createElement: cE } = require 'react'
cC = require 'create-react-class'

NavHost = require './sub/nav_host'
NavBox = require './sub/nav_box'

PageWelcome = require './page/welcome'
PageMain = require './page/main'
PageAbout = require './page/about'
PageIO = require './page/input_output'
PageSelectFile = require './page/select_file'


Host = cC {
  displayName: 'Host'

  render: ->
    (cE 'div', {
      className: 'host'
      },
      (cE NavHost, null,
        # page welcome
        (cE NavBox, {
          state: @props.nav_state_welcome
          },
          (cE PageWelcome, {
            on_ok: @props.on_wel_ok
            on_change_id: @props.on_wel_change_id
            on_change_key: @props.on_wel_change_key
            app_id: @props.wel_app_id
            ssad_key: @props.wel_key
            error: @props.wel_error
            })
        )
        # page main
        (cE NavBox, {
          state: @props.nav_state_main
          },
          (cE PageMain, {
            on_goto_about: @props.nav_goto_about
            on_goto_input: @props.nav_goto_input
            on_goto_output: @props.nav_goto_output
            on_compile: @props.on_compile
            on_back: @props.nav_back

            text_input: @props.text_input
            output_path: @props.path_sfo
            output_filename: @props.filename_sfo
            })
        )
        # page about
        (cE NavBox, {
          state: @props.nav_state_about
          },
          (cE PageAbout, {
            on_back: @props.nav_back
            })
        )
        # page input
        (cE NavBox, {
          state: @props.nav_state_input
          },
          (cE PageIO, {
            title: 'Input'
            placeholder: 'input text'
            text: @props.text_input

            on_back: @props.nav_back
            on_goto_select_file: @props.nav_goto_sfi
            on_change: @props.on_change_input
            })
        )
        # page output
        (cE NavBox, {
          state: @props.nav_state_output
          },
          (cE PageIO, {
            title: 'Output'
            placeholder: 'output text'
            text: @props.text_output
            path: @props.path_sfo
            filename: @props.filename_sfo

            on_back: @props.nav_back
            on_goto_select_file: @props.nav_goto_sfo
            on_change: @props.on_change_output
            })
        )
        # page select file (i)
        (cE NavBox, {
          state: @props.nav_state_select_file_i
          },
          (cE PageSelectFile, {
            app_id: @props.app_id
            ssad_key: @props.ssad_key
            path: @props.path_sfi
            filename: @props.filename_sfi

            on_back: @props.nav_back
            on_reset: @props.on_reset_sfi
            on_msg: @props.on_msg_sfi
            on_change_filename: @props.on_change_filename_sfi
            on_ok: @props.on_ok_sfi
            })
        )
        # page select file (o)
        (cE NavBox, {
          state: @props.nav_state_select_file_o
          },
          (cE PageSelectFile, {
            app_id: @props.app_id
            ssad_key: @props.ssad_key
            path: @props.path_sfo
            filename: @props.filename_sfo
            hide_ok_button: true

            on_back: @props.nav_back
            on_reset: @props.on_reset_sfo
            on_msg: @props.on_msg_sfo
            on_change_filename: @props.on_change_filename_sfo
            })
        )
      )
    )
}

module.exports = Host
