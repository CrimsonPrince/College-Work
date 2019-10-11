async function getUserAsync(name) {
    try{
      let response = await fetch(`https://api.github.com/users/${name}`);
      return await response.json();
    }catch(err){
      console.error(err);
    }
  }

async function getRepositoryAsync(name)
{
    try{
        let response = await fetch(`https://api.github.com/users/${name}/repos`);
        return await response.json();
      }catch(err){
        console.error(err);
      }
}

  getUserAsync('CrimsonPrince')
  .then(data => console.log(data) );

  getRepositoryAsync('CrimsonPrince')
  .then(datas => console.log(datas) );