var num1=0,num2=0;
var result=0; 
var calcul=0; 
function command(num){ 
	var str=String(document.calculator.numScreen.value); 
	str = (str!="0")?str:"";
	str = str + String(num); 
	document.calculator.numScreen.value=str; 
	
} 


function dot(){ 
	var str=String(document.calculator.numScreen.value); 
	str=(str!="0") ? str : "0"; 
	for(i=0; i<=str.length;i++){ 
	if(str.substr(i,1)==".") return false; 
	} 
	str=str + "."; 
	document.calculator.numScreen.value=str; 
} 

function del(){ 
	var str=String(document.calculator.numScreen.value); 
	str=(str!="0") ? str : ""; 
	str=str.substr(0,str.length-1); 
	str=(str!="") ? str : "0"; 
	document.calculator.numScreen.value=str; 
} 

function clearScreen(){ 
	num1=0;
	num2=0;
	count_num=0;
	calcul=0; 
	result=0; 
	document.calculator.numScreen.value="0"; 
	document.calculator.oldNumScreen.value="0";
} 

function plus(){	
	//처음 들어온 숫자
	if(document.calculator.oldNumScreen.value == "0"){
		num1 = document.calculator.numScreen.value;
		document.calculator.oldNumScreen.value = num1 + "+";	
	}
	//이미 숫자가 있을 때
	else if(document.calculator.numScreen.value == "0") {
		num1 = document.calculator.oldNumScreen.value;
		document.calculator.oldNumScreen.value +=  "+";
	}
	//여러번 연산
	else if(document.calculator.numScreen.value != result){
		num2 = document.calculator.numScreen.value;
		document.calculator.oldNumScreen.value += num2 + "+";
		calculate(num1*1.0, num2*1.0);
		num1 = result;
	}
	//history 불러왔을 때
	else{
		num1 = result;
		document.calculator.oldNumScreen.value = num1 + "+";
	}
	calcul=1;
	document.calculator.numScreen.value = "0";
	
}
 
function minus(){
	//처음 들어온 숫자
	if(document.calculator.oldNumScreen.value == "0"){
		num1 = document.calculator.numScreen.value;
		document.calculator.oldNumScreen.value = num1 + "-";	
	}
	//이미 숫자가 있을 때
	else if(document.calculator.numScreen.value == "0") {
		num1 = document.calculator.oldNumScreen.value;
		document.calculator.oldNumScreen.value +=  "-";
	}
	//여러번 연산
	else if(document.calculator.numScreen.value != result){
		num2 = document.calculator.numScreen.value;
		document.calculator.oldNumScreen.value += num2 + "-";
		calculate(num1*1.0, num2*1.0);
		num1 = result;
	}
	//history 불러왔을 때
	else{
		num1 = result;
		document.calculator.oldNumScreen.value = num1 + "-";
	}
	document.calculator.numScreen.value = "0";
	calcul=2;
}
 
function times(){  
	//처음 들어온 숫자
	if(document.calculator.oldNumScreen.value == "0"){
		num1 = document.calculator.numScreen.value;
		document.calculator.oldNumScreen.value = num1 + "*";	
	}
	//이미 숫자가 있을 때
	else if(document.calculator.numScreen.value == "0") {
		num1 = document.calculator.oldNumScreen.value;
		document.calculator.oldNumScreen.value +=  "*";
	}
	//여러번 연산
	else if(document.calculator.numScreen.value != result){
		num2 = document.calculator.numScreen.value;
		document.calculator.oldNumScreen.value += num2 + "*";
		calculate(num1*1.0, num2*1.0);
		num1 = result;
	}
	//history 불러왔을 때
	else{
		num1 = result;
		document.calculator.oldNumScreen.value = num1 + "*";
	}
	document.calculator.numScreen.value = "0";
	calcul=3;
}
 
function divide(){ 
	//처음 들어온 숫자
	if(document.calculator.oldNumScreen.value == "0"){
		num1 = document.calculator.numScreen.value;
		document.calculator.oldNumScreen.value = num1 + "/";	
	}
	//이미 숫자가 있을 때
	else if(document.calculator.numScreen.value == "0") {
		num1 = document.calculator.oldNumScreen.value;
		document.calculator.oldNumScreen.value +=  "/";
	}
	//여러번 연산
	else if(document.calculator.numScreen.value != result){
		num2 = document.calculator.numScreen.value;
		document.calculator.oldNumScreen.value += num2 + "/";
		calculate(num1*1.0, num2*1.0);
		num1 = result;
	}
	//history 불러왔을 때
	else{
		num1 = result;
		document.calculator.oldNumScreen.value = num1 + "/";
	}
	document.calculator.numScreen.value = "0";		
	calcul=4;
} 


 
 
function calculate(num1,num2){ 
	
	switch(calcul){  
		case 1:result=num1+num2;break; 
		case 2:result=num1-num2;break; 
		case 3:result=num1*num2;break; 
		case 4:if(num2!=0){result=num1/num2;}
			else{
				alert("0으로나눌수없습니다.");
				clearScreen();
				document.calculator.oldNumScreen.value = ""; 
				setTimeout(clearnote,4000)
			}break; 
		case 5:result=num1%num2;break;  
	} 
	
}


function convertion(){
	if(document.calculator.oldNumScreen.value == "0"){
		num1 = document.calculator.numScreen.value*(-1.0);
		document.calculator.numScreen.value = num1;
	}
	else{
		num2 = document.calculator.numScreen.value*(-1.0);
		document.calculator.numScreen.value = num2;
	}
}

var j=0;

function equal(){ 
	
	var a = "";
	var b = "";
	if(document.calculator.numScreen.value=="0"){
		num1 = result;	
		var o = "";
		switch(calcul){
			case 1: o = "+";
				break;
			case 2: o = "-";
				break;
			case 3: o = "*";
				break;
			case 4: o = "/";
				break;
		}
		a = document.calculator.oldNumScreen.value + o;
	}

	else{
		num2 = document.calculator.numScreen.value;
		a = document.calculator.oldNumScreen.value;
	}
	b = num2;
 	calculate(num1*1.0,num2*1.0);
	document.calculator.numScreen.value="0";
	document.calculator.oldNumScreen.value = result;
	
	var c = a + b + "=" + String(result);

	
	var _li;
	
	var element1 = document.getElementById("history_1").childNodes;
	var element2 = document.getElementById("history_1");
	for(var i = 0; i<element1.length;i++){
		j++;
		if(element1[i]!="li"){

			_li = document.createElement("li");
			_li.style.cssText="list-style-type:none;";
			_li.setAttribute("id","data"+j);
			_li.setAttribute("onclick","clicfunction('data"+j+"')");
			
			element2.appendChild(_li);
			
			_li.innerHTML=c;
			
			break;
		}
	}
}

function clicfunction(dataID){
	
	var a = document.getElementById(dataID).innerHTML;
	var temp = a.split('=');
	document.calculator.oldNumScreen.value = temp[0];
	document.calculator.numScreen.value = temp[1];
	result = temp[1];

}