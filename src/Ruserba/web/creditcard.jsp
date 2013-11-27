<%-- 
    Document   : creditcard
    Created on : Nov 26, 2013, 5:32:34 PM
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
<body>

<!-- Javascript validasi -->
<script src = "Validation.js"></script>

<!-- Script AJAX-->
<script src = "creditcardajax.js"></script>

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
<a href="Index.php"> <img src="/WBD/img/Placeholder.png" width="800px" height="200px"> </a>

<!-- Menubar -->
<ul id="nav">
    <li>
        <a href="Index.php">Home</a>
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
<h2>Registrasi Kartu Kredit </h2>

<!-- Form Pendaftaran -->
<form name="creditregistration">
Card Number: <input type="text" name="cardnumber"> <br>
<br>Name(on Card): <input type="text" name="cardname"> <br>
<br>Expired Date: <input type="text" name="expireddate"> <br>
<span><br><input type="button" id="submitbutton" value="Register" onclick=Submit()><a href="Index.php">Skip registrasi kartu kredit</a></span>
</form>


</div>

<p>Solomon Company 2013</p>
<p>All rights reserved</p>
</div>

</body>
</html>

