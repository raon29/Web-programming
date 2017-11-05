var radio_num = 0;
var car_count = 0;
var maxcar = 10; 
var parkcar = 0; 
var maxparkcar = 120;
var carlist ={};
var car_id; 

function car(made,type,price,size){
	this.made = made;
	this.type = type;
	this.price = price;
	this.size = size;
	this.state = "출고";
}

function get_made(get_car){
	return get_car.made;
}
function get_type(get_car){
	return get_car.type;
}
function get_price(get_car){
	return get_car.price;
}
function get_size(get_car){
	return get_car.size;
}
function get_state(get_car){
	return get_car.state;
}

function clicks(listid){
	car_id = listid;
	carlist = document.getElementById(listid).childNodes;
	document.getElementById("productor").value = carlist[1].innerHTML;
	document.getElementById("carType").value = carlist[2].innerHTML;
	document.getElementById("carPrice").value = carlist[3].innerHTML;
	document.getElementById("carSize").value = carlist[4].innerHTML;
}

function register_Car(){
	var made = document.getElementById("productor").value; 
	var c_type = document.getElementById("carType").value; 
	var price = document.getElementById("carPrice").value; 
	var size = document.getElementById("carSize").value; 
	if(made.length == 0)
		alert("제조사를 입력안해서 샤샤샤.");
	else if(c_type.length == 0)
		alert("차종을 입력안해서 샤샤샤");
	else if(price.length == 0)
		alert("가격을 입력안해서 샤샤샤.");
	else if(price.match(/[^0-9]/))
		alert("가격은 숫자로만 입력해 돼서 샤샤샤.");
	else if( size ==="크기 선택")
		alert("크기를 입력 안해서 샤샤샤");
	else{
		if(car_count>=maxcar){
			alert("더 이상 등록할 수 없어서샤샤샤");
		}else{
			var ArrayCar = new Array();
			Car = new car(made,c_type,price,size);
			ArrayCar.push(Car);

			for(var i =0; i<ArrayCar.length; i++){
				radio_num++;
				var _tr = document.createElement("tr");
				_tr.setAttribute("id","list"+radio_num);
				var _td1 = document.createElement("td");
				var _input = document.createElement("input");
				_input.setAttribute("type","radio");
				_input.setAttribute("name","selectCar");
				_input.setAttribute("class","carCheck");
				_input.setAttribute("value","car1");
				_input.setAttribute("onclick","clicks('list"+radio_num+"')");
				var _td2 = document.createElement("td");
				_td2.innerText = get_made(Car);
				var _td3 = document.createElement("td");
				_td3.innerText = get_type(Car);
				var _td4 = document.createElement("td");
				_td4.innerText = get_price(Car);
				var _td5 = document.createElement("td");
				_td5.innerText = get_size(Car);
				var _td6 = document.createElement("td");
				_td6.innerText = get_state(Car);
				_td1.appendChild(_input);
				_tr.appendChild(_td1);
				_tr.appendChild(_td2);
				_tr.appendChild(_td3);
				_tr.appendChild(_td4);
				_tr.appendChild(_td5);
				_tr.appendChild(_td6);
				var tables = document.getElementById("carList");
				tables.appendChild(_tr);	
			}
			car_count++;
			document.getElementById("car_count").innerHTML="등록 차량 수 : "+car_count+" 대";
		}
	}	
}

function delCar(){
	if(car_id === undefined){
		alert("차량을 선택안해서 샤샤샤");
	}
	else{
		
		var table = document.getElementById("carList");
		var tr = document.getElementById(car_id);
		var td = document.getElementById("td");
		if(tr.lastChild.innerText=="입고"){
			parkcar--;
			document.getElementById("car_park").innerHTML="입고 차량 수 : "+parkcar+" 대";
			}
		table.removeChild(tr);
		car_count--;
		car_id = undefined;
		document.getElementById("car_count").innerHTML="등록 차량 수 : "+car_count+" 대";
	}
}


function incar(){
	if(car_id === undefined){
		alert("차량을 선택안해서 샤샤샤");
		return;
	}else if(parkcar == maxparkcar){
		alert("주차장이 꽉차서 샤샤샤");
		return;
	}else{
		for(var i = 0; i<carlist.length;i++){
			 if(carlist[i].innerHTML ==="입고"){
				 alert("이미 입고중이라 샤샤샤");
			 }
			 if(carlist[i].innerHTML ==="출고"){
				 carlist[i].innerHTML = "입고";
				 parkcar++;
				 document.getElementById("car_park").innerHTML="입고 차량 수 : "+parkcar+" 대";
			 }
		}
	}
	
}

function outcar(){
	if(car_id === undefined){
		alert("차량을 선택안해서 샤샤샤");
	}else{
		for(var i = 0; i<carlist.length;i++){
			 if(carlist[i].innerHTML ==="출고"){
				 alert("이미 출고중이랴 샤샤샤");
			 }
			 if(carlist[i].innerHTML ==="입고"){
				 carlist[i].innerHTML = "출고";
				 parkcar--;
				 document.getElementById("car_park").innerHTML="입고 차량 수 : "+parkcar+" 대";
			 }
		}
	}
}

