
function buysome( num ){

var price = document.getElementById("price"+num).textContent;
var point = document.getElementById("point").textContent;

price = price.replace(/[^0-9]/g,'');

var b = (parseInt(price) <= parseInt(point));

if(b){
	document.getElementById("myform"+num).submit();
}

else{ alert("포인트가 부족합니당"); }

}


function cancel(){

	if(confirm("구매 취소???") == true){
		document.getElementById("tableList").submit();
	}
	else{ location.href = "useList";}

}



