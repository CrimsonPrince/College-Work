const startButton = document.querySelector('#start')
const toggle = Rx.Observable.fromEvent(startButton, 'click')

Rx.Observable.fromEvent(document, 'submit')
  .subscribe(e => start())

toggle
  .subscribe(
    () => { start() },
    (error) => console.error(error),
    () => console.log('Click listener completed')
  )

function start () {
  const hour = document.querySelector('#hour')
  const minute = document.querySelector('#minute')
  const second = document.querySelector('#second')
  const secondsDisplay = document.querySelector('#secondsDisplay')
  const minutesDisplay = document.querySelector('#minutesDisplay')
  const hourDisplay = document.querySelector('#hoursDisplay')

  let seconds = Number(hour.value) * 60 * 60 + Number(minute.value) * 60 + Number(second.value)
  console.log('Total Seconds: ' + seconds)
  const source = Rx.Observable.timer(0, 1000)
    .take(seconds)
    .takeUntil(toggle)

  source.subscribe(
    function (x) {
      seconds = seconds - 1
      const hours = Math.floor(seconds / 3600)
      const minutes = Math.floor(seconds % 3600 / 60)
      const secondsRem = Math.floor(seconds % 3600 % 60)
      hourDisplay.innerHTML = hours
      minutesDisplay.innerHTML = minutes
      secondsDisplay.innerHTML = secondsRem
      console.log('Hours: ' + hours + ' Minutes: ' + minutes + ' Seconds: ' + secondsRem)
    },
    function (err) {
      console.log('Error: ' + err)
    },
    function () {
      console.log('Completed')
    })
}
