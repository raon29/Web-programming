
var t;
var count = 1;
var correct = 0;
var c_array = new Array();
var storage = window.localStorage;
var time = new Array();
var key = 0;
var tempArray = new Array();
var rankArray= new Array();

//Drag & Drop
function allowDrop(ev) {
    ev.preventDefault();
}

function drag(ev) {
    ev.dataTransfer.setData("text", ev.target.id);
    ev.dataTransfer.setData("src", ev.target.src);
    curEv = ev;
}

function drop(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    var section = ev.target.id;
    
    if(ev.target.tagName != "TD"){
    	var src = ev.dataTransfer.getData("src");
    	tempEv = ev;
    	curEv.target.src = tempEv.target.src;
		ev.target.src = src;
    }
    else{
    	ev.target.appendChild(document.getElementById(data));
    }
   
	var end = gameover();

	if(end){
		timeStop();

		var endtime = parseInt(document.getElementById("time").innerHTML);
		
		storage.setItem(storage.length+1, endtime);
			 
		for(var z = 0; z <= storage.length; z++){
			tempArray[z] = storage[z];
		}

		tempArray.sort(function(x, y){ 
			return x - y; 
		});
		showRank();
		count = 1;
		alert("성공");
		document.getElementById("start_stop").innerHTML = "시작";
		remove();
		
	}
}


function game_start(){

	var start_stop = document.getElementById("start_stop");
	if(start_stop.innerHTML == "시작"){
		start_stop.innerHTML = "정지";
		randShow();
		timeCount();
	}
	else if(start_stop.innerHTML == "정지"){
		alert(temp);
		game_stop();
	}
	else{
		restart();
	}
}

//랜덤된 그림 보여줌
function randShow(){
	
	var arr = new Array();
	for(var i=1; i < 17; i++){
		arr.push(i);
	}
	arr.sort(function(){return 0.5-Math.random()});

	var td, tr, img;
	for(var i=1; i<5; i++){
		for(var j=1; j<5; j++){
			//동적으로 퍼즐 rand하게 생성
			tr = document.getElementById("tr"+i);
			td = document.createElement('td');
			td.setAttribute('id', 'td'+ ((i-1)*4+j));
			td.setAttribute('ondrop','drop(event)');
			td.setAttribute('ondragover','allowDrop(event)');
			img = document.createElement('img');
			img.src = './images/puzzleImg_'+arr[(i-1)*4+j-1]+'.jpg';
			img.setAttribute('id', 'img'+arr[(i-1)*4+j-1]);
			img.setAttribute('draggable','true');
			img.setAttribute('ondragstart','drag(event)');
			tr.appendChild(td);
			td.appendChild(img);
		}
	}
}

function game_stop(){
		document.getElementById("start_stop").innerHTML = "다시시작";
		timeStop();
		//drag 금지
		for(var i=0; i <16; i++){
			var temp = document.getElementById('img'+(i+1));
			temp.setAttribute('draggable','false');
		}
}

function restart(){
	document.getElementById("start_stop").innerHTML = "정지";
	timeCount();
	//drag 사용
	for(var i=0; i <16; i++){
		var temp = document.getElementById('img'+(i+1));
		temp.setAttribute('draggable','true');
	}
}

function gameover(){
	
	for(var i = 0; i < 16; i++){
		var img = document.getElementById('td'+(i+1));
		img = img.childNodes[0].getAttribute("src");
		var img_arr = img.split('_');
		temp = (i+1)+".jpg";
		if( temp != img_arr[1] ){
			return false;	
		}
	}
	return true;
}

function remove(){
	for(var i=1; i<5; i++){
		for(var j=1; j<5; j++){
			var tr = document.getElementById("tr"+i);
			var td = document.getElementById("td"+((i-1)*4+j));
			tr.removeChild(td);

		}
	}
}


function timeCount(){
	document.getElementById("time").innerHTML = count;
	count++;
	t = setTimeout("timeCount()",1000);	 
}


function showRank(){
					
	for (var u = 0; u < 10; u++){

		var td = document.getElementById("r"+(u+1));
		
		if(tempArray[u] == undefined){
			td.innerHTML = 0;
		}
		else{
			td.innerHTML = tempArray[u];
		}
	}
}


function timeStop(){
	clearTimeout(t);
}


function resetStorage(){
	var i = 0;
	storage.clear();
	for(i=0; i<10; i++){
		var td = document.getElementById("r"+(i+1))
		td.innerHTML = 0;
	}
	tempArray = new Array();
}
