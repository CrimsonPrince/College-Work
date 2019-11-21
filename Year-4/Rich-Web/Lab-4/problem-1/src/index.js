import React from 'react'
import ReactDOM from 'react-dom'
import './index.css'

class Note extends React.Component {
  render () {
    const style = { backgroundColor: this.props.color }
    return (
      <div className='notes' style={style}>
        {this.props.children}
        <span className='deleteButton' onClick={this.props.onDelete}>×</span>
        <span className='editButton' onClick={this.props.onEdit}>Edit</span>
      </div>
    )
  }
}

class NotesEditor extends React.Component {
  constructor (props) {
    super(props)
    this.state = {
      value: '',
      color: ''
    }
    this.handleTextChange = this.handleTextChange.bind(this)
    this.handleColorChange = this.handleColorChange.bind(this)
    this.handleNoteAdd = this.handleNoteAdd.bind(this)
  }

  handleTextChange (e) {
    this.setState({
      value: e.target.value
    })
  }

  handleColorChange (e) {
    this.setState({
      color: e.target.value
    })
  }

  handleNoteAdd () {
    if (this.state.value.length) {
      const newNote = {
        value: this.state.value,
        color: this.state.color,
        id: new Date()
      }
      this.props.onNoteAdd(newNote)
      this.setState({
        value: '',
        color: '',
        checked: false
      })
    }
  }

  render () {
    return (
      <div className='noteEditor'>
        <input
          type='text' id='inputText' placeholder='Add New'
          value={this.state.value}
          onChange={this.handleTextChange}
        />
        <input type='color' id='inputColor' onChange={this.handleColorChange} value='#fdffff' />
        <button className='addButton' onClick={this.handleNoteAdd}>Add</button>
      </div>
    )
  }
}

class NotesList extends React.Component {
  render () {
    const displayedNotes = this.props.notes
    return (
      displayedNotes.map((note) => {
        return (
          <Note
            key={note.id}
            color={note.color}
            onDelete={this.props.onNoteDelete.bind(null, note)}
            onEdit={this.props.onNoteEdit.bind(null, note)}
          >{note.value}
          </Note>
        )
      })
    )
  }
}

class NotesApp extends React.Component {
  constructor (props) {
    super(props)
    this.state = { notes: [] }
    this.handleAddNote = this.handleAddNote.bind(this)
    this.handleDeleteNote = this.handleDeleteNote.bind(this)
    this.handleEditNote = this.handleEditNote.bind(this)
  }

  componentDidMount () {
    const localNotes = JSON.parse(localStorage.getItem('notes'))
    if (localNotes) {
      this.setState({
        notes: localNotes
      })
    }
  }

  componentDidUpdate () {
    this.updateNotes()
  }

  handleDeleteNote (note) {
    const noteId = note.id
    const newNotes = this.state.notes.filter(function (note) {
      return note.id !== noteId
    })
    this.setState({
      notes: newNotes
    })
  }

  handleEditNote (note) {
    const noteId = note.id
    const oldNote = this.state.notes.filter(function (note) {
      return note.id === noteId
    })
    const newNotes = this.state.notes.filter(function (note) {
      return note.id !== noteId
    })
    oldNote[0].value = window.prompt('Edit Note', oldNote[0].children)
    this.setState({
      notes: [oldNote[0], ...newNotes]
    })
  }

  handleAddNote (newNote) {
    this.setState({
      notes: [newNote, ...this.state.notes]
    })
  }

  updateNotes () {
    const notes = JSON.stringify(this.state.notes)
    localStorage.setItem('notes', notes)
  }

  render () {
    return (
      <div className='container'>
        <NotesEditor onNoteAdd={this.handleAddNote} />
        <NotesList notes={this.state.notes} onNoteDelete={this.handleDeleteNote} onNoteEdit={this.handleEditNote} />
      </div>
    )
  }
}

ReactDOM.render(
  <NotesApp />,
  document.getElementById('root')
)
