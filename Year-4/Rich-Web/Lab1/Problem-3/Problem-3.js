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
  
  for(let span of deleteIcons){
    span.addEventListener ("click",function (){
      span.parentElement.remove();
      event.stopPropagation();
    });
  }

  for(let span of editIcons){
    span.addEventListener ("click",function (){
      span.parentElement.addItem;
      event.stopPropagation();
    });
  }
}

function deleteItem(value)
{
  console.log("Delete Item", value);
  let notesList = document.getElementsByClassName("noteItem");
  let element = notesList[1];
  console.log("Deleting Task", element.TEXT_NODE)
}

