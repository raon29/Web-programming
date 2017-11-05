$(document).ready(function(){

		$.ajax({

type:"POST",
url:"list_action.jsp",
dataType:"JSON",

success:function(data){


var table = $("#u_list");

if(data.length == 0){
var tr = $("<tr></tr>");
var td1 = $("<td></td>").text("글이 존재하지 않습니다");
td1.attr("colspan","3");
tr.append(td1);
table.append(tr);
}

for( var i = 0; i < data.length; i++ ){
var tr = $("<tr></tr>");
var td1 = $("<td></td>").text(i+1);
var a = $("<a></a>").text(data[i].title);
var td2 = $("<td></td>");
var td3 = $("<td></td>").text(data[i].date);

a.attr("href","content.jsp?title="+data[i].title);
tr.append(td1);
td2.append(a);
tr.append(td2);
tr.append(td3);
table.append(tr);
}

},
error:function( xhr, status, error ){
	      conlose.log(xhr + "\n" + status + "\n" + error);
      }
});	

});





