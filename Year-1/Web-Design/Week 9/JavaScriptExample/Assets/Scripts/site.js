var firstname = "Arthur";
var lastname = "Coll";
var age = 10;

function displayname() {
	var message = "The users name is: ";
	var fullname = firstname + " " + lastname;
	message = message + fullname;
	document.write(message);
}

function niteclub() {
	if (age  > 17)
	{ 
document.write("Welcome to de club");
	}

	else{
		document.write("We don't serve your kind here");
		}
}

function displaynamemulti()
{
	var message = "Happy Birthday ";
	var fullname = firstname + lastname;
	message = message + fullname + "<br>";
	
	for (i=0; i < age; i++)
	{
		document.write(message);
	}
	
	
	
}

pictures = new Array(5);
pictures[0] = "pict1.jpg";
pictures[1] = "pict2.jpg";
pictures[2] = "pict3.jpg";
pictures[3] = "pict4.jpg";
pictures[4] = "pict5.jpg";

function displaypic()
{
	for(i=0; i < pictures.length; i++)
	{ 
	document.write(pictures[i] + "<br>");
	}

}

function changename()
{
	document.getElementById("name").innerHTML = "Johnny";
}
