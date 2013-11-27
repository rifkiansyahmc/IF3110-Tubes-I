<%-- 
    Document   : cart
    Created on : Nov 27, 2013, 10:44:04 AM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="html_basic.css" type="text/css" title="base_layout" media="screen,print" />
 <link rel="stylesheet" type="text/css" href="Registration.css">
 <link rel="stylesheet" type="text/css" href="Header.css">
<script>
function tableCreate(){
	if(localStorage.IsLogin){
		if(localStorage.IsLogin==0){
			if(localStorage.cart){
				window.alert('debug ');
				var isi_cart = JSON.parse(localStorage.cart);
				document.getElementById('result').innerHTML="Isi Cart ada "+isi_cart.length+" data";
				var temp=0;
				window.alert(isi_cart);
				temp = isi_cart.length;
				window.alert(isi_cart[1]);
				for(var i=0;i<temp;i++){
					var isi=isi_cart[i].split(",");
					window.alert(isi_cart[i]);
					document.getElementById('nama'+(i+1)).innerHTML = isi[0];
					document.getElementById('cellharga'+(i+1)).innerHTML = isi[1];
					document.getElementById('celljumlah'+(i+1)).innerHTML = isi[2];
					document.getElementById('celldescript'+(i+1)).innerHTML = isi[3];
				}
			}
			else{
				document.getElementById('result').innerHTML="Isi Cart Kosong";
			}
		}
		else{
			window.location.assign("index.php");
		}
	}
	else{
	window.location.assign("index.php");
	}
	
}

function Buy(){
if(localStorage.IsLogin){
	if(localStorage.IsLogin==0){
		if(localStorage.isKredit){//check punya credit card ga 
			if(localStorage.isKredit == 0){
				//dia punya credit card
				window.alert("Barang telah di beli");
				localStorage.removeItem('cart');
			}
			else{
				//paksa isi credit card
				window.alert("credit card false :v");
				window.location.assign("CreditCard.html");
			}
		}
		else{
			//window.alert("Belum ada credit card");
			window.location.assign("CreditCard.html");
		}
	}
	else{//belum login
		//window.location.pathname=Login.html;
		window.location.assign("index.php");
	}
}
else{
//location.pathname=Login.html;
window.location.assign("index.php");
}
}
</script>
</head>
<body onload=tableCreate()>
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

<div id = "content2">
<div id="result"></div>
<br><br>
<button type="button" onclick="Buy()">Buy</button>
<div class="cart">
<font color="#000000">
		<div class="cartrow">
			<div id='nama' class="cellnama">Nama</div>
			<div id='harga'class="cellharga">Harga</div>
			<div id='jumlah' class="celljumlah">Jumlah</div>
			<div id='deskripsi'class="celldescript">Deskripsi</div>
		</div>
		<div class="cartrow">
			<div id='nama1' class="cellnama">Nama</div>
			<div id='cellharga1'class="cellharga">Harga</div>
			<div id='celljumlah1' class="celljumlah">Jumlah</div>
			<div id='celldescript1'class="celldescript">Deskripsi</div>
		</div>
		<div class="cartrow">
			<div id='nama2'class="cellnama">Nama</div>
			<div class="cellharga" id="cellharga2">Harga</div>
			<div class="celljumlah" id="celljumlah2">Jumlah</div>
			<div class="celldescript" id="celldescript2">Deskripsi</div>
		</div>
		<div class="cartrow">
			<div id='nama3' class="cellnama">Nama</div>
			<div class="cellharga" id="cellharga3">Harga</div>
			<div class="celljumlah" id="celljumlah3">Jumlah</div>
			<div class="celldescript" id="celldescript3">Deskripsi</div>
		</div>
		<div class="cartrow">
			<div id='nama4' class="cellnama">Nama</div>
			<div class="cellharga" id="cellharga4">Harga</div>
			<div class="celljumlah" id="celljumlah4">Jumlah</div>
			<div class="celldescript" id="celldescript4">Deskripsi</div>
		</div>
		<div class="cartrow">
			<div id="nama5" class="cellnama">Nama</div>
			<div class="cellharga" id="cellharga5">Harga</div>
			<div class="celljumlah" id="celljumlah5">Jumlah</div>
			<div class="celldescript" id="celldescript5">Deskripsi</div>
		</div>
		<div class="cartrow">
			<div id='nama6'class="cellnama">Nama</div>
			<div id="cellharga6" class="cellharga">Harga</div>
			<div id="celljumlah6" class="celljumlah">Jumlah</div>
			<div id="celldescript6" class="celldescript">Deskripsi</div>
		</div>
		<div class="cartrow">
			<div id='nama7' class="cellnama">Nama</div>
			<div id="cellharga7" class="cellharga">Harga</div>
			<div id="celljumlah7" class="celljumlah">Jumlah</div>
			<div id="celldescript7" class="celldescript">Deskripsi</div>
		</div>
		<div class="cartrow">
			<div id='nama8'class="cellnama">Nama</div>
			<div id="cellharga8" class="cellharga">Harga</div>
			<div id="celljumlah8" class="celljumlah">Jumlah</div>
			<div id="celldescript8" class="celldescript">Deskripsi</div>
		</div>
		<div class="cartrow">
			<div id="nama9" class="cellnama">Nama</div>
			<div id="cellharga9" class="cellharga">Harga</div>
			<div id="celljumlah9" class="celljumlah">Jumlah</div>
			<div id="celldescript9" class="celldescript">Deskripsi</div>
		</div>
		<div class="cartrow">
			<div id="nama10" class="cellnama">Nama</div>
			<div id="cellharga10" class="cellharga">Harga</div>
			<div id="celljumlah10" class="celljumlah">Jumlah</div>
			<div id="celldescript10" class="celldescript">Deskripsi</div>
		</div>
</div>
</div>
</div>

<p>Solomon Company 2013</p>
<p>All rights reserved</p>

</div>
</body>
</html>
