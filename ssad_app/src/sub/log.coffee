# log.coffee, smd-js/ssad_app/src/sub/
# css class: sub_log

{ createElement: cE } = require 'react'
cC = require 'create-react-class'


Log = cC {
  displayName: 'log'

  _render_logs: ->
    o = []
    for i in [0... @props.logs.length]
      o.push (cE 'li', {
        key: i
        },
        @props.logs[i]
      )
    o

  render: ->
    (cE 'ul', {
      className: 'sub_log'
      },
      @_render_logs()
    )
}

module.exports = Log
