const request = new Request('http://jsonplaceholder.typicode.com/posts', {method: 'GET'})

fetch(request)
  .then(response => {
    if (response.status === 200) {
      return response.json();
    } else {
      throw new Error('Something went wrong on api server!');
    }
  })
  .then(response => {
    console.log("List Of posts with more than 6 Word in the Title");
    let sixPostArray = response.filter(i => i.title.split(" ").length > 6)
    console.log(sixPostArray);

    var output = {};
    response.map(item => {item.body.split(' ').map(word => output[word]? output[word]++ : output[word] = 1) });
    console.log(output);
    
  }).catch(error => {
    console.error(error);
  });
