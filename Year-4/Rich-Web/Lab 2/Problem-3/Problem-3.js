let token = "71ca45af9396e9169fa75c17467b561f6e41460f";
let headers = { "Content-Type": "application/json", "Authorization": `Token ${token}` };
let form = document.querySelector('form');
let input = document.querySelector('#input');

form.addEventListener('submit', function (e) {
    getUserAsync(input.value)
        .then(data => displayUser(data));

    getRepositoryAsync(input.value)
        .then(data => displayRepositories(data));
})

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
    document.querySelector('#email').innerHTML = data.email;
    document.querySelector('#location').innerHTML = data.location;
    document.querySelector('#gists').innerHTML = data.public_gists;
}

function displayRepositories(data) {
    let repoInfo = document.querySelector("#repoInfo");
    repoInfo.innerHTML = "";
    data.forEach(function (repo) {
        let repository = document.createElement("div");
        repository.innerHTML = repo.name;
        repoInfo.appendChild(repository);
    });
}