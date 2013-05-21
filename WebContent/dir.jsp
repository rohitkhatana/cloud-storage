<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>create directory</title>

<style>
#tow{
display:none;
}</style>
<script type="text/javascript">
function showDiv() {
    div = document.getElementById('tow');
    div.style.display = "block";
    link("/newfile.jsp")
}
function link1(st){
	
	var body = document.getElementById("body");
	var a = document.createElement("a");
	var txt = document.createTextNode("downlaod");
	a.appendChild(txt);
	a.href = st; 
	alert(a.href);
	document.write("<a href='"+st+"'>sadas</a>");
	body.appendChild("a");
}
var _hidediv = null;
function showdiv(id) {
    if(_hidediv)
        _hidediv();
    var div = document.getElementById(id);
    div.style.display = 'block';
    _hidediv = function () { div.style.display = 'none'; };
}
</script>

</head>
<body>

<div id="one">
    <div id="tow">
       <table><tr><td>Name of directory </td><td><input type="text" name="dname"></td></tr></table>
    </div>
    <button onclick="javascript:link1('you.jsp');">create directory</button>
</div>

</body>
</html>