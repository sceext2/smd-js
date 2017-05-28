# smd_config.coffee, smd-js/src/

# smd const

SMD_FILE_EXT = '.smd.txt'
SMD_FILE_ENCODING = 'utf-8'
SMD_LINE_ENDING = '\n'

SMD_FIRST_LINE_START = '#! smd: '

SMD_COMMENT_START = '<!--'
SMD_COMMENT_END = '-->'

SMD_LINE_FIRST_CHAR = {
  comment : '#'
  title : ':'
  p : '>'
}

SMD_SLASH = '\\'
# chars after `\`
SMD_SLASH_CHAR = {
  # `\0` --> `` (null)
  '0' : ''
  # `\\` --> `\` (self)
  '\\' : '\\'
  # `\_` --> `_` (underline)
  '_' : '_'
  # `\ ` --> ` ` (keep space)
  ' ' : ' '
}

# `_` char before chars
SMD_BEFORE_CHAR = {
  # _"
  '"' : '“'
}

# `_` char after chars
SMD_AFTER_CHAR = {
  # "_
  '"' : '”'
  # ._
  '.' : '。'
  # ,_
  ',' : '，'
  # ?_
  '?' : '？'
  # !_
  '!' : '！'
  # :_
  ':' : '：'
  # ;_
  ';' : '；'
}


module.exports = {
  SMD_FILE_EXT
  SMD_FILE_ENCODING
  SMD_LINE_ENDING

  SMD_FIRST_LINE_START

  SMD_COMMENT_START
  SMD_COMMENT_END

  SMD_LINE_FIRST_CHAR

  SMD_SLASH
  SMD_SLASH_CHAR
  SMD_BEFORE_CHAR
  SMD_AFTER_CHAR
}
