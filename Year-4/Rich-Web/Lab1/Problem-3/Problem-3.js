// document.getElementById("red").addEventListener('click',addNote);

// function addListeners() {
  
//   spans = Array.from(document.getElementsByClassName("noteItem"));
//   for(let [i, span] of spans.entries() ){
//     span.addEventListener("click", function(e) {
//       editNote(i)
//     }
//     );
//   }
// }

// function deleteNote(i)
// {
//   let notes = retrieveNotes();
//   notes.splice(i,1)
//   localStorage.setItem('notes', JSON.stringify(notes));
//   console.log("Deleted Note", i);
//   displayNotes()
// }

// function addNote(e) {
//   let input = document.getElementById("newItemInput").value;

//   if (input === '') {
//       alert("Text Field Cannot Be Empty");
//       return;
//     }
//   document.getElementById("newItemInput").value = "";

//   let notes = retrieveNotes();  
//   notes.push(input);
//   localStorage.setItem('notes', JSON.stringify(notes));

//   console.log("Created Note with Value", input);

//   displayNotes(e)

// }

// function displayNotes(e)
// {
//   let notes = retrieveNotes();
//   console.log(e);
//   for(let note of notes)
//   {
//   var div = document.createElement('div');
//   var textArea = document.createElement("textarea");
//   var button = document.createElement("button");
//   div.setAttribute('id', 'textDiv');
//   textArea.setAttribute("id", "card");
//   button.textContent = note;
//   button.setAttribute("id", "deleteButton");
//   button.setAttribute('onclick', 'removeParent(event)')
//   div.appendChild(button);
//   div.appendChild(textArea);
//   document.getElementById("main").appendChild(div);
//   }
//   // let list = document.getElementById("notesList");
//   // list.innerHTML = '';

//   // for(let note of notes)
//   // {

//   //   let icon  = document.createElement("i");
//   //   icon.classList.add("fas", "fa-trash");
//   //   let span = document.createElement("span");
//   //   span.classList.add("noteItem")
//   //   span.append(icon);

//   //   let noteItem = document.createElement("li");
//   //   list.appendChild(noteItem).append(note, span);

//   // }

//   addListeners();
// }
// function removeParent(e){
//   e.target.parentElement.remove();
// }

// function retrieveNotes(){
//   let notesJson = localStorage.getItem('notes');
//   notes = [];
//   if(notesJson !== null)
//   {
//     notes = JSON.parse(notesJson);
//   }

//   return notes;
// }

// function editNote(i)
// {
//   let liElement = document.getElementsByTagName("li");
//   let element = liElement[i];
//   let input = document.createElement("input");
//   input.type = "text";
//   element.replaceWith(input)
// }


(function(){
  
  let  list = document.querySelector('#list');
  let    form = document.querySelector('form');
    let  item = document.querySelector('#item');
  
  form.addEventListener('submit', function(e) {
    addNote(e);
  })
  
  list.addEventListener('click',function(e){
    var t = e.target;
    t.parentNode.removeChild(t);
    
    t.classList.add('checked');
    
    store();
  },false)
  
  function store() {
    window.localStorage.myitems = list.innerHTML;
  }
  
  function getValues() {
    var storedValues = window.localStorage.myitems;
      list.innerHTML = storedValues;

  }

  function addNote(e){
    e.preventDefault();
    list.innerHTML += '<li>' + item.value + '</li>';
    store();
    item.value = "";
  }

  getValues();
})();

