{ f } = require '@ch1c0t/f'

exports.bow = ({ methods, init, setup }) ->
  (input) ->
    state = {}

    for own key, fn of methods
      state[key] = fn.bind state

    if typeof init is 'function'
      init.call state, input
    else
      fn = f in: init
      props = fn input
      for own key, value of props
        state[key] = value

    if typeof setup is 'function'
      setup.call state
    else
      state
