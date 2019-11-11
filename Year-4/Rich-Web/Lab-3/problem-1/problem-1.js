// Helper Selectors
const list = document.querySelector('#list')
const inputText = document.querySelector('#inputText')
const inputColor = document.querySelector('#inputColor')

// Notes Class for Cleaner data handling
class Note {
  constructor (value, color) {
    this.value = value
    this.color = color
  }
}

// Add's Observable to be triggered on Submit Of the Form
Rx.Observable.fromEvent(document, 'submit')
  .subscribe(e => addNote())

// Helper Function to retrieve notes from local storage, returns notes array
function retrieveNotes () {
  let notes = JSON.parse(localStorage.getItem('notes'))
  if (notes === null) {
    notes = []
  }
  return notes
}

// Function to Add the Note to LocalStorage
function addNote () {
  const note = new Note(inputText.value, inputColor.value)
  const notes = retrieveNotes()
  notes.push(note)
  localStorage.setItem('notes', JSON.stringify(notes))
  displayNotes()
}

// Function for Displaying the Notes
function displayNotes () {
  list.innerHTML = ''
  const notes = retrieveNotes()
  notes.forEach(function (note, i) {
    // Element Creation
    const listItem = document.createElement('li')
    const deleteButton = document.createElement('span')
    deleteButton.className = 'deleteButton'
    deleteButton.textContent = 'x'
    const editButton = document.createElement('button')
    editButton.className = 'editButton'
    editButton.textContent = 'Edit'
    listItem.style.setProperty('background-color', note.color)
    listItem.innerHTML = note.value
    listItem.appendChild(deleteButton)
    listItem.appendChild(editButton)
    list.appendChild(listItem)

    // Observables to add onclick functionality for the buttons
    Rx.Observable.fromEvent(deleteButton, 'click')
      .subscribe(e => deleteNote(i))
    Rx.Observable.fromEvent(editButton, 'click')
      .subscribe(e => editNote(i))
  })
}

// Function to Delete the Note from Notes Array in LocalStorage
function deleteNote (i) {
  const notes = retrieveNotes()
  notes.splice(i, 1)
  localStorage.setItem('notes', JSON.stringify(notes))
  displayNotes()
}

// Function to edit the Notes Array in Local Storage, displays prompt
function editNote (i) {
  const notes = retrieveNotes() // eslint-disable-line
  notes[i].value = window.prompt('Edit Note', notes[i].value)
  localStorage.setItem('notes', JSON.stringify(notes))
  displayNotes()
}

// Initial Display notes call, to init application
displayNotes()
