let  form = document.querySelector('form');
let name = document.querySelector('#name');
let number = document.querySelector('#number');
let email = document.querySelector('#email');

class Contact {
    constructor() {
        this.name = name.value;
        this.number = number.value;
        this.email = email.value;
    }

    row() {
        document.createElement
    }
}


form.addEventListener('submit', function(e) {
    console.log("Hi");
    let contact = new Contact();
    console.log(contact);
  })