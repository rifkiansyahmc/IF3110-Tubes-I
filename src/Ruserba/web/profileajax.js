/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


// Inisialisasi isi awal form, nanti ini diambil pake AJAX dari Database
var a, b, c, d, e, f, g, h, i, j;
var username, fullname, hp, email, alamat, provinsi, kota, kodepos, password, confirm;

// Inisialisasi variabel isi form
a = document.getElementById("username");
b = document.registration.fullname;
c = document.registration.hp;
d = document.getElementById("email");
e = document.registration.alamat;
f = document.registration.provinsi;
g = document.registration.kota;
h = document.registration.kodepos;
i = document.registration.password;
j = document.registration.confirm;
		
if(localStorage.IsLogin){
	if(localStorage.IsLogin==0){
		var raw = localStorage.data;
		var data = raw.split(',')//urutan nya full_name,alamat,provinsi,kota/kabupaten,kodepos,nomor_handphone,email,password		
		username = localStorage.id;
		fullname = data[0];
		hp = data[5];
		email = data[6];
		alamat = data[1];
		provinsi = data[2];
		kota = data[3];
		kodepos =data[4];
		password = data[7];
		confirm = data[7];
		

		// isi
		a.innerHTML = "Username: " + username;
		b.value = fullname;
		c.value = hp;
		d.innerHTML = "Email: " + email;
		e.value = alamat;
		f.value = provinsi;
		g.value = kota;
		h.value = kodepos;
		i.value = password;
		j.value = confirm;
		
	}
	else{//belum login
		window.location.assign("Login.html");
	}
}
else{
	//gak ada isLogin
	window.location.assign("Login.html");
}

// Variabel global
passwordflag, fullnameflag, confirmflag = true;

// Fungsi cek apakah tidak berubah, jika tidak alert, jika ya success
function checkchange(){
	if (b.value == fullname && c.value == hp && e.value == alamat && f.value == provinsi && g.value == kota && h.value == kodepos && i.value == password && j.value == confirm){
		alert('You did not change any value');
	}
	else{
		Submit();
	}
}

// Fungsi validasi format input di form
function validate(type){
	if(type == "password"){ // Password
		var pattern = /........+/; // Regex
		var x = document.forms["registration"]["password"].value; // Ambil Value
		var y = document.getElementById("password"); // Ambil elemen tulisan di sebelah form
		
		// Cek value dengan regex
		if(!pattern.test(x)){
			y.innerHTML=" *password minimal 8 karakter";
			passwordflag = false;
		}else{
			y.innerHTML="";
			passwordflag = true;
			
			// Cek kesamaan dengan password
			if(username == x){
				y.innerHTML=" *password tidak boleh sama dengan username";
				passwordflag = false;
			}else{
				y.innerHTML="";
				passwordflag = true;
		
				// Cek kesamaan dengan email
				if(email == x){
					y.innerHTML=" *password tidak boleh sama dengan email";
					passwordflag = false;
				}else{
					y.innerHTML="";
					passwordflag = true;
				}
			}
		}	
	}else if(type == "confirm"){ // Confirm password
		var password = document.forms["registration"]["password"].value; // Ambil Value form Password
		var x = document.forms["registration"]["confirm"].value; // Ambil Value form Confirm
		var y = document.getElementById("confirm"); // Ambil elemen tulisan di sebelah form
		
		// Cek kesamaan dengan password
		if(password == x){
			y.innerHTML="";
			confirmflag = true;
		}else{
			y.innerHTML=" *konfirmasi password salah";
			confirmflag = false;
		}
	}else if(type == "fullname"){ // Full name
		var pattern = /.+ .+/; // Regex
		var x = document.forms["registration"]["fullname"].value; // Ambil Value
		var y = document.getElementById("fullname"); // Ambil elemen tulisan di sebelah form
		
		// Cek value dengan regex
		if(!pattern.test(x)){
			y.innerHTML=" *nama minimal 2 kata dipisahkan spasi";
			fullnameflag = false;
		}else{
			y.innerHTML="";
			fullnameflag = true;
		}
	}
}

// Fungsi disable/enable confirm button
function enablebutton(){
	var button = document.getElementById("submitbutton");
	if (passwordflag && fullnameflag && confirmflag){
		button.disabled=false;
	}else
		button.disabled=true;
}

// Fungsi submit change ke database
function Submit(){
	// Masukkan data untuk http request
	var data = "";
	data = "id="+localStorage.id;
	data = data +"&fullname="+document.forms["registration"]["fullname"].value;
	data = data+"&hp="+document.forms["registration"]["hp"].value;
	data = data+"&alamat="+document.forms["registration"]["alamat"].value;
	data = data+"&provinsi="+document.forms["registration"]["provinsi"].value;
	data = data+"&kota="+document.forms["registration"]["kota"].value;
	data = data+"&kodepos="+document.forms["registration"]["kodepos"].value;
	data = data+"&password="+document.forms["registration"]["password"].value;

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
			var response = JSON.parse(responsecode);
			
			// Cek respon dari server
			if(response.code == 0){
				window.alert("Edit Profile berhasil!");
				localStorage.data = response.data;
			}
		}
	}
	
	xmlhttp.open("POST","Profile.php", false);
	xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xmlhttp.send(data);	
}