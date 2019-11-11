(function () {
  const list = document.querySelector('#list')
  const item = document.querySelector('#item')

  Rx.Observable.fromEvent(item, 'keydown')
    .filter(event => event.keyCode === 13)
    .subscribe(e => addNote(e))

  function store () {
    window.localStorage.myitems = list.innerHTML
    getValues()
  }

  function getValues () {
    var storedValues = window.localStorage.myitems
    if (!storedValues) {
      list.innerHTML = ''
    } else {
      list.innerHTML = storedValues
    }
    addObservables()
  }

  function addObservables () {
    const editButtons = document.querySelectorAll('.editButton')
    const deleteButtons = document.querySelectorAll('.deleteButton')
    Rx.Observable.fromEvent(deleteButtons, 'click')
      .subscribe(e => removeNote(e))

    Rx.Observable.fromEvent(editButtons, 'click')
      .subscribe(e => editNote(e))
  }

  function addNote (e) {
    if (item.value === '') {
      return
    }
    e.preventDefault()
    list.innerHTML += '<li>' + item.value + '<input type="button" class="editButton" value="Edit">' + '<input type="button" class="deleteButton" value="Delete">' + '</li>'
    store()
    item.value = ''
  }

  function removeNote (e) {
    console.log(e)
    var t = e.target
    t = t.parentNode
    t.parentNode.removeChild(t)
    store()
  }

  function editNote (e) {
    Rx.Observable.fromEvent(document, 'submit')
      .subscribe(store())
  }

  getValues()
}
)()
