{ bow } = require '@ch1c0t/bow'

describe 'init', ->
  describe 'initializing a bow with an init Function', ->
    it 'without any input', ->
      Some = bow
        init: ->
          @zero = 0

      some = Some()
      expect(some.zero).toBe 0

    it 'with some input', ->
      Some = bow
        init: (input) ->
          @zero = 0
          @input = input

      some = Some 'some input string'
      expect(some.zero).toBe 0
      expect(some.input).toBe 'some input string'
