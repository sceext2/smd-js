# state.coffee, smd-js/ssad_app/src/redux/

init_state = {  # with Immutable
  # page navigation
  nav: {
    # page state (default)
    page: {
      welcome: 'main'  # default page: welcome
      main: 'right'    # main page
      about: 'right'   # about page
      input: 'right'   # input page
      output: 'right'  # output page
      select_file_i: 'right'  # select file page (input)
      select_file_o: 'right'  # select file page (output)
    }
    current: 'welcome'  # current main page
    stack: [ 'welcome' ]  # stack navigation
  }

  # TODO
}

module.exports = init_state
