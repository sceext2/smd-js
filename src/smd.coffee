# smd.coffee, smd-js/src/

async_ = require './async'
util = require './util'
smd_core = require './smd_core'

# TODO support --version and --help
# TODO support compile multi-files


_p_arg = (args) ->
  o = {
    src: ''
    out: ''
  }
  rest = args
  while rest.length > 0
    [one, rest] = [ rest[0], rest[1..] ]
    switch one
      when '-o', '--output'
        o.out = rest[0]
        rest = rest[1..]
      else  # default: src file
        o.src = one
  o

main = (argv) ->
  # TODO more error process
  a = _p_arg argv

  raw = await async_.read_file a.src
  o = smd_core.smd_compile raw
  await util.write_file a.out, o

_start = ->
  try
    await main(process.argv[2..])
  catch e
    # DEBUG
    console.log "ERROR: #{e.stack}"
    #throw e
    process.exit(1)
_start()
