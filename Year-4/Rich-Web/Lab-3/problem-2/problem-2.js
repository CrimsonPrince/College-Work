startButton = document.querySelector('#start')
Rx.Observable.fromEvent(startButton, 'click')
  .subscribe(e => start())

function start () {
  const hour = document.querySelector('#hour')
  const minute = document.querySelector('#minute')
  const second = document.querySelector('#second')

  console.log(hour.value)
  console.log(minute.value)
  console.log(second.value)
  const seconds = Number(hour.value) * 60 * 60 + Number(minute.value) * 60 + Number(second.value)
  console.log(seconds)
  var source = Rx.Observable.timer(0, 1000)
    .take(seconds)

  var subscription = source.subscribe(
    function (x) {
      console.log('Next: ' + x)
    },
    function (err) {
      console.log('Error: ' + err)
    },
    function () {
      console.log('Completed')
    })
}
