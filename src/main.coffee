exports.bow = ({ init, methods }) ->
  (input) ->
    state = {}

    for own key, fn of methods
      state[key] = fn.bind state

    init.call state, input

    state
