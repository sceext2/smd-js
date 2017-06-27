# about.coffee, smd-js/ssad_app/src/page/
# css class: page_about

{ createElement: cE } = require 'react'
cC = require 'create-react-class'

NavTop = require '../sub/nav_top'


PageAbout = cC {
  displayName: 'PageAbout'

  render: ->
    (cE 'div', {
      className: 'page_about'
      },
      (cE NavTop, {
        title: 'About'
        on_back: @props.on_back
        })
      (cE 'div', {
        className: 'page_body'
        },
        # TODO
      )
    )
}

module.exports = PageAbout
