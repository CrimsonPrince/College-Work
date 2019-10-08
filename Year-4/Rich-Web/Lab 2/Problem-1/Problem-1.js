let  form = document.querySelector('form');
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


form.addEventListener('submit', function(e) {
    addContact();
  })

searchBar.addEventListener('keyup', function(e) { 
    search();
})

function sortTable()
{
    contacts = retrieveContacts();
    contacts.sort((a, b) => a.name.toLowerCase().localeCompare(b.name.toLowerCase()) * sorted);
    localStorage.setItem("contacts", JSON.stringify(contacts));
    sorted = (sorted == -1)? 1 : -1; 
    displayTable();
}

function displayTable() {
    tableBody.innerHTML = "";
    let contacts = retrieveContacts();
    contacts.forEach(element => {
        tableBody.appendChild(toTableRow(element));
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
    if( contacts === null) { 
        contacts = [];
    }
    return contacts;
}

function toTableRow(contact) {
    let row = document.createElement("tr");
    let nameCol = document.createElement("td");
    let numberCol = document.createElement("td");
    let emailCol = document.createElement("td");
    nameCol.innerHTML = contact.name;
    numberCol.innerHTML = contact.number;
    emailCol.innerHTML = contact.email;
    row.append(nameCol, numberCol, emailCol);
    return row;
}

function search() {
    let tr, td, i, txtValue;
    tr = table.querySelectorAll("tr");
  
    for (i = 0; i < tr.length; i++) {
      td = tr[i].querySelectorAll("td")[1];
      if (td) {
        txtValue = td.textContent || td.innerText;
        if (txtValue.indexOf(searchBar.value) > -1) {
          tr[i].style.display = "";
        } else {
          tr[i].style.display = "none";
        }
      }
    }
  }

displayTable();