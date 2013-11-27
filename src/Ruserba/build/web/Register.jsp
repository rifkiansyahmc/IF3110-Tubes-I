<%-- 
    Document   : register
    Created on : Nov 26, 2013, 5:31:02 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<!-- Head -->
<head>
<link rel="stylesheet" type="text/css" href="Registration.css">
<link rel="stylesheet" type="text/css" href="Header.css">
</head>

<!-- Body -->
<body onLoad=Initialize()>

<!-- Javascript validasi -->
<script src = "validation.js"></script>
<script>
//buat baca dari database ke diri sendiri :v
function Initialize(){
	if(localStorage.IsLogin == 0){//kalo udah login ga bisa ke sini :v
		//redirect ke halaman utama
		window.location.assign("Index.php");
	}
}

function Submit(){
//window.alert("debug awal");
	var data="";
	data ="id="+document.forms["registration"]["username"].value;
	data=data+"&email="+document.forms["registration"]["email"].value;
	data=data+"&password="+document.forms["registration"]["password"].value;
	data=data+"&fullname="+document.forms["registration"]["fullname"].value;
	data=data+"&alamat="+document.forms["registration"]["alamat"].value;
	data=data+"&provinsi="+document.forms["registration"]["provinsi"].value;
	data=data+"&kota="+document.forms["registration"]["kecamatan"].value;
	data=data+"&kodepos="+document.forms["registration"]["kodepos"].value;
	data=data+"&hp="+document.forms["registration"]["hp"].value;

	//window.alert("debug 1");
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
			var responsecode = xmlhttp.responseText;
			var response = JSON.parse(responsecode);
			//var hasil = JSON.parse(temp);
			if(parseInt(response.code)==0){
				window.alert("Registrasi Berhasil ! ");
				//pindah ke halaman awal
				localStorage.id = document.forms["registration"]["username"].value;
				localStorage.pass=document.forms["registration"]["password"].value;
				localStorage.IsLogin = 0;
				localStorage.data = response.data;
				localStorage.isCredit = 1;
				window.location.assign("CreditCard.html");
			}
			else if(response.code==1){
				window.alert("Id sudah digunakan");
			}
			else if(response.code==2){
				window.alert("email sudah digunakan");
			}
			else{
				window.alert(response.code);
			}
			
		}
	}
	xmlhttp.open("POST","Register.php",false);
	xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xmlhttp.send(data);

}

</script>
<div id = "maindiv">

<!-- HEADER -->

<!-- Script Header -->
<script src = "Header.js"></script>

<!-- Markup Header -->
<div id="homebar">

<!-- Search Bar -->
<form id = "search"> 
Search Item: <input type="search" name="search" id="searchbar" >
<select id='select'>
  <option value="name">Nama</option>
  <option value="price">Harga</option>
  <option value="category">Category</option>
</select>
<input id="searchButton" style="visibility:visible" type="button" value="Search" onclick="Search()">
</form>

<!-- Banner -->
<a href="Index.php"> <img src="/img/Placeholder.png" width="800px" height="200px"> </a>

<!-- Menubar -->
<ul id="nav">
    <li>
        <a href="index.jsp">Home</a>
    </li>

    <li>
        <a href="#">Product</a>
        <ul>
            <li><a href="search.html?category=Prototype">Prototype</a></li>
            <li><a href="search.html?category=Grunts">Grunts</a></li>
            <li><a href="search.html?category=Zeon Obsolete Units">Zeon Obsolet</a></li>
            <li><a href="search.html?category=Ver. Ka">Ver. Ka</a></li>
            <li><a href="search.html?category=Special Paint Version">Special Paint</a></li>
        </ul>
    </li>
	<li>
		<a href="cart.php">Cart</a>
	</li>
	<li id="Registah">
		<a id ='new_id' href="Register.html">Register</a>
	</li>
	<li id="loginarea">
		<input id="LoginB" type="button" value="Log in" onclick="Login()">
	</li>
</ul>

</div>

<!-- END HEADER -->

<div id = "content">
<!-- Titel -->
<h2>Registrasi Pengguna Baru</h2>

<!-- Form Pendaftaran -->
<form name= "registration" >
<span>Username:<input id='id' type="text" name="username" onchange='validate("username"); enablebutton()' required><label id = "username"></label></span><br> 
<span><br>Nama Lengkap: <input type="text" name="fullname" onchange='validate("fullname"); enablebutton()' required id="fname"> <label id = "fullname"></label></span><br> 
<span><br>Nomor Handphone:* <input type="text" name="hp" id="nohp"> <br></span>
<span><br>Email: <input type="text"id='mail' name="email" onchange='validate("email"); enablebutton()' required><label id = "email"></label></span><br>
<span><br>Alamat:* <input type="text" name="alamat"id="alamat"> <br></span>
<span><br>Provinsi:* <input type="text" name="provinsi"id="provinsi"> <br></span>
<span><br>Kota/Kabupaten:* <input type="text" name="kecamatan" id="kota"> <br></span>
<span><br>Kodepos:* <input type="text" name="kodepos"id="kodepos"> <br></span>
<span><br>Password: <input id="pass" type="password" name="password" onchange='validate("password"); enablebutton()' required><label id = "password"></label></span><br> 
<span><br>Confirm Password: <input type="password" name="confirm" onchange='validate("confirm"); enablebutton()'required><label id = "confirm"></label></span><br> 
<p>*optional</p>
<input type="button" id="submitbutton" value="Register" disabled onclick=Submit()>
</form>
</div>

<p>Whitewind Company 2012</p>
<p>All rights reserved</p>
</div>

</body>
</html>