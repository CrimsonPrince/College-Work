function addItem() {

    var input = document.getElementById("newItemInput").value;

    if (input === '') {
        alert("Text Field Cannot Be Empty");
        return;
      }

  var li = document.createElement("li");
  var text = document.createTextNode(input);
  li.appendChild(text);
  document.getElementById("newItemInput").value = "";
  document.getElementById("listDisplay").appendChild(li);

}