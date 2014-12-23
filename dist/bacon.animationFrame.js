(function(){
  var init, Bacon;
  init = function(Bacon){
    var cancelRequestAnimationFrame, requestAnimationFrame, scheduleFrame;
    cancelRequestAnimationFrame = function(){
      return window.cancelAnimationFrame || window.webkitCancelRequestAnimationFrame || window.mozCancelRequestAnimationFrame || window.oCancelRequestAnimationFrame || window.msCancelRequestAnimationFrame || clearTimeout;
    }();
    requestAnimationFrame = function(){
      return window.requestAnimationFrame || window.webkitRequestAnimationFrame || window.mozRequestAnimationFrame || window.oRequestAnimationFrame || window.msRequestAnimationFrame || function(cb){
        return setTimeout(cb, 1000 / 60);
      };
    }();
    scheduleFrame = function(cb){
      return (function(){
        function animLoop(y){
          cb(y);
          return requestAnimationFrame(function(x){
            return animLoop(x);
          });
        }
        return animLoop;
      }())();
    };
    Bacon.scheduleAnimationFrame = function(){
      return Bacon.fromBinder(function(handler){
        var id;
        id = scheduleFrame(handler);
        return function(){
          return cancelRequestAnimationFrame(id);
        };
      });
    };
    Bacon.repeatedlyOnFrame = function(values, divisor){
      var index;
      divisor == null && (divisor = 1);
      index = 0;
      return Bacon.scheduleAnimationFrame().scan(0, (function(it){
        return it + 1;
      })).filter(function(tick){
        return !(tick % divisor);
      }).map(function(){
        return values[index++ % values.length];
      }).toEventStream();
    };
    return Bacon;
  };
  if (typeof module != 'undefined' && module !== null) {
    Bacon = require("baconjs");
    module.exports = init(Bacon);
  } else {
    if (typeof define === "function" && define.amd) {
      define(["bacon"], init);
    } else {
      init(this.Bacon);
    }
  }
}).call(this);
