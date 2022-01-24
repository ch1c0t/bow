exports.bow = ({ init }) ->
  (input) ->
    state = {}
    init.call state, input
    state
