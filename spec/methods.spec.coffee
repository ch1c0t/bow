{ bow } = require '@ch1c0t/bow'

describe 'methods', ->
  it 'allows to use methods', ->
    Some = bow
      init: ({ Identifier, ObjectPattern }) ->
        @Identifier = Identifier
        @ObjectPattern = ObjectPattern
      methods:
        definesVariables: ->
          Boolean (@Identifier or @ObjectPattern)

    some = Some {}
    expect(some.definesVariables()).toBe no

    some2 = Some Identifier: 'i', ObjectPattern: 'o'
    expect(some2.definesVariables()).toBe yes
