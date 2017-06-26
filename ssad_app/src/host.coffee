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
            on_ok: @props.nav_goto_main
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
            on_back: @props.nav_back
            on_goto_select_file: @props.nav_goto_sfi
            })
        )
        # page output
        (cE NavBox, {
          state: @props.nav_state_output
          },
          (cE PageIO, {
            title: 'Output'
            on_back: @props.nav_back
            on_goto_select_file: @props.nav_goto_sfo
            })
        )
        # page select file (i)
        (cE NavBox, {
          state: @props.nav_state_select_file_i
          },
          (cE PageSelectFile, {
            on_back: @props.nav_back
            on_reset: @props.on_reset_sfi
            })
        )
        # page select file (o)
        (cE NavBox, {
          state: @props.nav_state_select_file_o
          },
          (cE PageSelectFile, {
            on_back: @props.nav_back
            on_reset: @props.on_reset_sfo
            })
        )
      )
    )
}

module.exports = Host
