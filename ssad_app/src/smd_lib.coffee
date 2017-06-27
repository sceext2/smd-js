# smd_lib.coffee, smd-js/ssad_app/src/

# smd_core
smd_core = require '../../dist/smd_core'
smd_log = require '../../dist/log'
smd_config = require '../../dist/smd_config'


# TODO check filename ?
# TODO run in background with web-worker ?
compile = (raw_text, log) ->
  # save old log, then set new log
  old_log = smd_log.log_cb()
  smd_log.log_cb log
  # do compile
  result = smd_core.smd_compile raw_text
  # restore old log
  smd_log.log_cb old_log
  # done
  await return result


module.exports = {
  compile  # async
}
