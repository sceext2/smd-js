# log.coffee, smd-js/src/

SMD_LOG_PREFIX = 'smd::'


# WARN
w = (text) ->
  o = SMD_LOG_PREFIX + 'WARN: ' + text
  console.log o

module.exports = {
  w
}
