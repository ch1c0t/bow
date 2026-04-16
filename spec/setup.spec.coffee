{ bow } = require '@ch1c0t/bow'

Emitter = require 'events'
{ once } = Emitter

describe 'setup', ->
  it 'runs after init() and changes what a bow returns', ->
    Example = bow
      init:
        path: -> @value
        emitter: -> @value
      setup: ->
        @data = await once @emitter, 'message'
        @

    emitter = new Emitter
    promise = Example
      path: 'some/path'
      emitter: emitter

    emitter.emit 'message', 'data object'
    example = await promise

    expect(example.path).toBe 'some/path'
    expect(example.data).toEqual ['data object']
