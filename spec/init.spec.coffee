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

  describe 'initializing a bow with an Object', ->
    beforeAll ->
      @Some = bow
        init:
          path: -> @value or "some/path"
          port: -> @value or 8080

    it 'works when all the arguments were passed', ->
      some = @Some path: 'another/path', port: 8081
      expect(some.path).toBe 'another/path'
      expect(some.port).toBe 8081

    it 'works when some of the arguments were passed', ->
      some = @Some port: 8082
      expect(some.path).toBe 'some/path'
      expect(some.port).toBe 8082

    it 'works when no arguments were passed', ->
      some = @Some()
      expect(some.path).toBe 'some/path'
      expect(some.port).toBe 8080
