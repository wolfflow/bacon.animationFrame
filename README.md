# bacon.animationFrame

Leverage requestAnimationFrame in [Bacon.js](https://github.com/baconjs/bacon.js) way!

## Methods

<a name="bacon-scheduleanimationframe"></a>
[`Bacon.scheduleAnimationFrame`](#bacon-scheduleanimationframe "Bacon.scheduleAnimationFrame(): EventStream[Number]")

Returns an EventStream with requestID values produced on each animationFrame tick.

<a name="bacon-repeatedlyonframe"></a>
[`Bacon.repeatedlyOnFrame(values, divisor)`](#bacon-repeatedlyonframe "Bacon.repeatedlyOnFrame(values: Array[A], divisor: Number): EventStream[A]")

Repeats given elements infinitely on nth frame (divisor parameter, default value is 1).
Similar to [Bacon.repeatedly](https://github.com/baconjs/bacon.js#bacon-repeatedly), but uses `requestAnimationFrame` instead of `setTimeout/setInterval`

## Install

For [node.js](http://nodejs.org/) users

    npm install bacon.animationframe

For [bower](https://github.com/twitter/bower) users:

    bower install bacon.animationframe