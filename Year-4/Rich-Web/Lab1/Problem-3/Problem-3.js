function addItem() {

    let input = document.getElementById("newItemInput").value;

    if (input === '') {
        alert("Text Field Cannot Be Empty");
        return;
      }
    document.getElementById("newItemInput").value = "";


  let list = document.getElementById("notesList")
  let li = document.createElement("li");
  let span = document.createElement("span");
  let icon = document.createElement("i");

  icon.classList.add("fas", "fa-trash")

  li.classList.add("noteItem");

  list.appendChild(li).appendChild(span, input);

}

function deleteItem(value)
{
  console.log("Delete Item", value);
  let notesList = document.getElementsByClassName("noteItem");
  let element = notesList[1];
  console.log("Deleting Task", element.TEXT_NODE)
}

