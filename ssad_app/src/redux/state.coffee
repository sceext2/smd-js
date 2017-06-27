# state.coffee, smd-js/ssad_app/src/redux/

init_state = {  # with Immutable
  # page navigation
  nav: {
    # page state (default)
    page: {
      welcome: 'left'  # default page: welcome
      main: 'main'    # main page
      about: 'right'   # about page
      input: 'right'   # input page
      output: 'right'  # output page
      select_file_i: 'right'  # select file page (input)
      select_file_o: 'right'  # select file page (output)
    }
    current: 'main'  # current main page
    stack: [ 'welcome', 'welcome' ]  # stack navigation
  }
  # app_id and ssad_key
  app_id: null
  ssad_key: null
  # welcome input
  welcome: {
    app_id: 'smd_js'
    key: ''
    error: null
  }
  # select file
  sfi: {  # select input file
    app_id: null
    sub_root: null
    root_path: null
    path: null
    filename: null
    error: null  # load_input_error here
  }
  sfo: {  # select output file
    app_id: null
    sub_root: null
    root_path: null
    path: null
    filename: null
    error: null
  }
  # input / output
  text_input: ''
  text_output: ''

  # TODO
}

module.exports = init_state
