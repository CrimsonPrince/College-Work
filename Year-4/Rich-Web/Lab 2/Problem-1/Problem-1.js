let form = document.querySelector('form');
let name = document.querySelector('#name');
let number = document.querySelector('#number');
let email = document.querySelector('#email');
let tableBody = document.querySelector('tbody');
let table = document.querySelector('table');
let sorted = -1;
let searchBar = document.querySelector("#search");

class Contact {
  constructor() {
    this.name = name.value;
    this.number = number.value;
    this.email = email.value;
    name.value = "";
    number.value = "";
    email.value = "";
  }
}


form.addEventListener('submit', function (e) {
  if(validateInput()) { addContact(); }
})

searchBar.addEventListener('keyup', function (e) {
  search();
})

function validateInput() {

  if(email.value.length > 40 || !/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(email.value)) {
    console.log("Please enter a  valid email");
    return false
  }
  if(name.value.length > 20 || !/^[a-z\s]*$/.test(name.value))
  {
    console.log("Please Enter a valid Name");
    return false;
  }
  console.log(number.value.length)
  if(number.value.length > 10 || number.value.length < 10)
  {
    console.log("Please Enter Valid Phone Number")
    return false;
  }
  return true;

}

function sortTable() {
  contacts = retrieveContacts();
  contacts.sort((a, b) => a.name.toLowerCase().localeCompare(b.name.toLowerCase()) * sorted);
  localStorage.setItem("contacts", JSON.stringify(contacts));
  sorted = (sorted == -1) ? 1 : -1;
  displayTable();
}

function displayTable() {
  tableBody.innerHTML = "";
  let contacts = retrieveContacts();
  contacts.forEach(function(element, i) {
    tableBody.appendChild(toTableRow(element, i)); 
  });
}

function addContact() {
  let contact = new Contact();
  let contacts = retrieveContacts();
  contacts.push(contact)
  localStorage.setItem("contacts", JSON.stringify(contacts));
  displayTable();
}

function retrieveContacts() {
  let contacts = JSON.parse(localStorage.getItem("contacts"));
  if (contacts === null) {
    contacts = [];
  }
  return contacts;
}

function toTableRow(contact, i) {
  let row = document.createElement("tr");
  let nameCol = document.createElement("td");
  let numberCol = document.createElement("td");
  let emailCol = document.createElement("td");
  nameCol.innerHTML = contact.name;
  numberCol.innerHTML = contact.number;
  emailCol.innerHTML = contact.email;
  row.append(nameCol, numberCol, emailCol);
  if(i == 2) { row.setAttribute("style", "background-color:#f2f2f2;"); }
  return row;
}

function search() {
  let tr, td;
  tr = table.querySelectorAll("tr");
  for (let i = 0; i < tr.length; i++) {
    td = tr[i].querySelectorAll("td")[1];
    if (td) {
      if (td.textContent.indexOf(searchBar.value) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }
  }
}

displayTable();