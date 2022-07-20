//alert(1);

/*	{
	let letVariable = "This is let variable";
	alert(letVariable);
	letVariable = "This is let variable new";
	}
	*/
	
	
function ChangeContent(){
	var divJs = document.getElementById("divJs");
	divJs.innerHTML = "Changed";
}
	
function ShowComparison(){
	let x = 5;
	var divJs = document.getElementById("divJs");
	
	//divJs.innerHTML = "x === 5 | " + (x === "5");
	
	switch(x)
	{
		case 5:
			divJs.innerHTML = "Five";
			break;
		case 6:
			divJs.innerHTML = "Six";
			break;
		default:
			divJs.innerHTML = "koi na chale yh zaroor chale ga";
	}
}
function ForLoopExecution()
{
	const cars = ["BMW", "Volvo", "Saab", "Ford", "Fiat", "Audi"];
	let text = "";
	let aLen = cars.length;
	for (let i = 0; i < aLen; i++) {
	  text += cars[i] + "<br>";
	  console.log(i);
	}
	
	var divJs = document.getElementById("divJs");
	divJs.innerHTML = text;
	
}
function ValidateInput()
{
	var divJs = document.getElementById("divJs");
	var txtUser = document.getElementById("txtUser");
	var x = txtUser.value;
	try { 
		if(x == "")  throw "empty";
		if(isNaN(x)) throw "not a number";
		x = Number(x);
		if(x < 5)  throw "too low";
		if(x > 10)   throw "too high";
     }
	catch(err) {  
		divJs.innerHTML = "Input is " + err;
    }

}

function GetDataFromServerFile()
{
	var divJs = document.getElementById("divJs");
	const xhttp = new XMLHttpRequest(); xhttp.onload = function() {    
		divJs.innerHTML = this.responseText;    
	}  
	xhttp.open("GET", "ajax_info.txt", true);  
	xhttp.send();

}

function CheckReturn()
{
	let 
	x = 10
	let 
	y = "10"
	return x == y;
}
