let token = "2f7a36c0a4db21f9bf7f25de5d4d00988edbbba7";
let headers = { "Content-Type": "application/json", "Authorization": `Token ${token}` };

async function getUserAsync(name) {
    try {
        let response = await fetch(`https://api.github.com/users/${name}`, { headers, });
        return await response.json();
    } catch (err) {
        console.error(err);
    }
}

async function getRepositoryAsync(name) {
    try {
        let response = await fetch(`https://api.github.com/users/${name}/repos`);
        return await response.json();
    } catch (err) {
        console.error(err);
    }
}

function displayUser(data) {
    document.querySelector('#avatar').src = data.avatar_url;
    document.querySelector('#name').innerHTML = data.name;
    document.querySelector('#username').innerHTML = data.login;
    document.querySelector('#emailDiv').innerHTML = data.email;
    document.querySelector('#location').innerHTML = data.location;
    document.querySelector('#gists').innerHTML = data.public_gists;
}

function displayRepos(data) {
    let repoInfo = document.querySelector("#repoInfo");
    data.forEach(function(repo) {
        let repository = document.createElement("div");
        repository.innerHTML = repo.name;
        repoInfo.appendChild(repository);
    });
}

getUserAsync('scottdono')
    .then(data => displayUser(data));

getRepositoryAsync('scottdono')
    .then(datas => displayRepos(datas));