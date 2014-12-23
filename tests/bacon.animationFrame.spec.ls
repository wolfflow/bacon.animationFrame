expect = require("chai").expect
Bacon = require "../dist/bacon.animationFrame"

specify = it

expectStreamValues = (stream, expectedValues) ->
  values = []
  before (done) ->
    stream.onValue (value) -> values.push(value)
    stream.onEnd(done)
  
  specify "contains expected values", ->
    expect(values).to.deep.equal(expectedValues)
   

describe "Bacon.scheduleAnimationFrame", ->
  stream = Bacon.scheduleAnimationFrame().map(1).take(3)
  expectStreamValues stream, [1, 1, 1]

describe "Bacon.repeatedlyOnFrame 1", ->
 specify "pushes values on every nth frame", ->
   stream = Bacon.repeatedlyOnFrame([0,1,2,3],2).take(4)
   expectStreamValues(stream, [0,1,2,3])