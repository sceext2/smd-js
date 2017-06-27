# config.coffee, smd-js/ssad_app/src/


P_VERSION = 'smd-js GUI version 0.1.0-3 test20170628 0040'

SSAD_SERVER_ROOT = '/ssad201706/key/'
SSAD_SERVER_VERSION = '/ssad201706/pub/.ssad/version'

# save app_id / ssad_key in localStorage
LOCAL_STORAGE_KEY = 'smd_js_gui_config'

# ssad_file_list url
SSAD_FILE_LIST = '/ssad201706/pub/ssad_file_list/static/ssad_file_list.dev.html'


module.exports = {
  P_VERSION
  SSAD_SERVER_ROOT
  SSAD_SERVER_VERSION

  LOCAL_STORAGE_KEY
  SSAD_FILE_LIST
}
