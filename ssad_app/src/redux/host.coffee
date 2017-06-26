# host.coffee, smd-js/ssad_app/src/redux/

{ connect } = require 'react-redux'

Host = require '../host'
action = require './action'


mapStateToProps = ($$state, props) ->
  {
    # TODO
  }

mapDispatchToProps = (dispatch, props) ->
  {
    # TODO
  }

O = connect(mapStateToProps, mapDispatchToProps)(Host)
module.exports = O
