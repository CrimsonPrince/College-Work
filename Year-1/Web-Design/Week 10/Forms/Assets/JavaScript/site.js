var questions = [];
var answers = [];

questions[0] = "Who is the flash";
answers[0] = "Barry Aleen";

questions[1] = "Question 2";
answers[1] = "Answer2";

questions[2] = "Question3";
answers[2] = "Answer3";

var currentQuestion;

function setQuestion(questionNumber){
	currentQuestion = questionNumber;
	document.getElementById("Question").innerHTML = questions[questionNumber];
}

function checkAnswer(){
	var tmpAnswer = document.getElementById("answer").value;
	alert(tmpAnswer);
	
}

function checkAnswer()
{
	var tmpAnswer = document.getElementById("Answer").value;
	if ( tmpAnswer == answer[currentQuestion])
	{
		document.getElementById(correct).innerHTML = "Correct";
	}
	else{
		document.getElementById("correct").innerHTML = "Wrong";
	}
}