/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function Submit(){
	// Masukkan data untuk http request
	var data = "";
	data = "id="+localStorage.id;
	data = data +"&cardnumber="+document.forms["creditregistration"]["cardnumber"].value;
	data = data+"&cardname="+document.forms["creditregistration"]["cardname"].value;
	data = data+"&expireddate="+document.forms["creditregistration"]["expireddate"].value;

	// Buka koneksi
	var xmlhttp;
	if (window.XMLHttpRequest){
		// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp=new XMLHttpRequest();
	 }
	else{
	// code for IE6, IE5
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	// Set on ready state change
	xmlhttp.onreadystatechange=function(){
		if(xmlhttp.readyState==4 && xmlhttp.status ==200){
			var responsecode = xmlhttp.responseText;
			
			// Cek respon dari server
			if(parseInt(responsecode) == 0){
				window.alert("Registrasi Kartu Kredit Berhasil!");
				// Pindah ke index
				window.location.href="Index.php";
				localStorage.isKredit = 0;
			}
			else if(parseInt(responsecode) == 1){ // Kartu Kredit telah terpakai
				window.alert("Kartu kredit telah terpakai sebelumnya");
			}
			else{
				window.alert(responsecode);
			}
		}
	}
	
	// Akses server
	xmlhttp.open("POST","CreditCard.php", false);
	xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xmlhttp.send(data);	
}