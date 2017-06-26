# welcome.coffee, smd-js/ssad_app/src/page/
# css class: page_welcome

{ createElement: cE } = require 'react'
cC = require 'create-react-class'

NavTop = require '../sub/nav_top'
NullFill = require '../sub/null_fill'
MainButton = require '../sub/main_button'


PageWelcome = cC {
  displayName: 'PageWelcome'

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
