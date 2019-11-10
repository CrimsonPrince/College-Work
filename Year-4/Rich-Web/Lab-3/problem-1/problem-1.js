const source = fromEvent(document, 'click');
//map to string with given event timestamp
const example = source.pipe(map(event => `Event time: ${event.timeStamp}`));
//output (example): 'Event time: 7276.390000000001'
const subscribe = example.subscribe(val => console.log(val));

(function(){
  
  let  list = document.querySelector('#list');
  let  form = document.querySelector('#add');
  let  item = document.querySelector('#item');
  
  form.addEventListener('submit', function(e) {
    addNote(e);
  })



  function store() {
    window.localStorage.myitems = list.innerHTML;
    getValues();
  }
  
  function getValues() {
    var storedValues = window.localStorage.myitems;
    if(!storedValues) {
      list.innerHTML = "";
    }
    else{
      list.innerHTML = storedValues; 
    }
      addListeners();
  }

  function addListeners()
  {
    let deleteButtons = document.querySelectorAll('.deleteButton');
    let deleteButtonItems = [].slice.call(deleteButtons);
  
    deleteButtonItems.forEach(function (item) {
      item.addEventListener('click', function (e) {
          removeNote(e);
      });
  });

    let editButtons = document.querySelectorAll('.editButton');
    let editButtonItems = [].slice.call(editButtons);
  
    editButtonItems.forEach(function (item) {
      item.addEventListener('click', function (e) {
          editNote(e);
      });
  });
  }

  function addNote(e){
    if(item.value === "") { return; }
    e.preventDefault();
    list.innerHTML += '<li>' + item.value + '<input type="button" class="editButton" value="Edit">' + '<input type="button" class="deleteButton" value="Delete">' + '</li>';
    store();
    item.value = "";
  }

  

  function removeNote(e){
    var t = e.target;
    t = t.parentNode;
    t.parentNode.removeChild(t);
    store();
  }

  function editNote(e) {
    var t = e.target;
    t.parentNode.contentEditable = "true"
    t.addEventListener('submit', function(e) {
    
      store();
    })
    
  }

  getValues();

  
})();

