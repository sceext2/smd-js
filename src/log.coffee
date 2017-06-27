# log.coffee, smd-js/src/

SMD_LOG_PREFIX = 'smd::'


# support out log function (log callback)
_etc = {
  log_cb: null
}

# get / set cb
log_cb = (cb) ->
  if cb?
    _etc.log_cb = cb
  _etc.log_cb

# base log function
_log = (text) ->
  console.log text
  # log callback
  _etc.log_cb?(text)

# WARN
w = (text) ->
  o = SMD_LOG_PREFIX + 'WARN: ' + text
  _log o

module.exports = {
  w

  log_cb  # get/set
}
