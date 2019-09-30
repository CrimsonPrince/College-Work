var deleteIcons = document.getElementsByClassName("deleteIcon");
var editIcons = document.getElementsByClassName("editIcon");

function addItem() {

    let input = document.getElementById("newItemInput").value;

    if (input === '') {
        alert("Text Field Cannot Be Empty");
        return;
      }
    document.getElementById("newItemInput").value = "";


  let list = document.getElementById("notesList")
  let li = document.createElement("li");
  let deleteSpan = document.createElement("span");
  let deleteIcon = document.createElement("i");
  let editSpan = document.createElement("span");
  let editIcon = document.createElement("i");

  li.classList.add("noteItem");

  deleteIcon.classList.add("fas", "fa-trash")
  deleteSpan.appendChild(deleteIcon);
  deleteSpan.classList.add("deleteIcon");

  editIcon.classList.add("fas", "fa-edit")
  editSpan.appendChild(editIcon);
  editSpan.classList.add("editIcon");

  list.appendChild(li).append(input, deleteSpan, editSpan);

  console.log("Created Note with Value", input)

  addListeners();
}


function addListeners() {
  
  spans = Array.from(document.getElementsByClassName("noteItem"));
  for(let [i, span] of spans.entries() ){
    span.addEventListener("click", function() {
      deleteNote(i)
    }
    );
  }
}

function deleteNote(i)
{
  let notes = retrieveNotes();
  notes.splice(i,1)
  localStorage.setItem('notes', JSON.stringify(notes));
  console.log("Deleted Note", i);
  displayNotes()
}

function addNote() {
  let input = document.getElementById("newItemInput").value;

  if (input === '') {
      alert("Text Field Cannot Be Empty");
      return;
    }
  document.getElementById("newItemInput").value = "";

  let notes = retrieveNotes();  
  notes.push(input);
  localStorage.setItem('notes', JSON.stringify(notes));

  console.log("Created Note with Value", input);

  displayNotes()

}

function displayNotes()
{
  let notes = retrieveNotes();
  let list = document.getElementById("notesList");
  list.innerHTML = '';

  for(let note of notes)
  {

    let icon  = document.createElement("i");
    icon.classList.add("fas", "fa-trash");
    let span = document.createElement("span");
    span.classList.add("noteItem")
    span.append(icon);


    let noteItem = document.createElement("li");
    list.appendChild(noteItem).append(note, span);

  }

  addListeners();
}

function retrieveNotes(){
  let notesJson = localStorage.getItem('notes');
  notes = [];
  if(notesJson !== null)
  {
    notes = JSON.parse(notesJson);
  }

  return notes;
}