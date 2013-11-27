<%-- 
    Document   : detail_barang
    Created on : Nov 27, 2013, 10:49:07 AM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" type="text/css" href="Registration.css">
<link rel="stylesheet" type="text/css" href="Header.css">

<script>
// function Buy_la(){
	// if (localStorage.IsLogin){
		// if (localStorage.IsLogin==0){
			// //dia udah login , check udah punya kartu kredit belum
			// var t = window.location.href;
			// var jumlah = document.getElementById("quantity").value;
			// var imageplace = t.split("=");
			// t =imageplace[1];
			// /////Bagian masukin ke cart//////
			// var ket=document.getElementById('keterangan').value;
			// if(localStorage.cart){//check cart ada ga di localStorage
				// //pake JSOn buat stringify array nya
				// var cart_item = JSON.parse(localStorage.cart);
				// cart_item.push(t+","+jumlah+","+ket);
				// localStorage.cart = JSON.stringify(cart_item);
				// window.alert("cart size is "+cart_item.length);
			// }
			// else{//cart ga ada
				// //buat cart nya
				// var cart_item = new Array();
				// cart_item.push(t+","+jumlah+","+ket);
				// localStorage.cart = JSON.stringify(cart_item);
				// window.alert("buat cart baru");
			// }
		// }
		// else{
			// window.location.assign("Login.html");
		// } 
	// }
	// else{
			// window.location.assign("Login.html");
	// }
// }
function Buy_la(){
	if (localStorage.IsLogin){
		if (localStorage.IsLogin==0){
			//dia udah login , check udah punya kartu kredit belum
			var jumlah = document.getElementById("quantity").value;
			var stock = document.getElementById('jumlah').innerHTML;
			var sisa_stock = stock.split(':');
			stock = sisa_stock[1];
			window.alert(jumlah);
			
			if(jumlah>stock){
			window.alert("mesen lebih dari stock");
			}
			else{	
				/////Bagian masukin ke cart//////
				window.alert("cart test muat");
				var ket=document.getElementById('tambahan').value;
				if(localStorage.cart){//check cart ada ga di localStorage
					//pake JSOn buat stringify array nya
					window.alert("cart test muat");
					var cart_item = JSON.parse(localStorage.cart);
					if(cart_item.length>=10){
						window.alert('cart anda penuh mohon selesaikan transaksi sebelumnya');
					}
					else{
						window.alert("cart masih muat");
						cart_item.push(document.getElementById('nama').innerHTML+","+document.getElementById('harga').innerHTML+","+jumlah+","+ket);
						localStorage.cart = JSON.stringify(cart_item);
						window.alert("cart size is "+cart_item.length);
					}
				}
				else{//cart ga ada
					//buat cart nya
					var cart_item = new Array();
					cart_item.push(document.getElementById('nama').innerHTML+","+document.getElementById('harga').innerHTML+","+jumlah+","+ket);
					localStorage.cart = JSON.stringify(cart_item);
					window.alert("buat cart baru");
				}
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

</script>
</head>
<body>

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

<?php
 if (isset($_GET['name'])) {
  $id = $_GET['name'];
	$con=mysqli_connect("localhost","root","","test");

	// Check connection
	if (mysqli_connect_errno($con))
	  {
	  $response = (string)"Failed to connect to MySQL: " . mysqli_connect_error();
	 }
	 else{
		//baca mysql, cari apa ada yang id nya  $id trus pass nya $
		$sql = "SELECT * FROM barang WHERE Barang_ID = '$id'";
		$query = mysqli_query($con,$sql);
		while($row = mysqli_fetch_array($query))
		  {
			  echo"<img src=".$row["image_path"].">";
			  echo"<br><br>";
			  echo"<div id='id'>ID Barang :" . $row['Barang_ID']."</div>";
			  echo"<div id='nama'>Nama Barang :" . $row['Nama']."</div>";
			  echo"<div id='harga'>Harga :" . $row['Harga']."</div>";
			  echo"<div id='kategori'>Kategori : " .$row["Category"] ."</div>";
			  echo"<div id='jumlah'>Stock :" . $row['stock']."</div>";
			  echo"<br>";
			  echo"<div id='keterangan'>" . $row['keterangan']."</div>";
		  }
	}
	mysqli_close($con);
  }
  else{ //redirect ke halaman ini
	 //header("Location: index.php");
  
  }
?>

<br>
<br>
<form >
Jumlah yang Ingin dibeli : <input type="number" name="quantity" min="1" id="quantity"><br><br>
Tambahan Permintahan : <input type='text' name='tambahan' id="tambahan"><br><br>
<button type="button" id="buy_button" onClick = Buy_la()> buy </button>
</form>

</div>

</body>
</html>