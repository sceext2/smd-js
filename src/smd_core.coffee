# smd_core.coffee, smd-js/src/
util = require './util'
log = require './log'
smd_config = require './smd_config'


# smd core compile function
smd_compile = (smd_raw_text) ->
  t = smd_raw_text

  t = _c_remove_xml_comment t
  t = _c_normal_line_ending t

  # split lines
  line = t.split '\n'
  # check first line
  _check_first_line line

  # first process lines
  line = _c_process_line line
  line = _c_check_concat_line line
  line = _c_second_process line

  # process done
  _c_concat_line line


# check functions
_check_first_line = (line) ->
  first = ''
  if line.length > 0
    first = line[0]
  OK_F = smd_config.SMD_FIRST_LINE_START
  if ! first.startsWith OK_F
    log.w "this document is not in smd format, the first line \"#{first}\" not startswith \"#{OK_F}\" "
    return false  # check not pass
  true  # check pass

check_filename = (name) ->
  OK_EXT = smd_config.SMD_FILE_EXT
  if ! name.endsWith OK_EXT
    log.w "ext of this file \"#{name}\" is not \"#{OK_EXT}\" "
    return false  # check not pass
  true  # check pass


# base compile functions

_c_concat_line = (line) ->
  o = ''
  for l in line
    o += l.text
  # add \n after text
  o += '\n\n'
  # add last update after text
  o += '# smd compile at ' + util.make_last_update() + '\n\n'
  o

_c_remove_xml_comment = (raw) ->
  # remove xml comment format
  # <!-- -->
  CS = smd_config.SMD_COMMENT_START
  CE = smd_config.SMD_COMMENT_END

  rest = raw
  flag_comment = false

  _slice_rest = (rest, key) ->
    rest.slice rest.split(key, 1)[0].length + key.length

  o = ''
  while rest.length > 0
    if flag_comment
      # NO -->
      if rest.indexOf(CE) is -1
        rest = ''
        continue
      # split by -->
      rest = _slice_rest rest, CE
      # ignore comment text
      flag_comment = false  # reset flag
      continue
    # check no <!--
    if rest.indexOf(CS) is -1
      o += rest
      rest = ''
      continue
    # split by <!--
    o += rest.split(CS, 1)[0]
    rest = _slice_rest rest, CS
    flag_comment = true
  o

_c_normal_line_ending = (raw) ->
  # replace abnormal line-ending chars
  # \r\n -> \n
  # \r -> \n
  raw.split('\r\n').join('\n').split('\r').join('\n')

# first process smd lines
_c_process_line = (raw) ->
  FC = smd_config.SMD_LINE_FIRST_CHAR
  o = []
  # check each line
  for i in [0... raw.length]
    line = raw[i]
    # check line is null
    if line.length < 1
      o.push {
        type : ''
        text : ''
        index : i  # line number of src file FIXME BUG here
      }
      continue
    # check first char
    [first, rest] = [ line[0], line[1..] ]
    if first is FC.comment
      # ignore comment line
      continue
    else if first is FC.title
      # add \n before and after title line
      o.push {
        type : 'skip'
        text : '\n'
        index : i
      }
      o.push {
        type : ''
        text : line
        index : i
      }
      o.push {
        type : 'skip'
        text : '\n'
        index : i
      }
    else if first is FC.p
      # add \n before this line
      o.push {
        type : 'skip'
        text : '\n'
        index : i
      }
      o.push {
        type : ''
        text : rest
        index : i
      }
    else  # add normal line
      o.push {
        type : ''
        text : line
        index : i
      }
  o

# check and concat same type lines
_c_check_concat_line = (raw) ->
  o = []
  # put first line
  o.push {
    type : ''
    text : ''
    index : -1
  }

  rest = raw
  while rest.length > 0
    [one, rest] = [ rest[0], rest[1..] ]
    if (one.type is '') and (o[o.length - 1].type is '')
      # concat normal line, add space char
      o[o.length - 1].text += ' ' + one.text
    else  # not concat
      o.push one
  o

# process after first line process
_c_second_process = (raw) ->
  # process each line
  for i in raw
    if i.type != 'skip'
      i.text = _c_scan_clip i.text, i.index
  raw

# scan a small pice of text
_c_scan_clip = (raw, line_n) ->
  SC = smd_config.SMD_SLASH_CHAR
  BC = smd_config.SMD_BEFORE_CHAR
  AC = smd_config.SMD_AFTER_CHAR

  rest = raw
  flag_s = false  # for \ char
  flag_u = false  # for _ char

  o = ''
  # scan each char
  while rest.length > 0
    [one, rest] = [ rest[0], rest[1..] ]
    # check \ mode
    if flag_s
      if ! SC[one]?
        log.w "unknown slash char [\\#{one}] at line #{line_n + 1}: #{raw}"
        # NOTE just ignore bad char
      else  # do replace
        o += SC[one]
      flag_s = false  # reset flag
      continue
    else if flag_u  # _ mode
      if ! BC[one]?
        o += '_' + one  # add as normal char
      else
        o += BC[one]
      flag_u = false  # reset flag
      continue
    # check \ char
    if one is '\\'
      flag_s = true  # set flag
      continue
    # check _ char
    if one is '_'
      flag_u = true  # set flag
      continue
    # check chars before _ char
    if AC[one]?
      # check next is _ char
      if rest.startsWith '_'
        o += AC[one]
        rest = rest[1..]  # reset rest
      else
        o += one  # add as normal char
      continue
    # check multi-space chars
    if one is ' '
      if ! o.endsWith ' '
        o += ' '
      continue
    # normal char
    o += one
  o


module.exports = {
  smd_compile
  check_filename
}
