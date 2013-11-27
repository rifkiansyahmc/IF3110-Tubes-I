<%-- 
    Document   : test
    Created on : Nov 26, 2013, 5:33:06 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script>
function form_making(){
localStorage.id = document.getElementById("id").value;
localStorage.pass =document.getElementById("pass").value;
//lakukan koneksi ke server
		var xmlhttp;
		if (window.XMLHttpRequest){
			// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp=new XMLHttpRequest();
		 }
		else{
		// code for IE6, IE5
			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange=function(){
			if (xmlhttp.readyState==4 && xmlhttp.status==200){
				//window.opener.document.getElementById("test").innerHTML=xmlhttp.responseText;
				var temp = xmlhttp.responseText;
				var hasil = JSON.parse(temp);
				localStorage.IsLogin = hasil.login;
				localStorage.data = hasil.data;
				var datasplit = data.split(",");
				if (datasplit[8] == 0){
					localStorage.IsKredit = 1;
				}else{
					localStorage.IsKredit = 0;
				}
				//window.alert(localStorage.IsLogin);
			}
		}
		xmlhttp.open("POST","Login.php",false);
		xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		var data ='id='+localStorage.id+'&pass='+localStorage.pass;
		xmlhttp.send(data);
		//window.alert("jumlah i "+temp);
		if(localStorage.IsLogin==0){
			//localStorage.IsLogin = true;
			window.opener.GlobalUpdateFunction();
			window.close();
		}
		else{
			window.alert("Id/Password Salah");
		}
}
function close_form(){
localStorage.removeItem(id);
localStorage.removeItem(pass);
window.close();
}
</script>
</head>
<body>
<form>
ID  	 : <input type="text" name="ID" id="id"><br>
Password :<input type="password" name="Password" id="pass">

</form>
<button type="button" onclick="form_making()">Login</button>
<button type="button" onclick="close_form()">Cancel</button>

</body>
</html>
