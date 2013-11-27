<%-- 
    Document   : profile
    Created on : Nov 26, 2013, 3:26:19 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%-- Head --%>
<head>
<link rel="stylesheet" type="text/css" href="Registration.css">
<link rel="stylesheet" type="text/css" href="Header.css">
</head>

<%-- Body --%>
<body onload="Inisialisasi()">


<div id = "maindiv">

<%-- HEADER --%>

<%-- Script Header --%>
<script src = "Header.js"></script>

<%-- Markup Header --%>
<div id="homebar">

<%-- Search Bar --%>
<form id = "search"> 
Search Item: <input type="search" name="search" id="searchbar" >
<select id='select'>
  <option value="name">Nama</option>
  <option value="price">Harga</option>
  <option value="category">Category</option>
</select>
<input id="searchButton" style="visibility:visible" type="button" value="Search" onclick="Search()">
</form>

<%-- Banner --%>
<a href="Index.php"> <img src="/WBD/img/Placeholder.png" width="800px" height="200px"> </a>

<%-- Menubar --%>
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
		<a id ='new_id' href="Register.jsp">Register</a>
	</li>
	<li id="loginarea">
		<input id="LoginB" type="button" value="Log in" onclick="Login()">
	</li>
</ul>

</div>

<%-- END HEADER --%>

<div id = "content">
<%-- Titel --%>
<h2>Profile Edit</h2>

<%-- Form Pendaftaran --%>
<form name= "registration" >
<label id="username" >Username: </label> <br>
<span><br>Nama Lengkap: <input type="text" name="fullname" onchange='validate("fullname"); enablebutton()' required> <label id = "fullname"></label></span><br> 
<span><br>Nomor Handphone:* <input type="text" name="hp" id='nohp'> <br></span>
<br><label id="email">Email: </label> <br>
<span><br>Alamat:* <input type="text" name="alamat"id='alamat'> <br></span>
<span><br>Provinsi:* <input type="text" name="provinsi"id='provinsi'> <br></span>
<span><br>Kota/Kabupaten:* <input type="text" name="kota"id='kota'> <br></span>
<span><br>Kodepos:* <input type="text" name="kodepos"id='kodepos'> <br></span>
<span><br>Password: <input type="password" name="password" onchange='validate("password"); enablebutton()' required><label id = "password"></label></span><br> 
<span><br>Confirm Password: <input type="password" name="confirm" onchange='validate("confirm"); enablebutton()'required><label id = "confirm"></label></span><br> 
<p>*optional</p>
<input type="button" onclick="checkchange()" id="submitbutton" value="Edit Profile">
</form>
</div>

<p>Solomon Company 2013</p>
<p>All rights reserved</p>
</div>

<%-- Javascript validasi --%>
<script src = "profileajax.js"></script>

</body>
</html>
