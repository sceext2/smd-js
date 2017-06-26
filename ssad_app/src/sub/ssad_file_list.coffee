# ssad_file_list.coffee, smd-js/ssad_app/src/sub/
# css class: ssad_file_list

querystring = require 'querystring'

{ createElement: cE } = require 'react'
cC = require 'create-react-class'

config = require '../config'


SsadFileList = cC {
  displayName: 'SsadFileList'

  _on_got_msg: (msg) ->
    # TODO

  _make_src: ->
    q = {
      app_id: @props.app_id
      ssad_key: @props.ssad_key
      show_path: true
      # TODO more args ?
    }
    # o
    config.SSAD_FILE_LIST + '?' + querystring.stringify(q)

  _render_iframe: ->
    if (! @props.app_id?) || (! @props.ssad_key?)
      return  # must give app_id and ssad_key
    # TODO use ref ?
    (cE 'iframe', {
      src: @_make_src()
      })

  render: ->
    (cE 'div', {
      className: 'ssad_file_list'
      },
      @_render_iframe()
    )
}

module.exports = SsadFileList
