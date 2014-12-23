init = (Bacon) ->
  cancelRequestAnimationFrame = do ->
    window.cancelAnimationFrame or
    window.webkitCancelRequestAnimationFrame or
    window.mozCancelRequestAnimationFrame or
    window.oCancelRequestAnimationFrame or
    window.msCancelRequestAnimationFrame or
    clearTimeout

  requestAnimationFrame = do ->
    window.requestAnimationFrame or
    window.webkitRequestAnimationFrame or
    window.mozRequestAnimationFrame or
    window.oRequestAnimationFrame or
    window.msRequestAnimationFrame or
    (cb) -> setTimeout cb, 1000 / 60
  
  scheduleFrame = (cb) ->
    do function animLoop (y)
      cb(y)
      requestAnimationFrame (x) -> animLoop(x)
  
  Bacon.scheduleAnimationFrame = ->
    Bacon.fromBinder (handler) ->
      id = scheduleFrame handler
      -> cancelRequestAnimationFrame id

  Bacon.repeatedlyOnFrame = (values, divisor = 1) ->
    index = 0
    Bacon.scheduleAnimationFrame!
    .scan 0, (+ 1)
    .filter (tick) -> !(tick % divisor)
    .map -> values[index++ % values.length]
    .toEventStream!
    
  Bacon

if module?
  Bacon = require "baconjs"
  module.exports = init Bacon
else
  if typeof define == "function" and define.amd
    define ["bacon"], init
  else
    init @Bacon