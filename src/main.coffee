exports.bow = ({ methods, init, setup }) ->
  (input) ->
    state = {}

    for own key, fn of methods
      state[key] = fn.bind state

    if typeof init is 'function'
      init.call state, input
    else
      for own key, fn of init
        value = input[key] if input
        state[key] = fn.call { value }

    if typeof setup is 'function'
      setup.call state
    else
      state
