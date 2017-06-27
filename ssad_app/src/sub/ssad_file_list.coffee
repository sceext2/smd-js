# ssad_file_list.coffee, smd-js/ssad_app/src/sub/
# css class: ssad_file_list
#
# use global:
#   window

querystring = require 'querystring'

{ createElement: cE } = require 'react'
cC = require 'create-react-class'

config = require '../config'


SsadFileList = cC {
  displayName: 'SsadFileList'

  _on_msg: (event) ->
    if event.source != @_w
      return
    data = event.data
    # not parse data here
    @props.on_msg?(data)

  _ref: (iframe) ->
    @_iframe = iframe
    if iframe?
      # init (mount)
      @_w = iframe.contentWindow
      # add event listener
      window.addEventListener 'message', @_on_msg, false
    else  # unmount
      # remove event listener
      window.removeEventListener 'message', @_on_msg
      @_w = null

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
    (cE 'iframe', {
      src: @_make_src()
      ref: @_ref
      })

  render: ->
    (cE 'div', {
      className: 'ssad_file_list'
      },
      @_render_iframe()
    )
}

module.exports = SsadFileList
