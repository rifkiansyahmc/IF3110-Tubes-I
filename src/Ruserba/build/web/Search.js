/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function Load_data(){
	var t = window.location.href;
	var raw_data = t.split("?");
	if(raw_data.length <2){
		//redirect ke halaman lain
		window.location.assign("index.jsp");
	}
	else{
		if(raw_data.length==2){
			t=raw_data[1];
		}
		else{
			var temp = raw_data[1];
			var baru=temp.split('=');
			t=raw_data[2]+"="+baru[1];	
		}
		
		//window.alert(raw_data[1]);
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
				localStorage.search=temp;
				//var hasil = JSON.parse(temp);
				//window.alert(temp);
			}
		}
		xmlhttp.open("GET","search.php?"+t,false);
		xmlhttp.send();
		raw_data=localStorage.search.split(",");
		//window.alert(raw_data.length);
		for(var i=0;i<10;i++){
			document.getElementById('data'+(i+1)).style.visibility="hidden";
		}
		//masukin data yang di dapet ke list
		raw_data=localStorage.search.split(",");
		//window.alert('namaitem'+0+' ini panjang iterasi : '+((raw_data.length-1)/5));
		if(((raw_data.length-1)/5)<=10){ //kalo hasil pencarian kurang dari 10, gek perlu paging
			for(var i=0;i<((raw_data.length-1)/5);i++){
				document.getElementById('namaitem'+(i+1)).href="detail_barang.php?name="+raw_data[i*5];
				document.getElementById('namaitem'+(i+1)).innerHTML ="Nama Barang :"+raw_data[i*5+1];
				document.getElementById('hargaitem'+(i+1)).innerHTML ="Harga : "+raw_data[i*5+2]
				document.getElementById('itempicture'+(i+1)).src =raw_data[i*5+4];
				document.getElementById('jumlahitem'+(i+1)).value =0;				
				document.getElementById('jumlahitem'+(i+1)).setAttribute("max",parseInt(raw_data[i*5+3]));
				document.getElementById('data'+(i+1)).style.visibility="visible";
				document.getElementById('buy_button'+(i+1)).setAttribute('onclick', 'validate('+raw_data[i*5]+','+(i+1)+');');;
			}
		//set tombol paginasi biar ilang
		document.getElementById('<').style.visibility="hidden";
		document.getElementById('>').style.visibility="hidden";
		document.getElementById('pagenumber').style.visibility="hidden";
		}
		else{//bagian paginasi
			var temp =((raw_data.length-1)/50); //dapetin jumlah page
			if(((raw_data.length-1)%50)>0){ //ada sisa kalo 1 page max 10 halaman, buat halaman sisa nya
				temp += 1;
			}
			localStorage.currentpage=1;
			localStorage.pagenumber=temp;
			document.getElementById('<').style.visibility="hidden";
			document.getElementById('>').style.visibility="visible";
			//document.getElementById('<').onclick=before();
			//document.getElementById('>').onclick=next();
			document.getElementById('pagenumber').innerHTML="Page "+localStorage.currentpage;
		for(var i=0;i<10;i++){
			document.getElementById('namaitem'+(i+1)).href="detail_barang.php?name="+raw_data[i*5];
			document.getElementById('namaitem'+(i+1)).innerHTML ="Nama Barang :"+raw_data[i*5+1];
			document.getElementById('hargaitem'+(i+1)).innerHTML ="Harga : "+raw_data[i*5+2]
			document.getElementById('itempicture'+(i+1)).src =raw_data[i*5+4];
			document.getElementById('jumlahitem'+(i+1)).value =0;				
			document.getElementById('jumlahitem'+(i+1)).setAttribute("max",parseInt(raw_data[i*5+3]));
			document.getElementById('data'+(i+1)).style.visibility="visible";
			document.getElementById('buy_button'+(i+1)).setAttribute('onclick', 'validate('+raw_data[i*5]+','+(i+1)+');');;
			}
		}
	}	
}
function next(){
	document.getElementById('<').style.visibility="visible";
	for(var i=0;i<10;i++){
		document.getElementById('data'+(i+1)).style.visibility="hidden";
		//document.getElementById('buy_button'+(i+1)).removeAttribute("onclick");
	}
//window.alert('debug3');
	var j=0;
	var raw_data=localStorage.search.split(",");
	localStorage.currentpage = parseInt(localStorage.currentpage)+1;
	document.getElementById('pagenumber').innerHTML="Page "+localStorage.currentpage;
	//window.alert('debug3'+parseInt(localStorage.currentpage)+"  dan  "+parseInt(localStorage.pagenumber));
	if(parseInt(localStorage.currentpage) < parseInt(localStorage.pagenumber)){
		document.getElementById('>').style.visibility="visible";
		for(var i=(localStorage.currentpage-1)*10;i<localStorage.currentpage*10;i++){
			document.getElementById('namaitem'+(j+1)).href="detail_barang.php?name="+raw_data[i*5];
			document.getElementById('namaitem'+(j+1)).innerHTML ="Nama Barang :"+raw_data[i*5+1];
			document.getElementById('hargaitem'+(j+1)).innerHTML ="Harga : "+raw_data[i*5+2]
			document.getElementById('itempicture'+(j+1)).src =raw_data[i*5+4];
			document.getElementById('jumlahitem'+(j+1)).value =0;				
			document.getElementById('jumlahitem'+(j+1)).setAttribute("max",parseInt(raw_data[i*5+3]));
			document.getElementById('data'+(j+1)).style.visibility="visible";
			//document.getElementById('buy_button'+(j+1)).setAttribute('onclick', 'validate('+raw_data[parseInt(i)*5]+','+(parseInt(i)+1)+');');;
			j=parseInt(j)+1;
					//j=parseInt(j)+1;
		}
	}
	else{
		document.getElementById('>').style.visibility="hidden";
		//window.alert('debug3'+(localStorage.currentpage-1)*10+" dan  "+(localStorage.currentpage-1)*10+(((raw_data.length-1)%50)/5));
		for(var i=(localStorage.currentpage-1)*10;i<(localStorage.currentpage-1)*10+(((raw_data.length-1)%50)/5);i++){
			document.getElementById('namaitem'+(j+1)).href="detail_barang.php?name="+raw_data[i*5];
			document.getElementById('namaitem'+(j+1)).innerHTML ="Nama Barang :"+raw_data[i*5+1];
			document.getElementById('hargaitem'+(j+1)).innerHTML ="Harga : "+raw_data[i*5+2]
			document.getElementById('itempicture'+(j+1)).src =raw_data[i*5+4];
			document.getElementById('jumlahitem'+(j+1)).value =0;				
			document.getElementById('jumlahitem'+(j+1)).setAttribute("max",parseInt(raw_data[i*5+3]));
			document.getElementById('data'+(j+1)).style.visibility="visible";
			//document.getElementById('buy_button'+(j+1)).setAttribute('onclick', 'validate('+raw_data[parseInt(i)*5]+','+(parseInt(i)+1)+');');;
			j=parseInt(j)+1;
			//j=parseInt(j)+1;
		}	
	}
}
function before(){
	document.getElementById('>').style.visibility="visible";
	
	for(var i=0;i<10;i++){
		document.getElementById('data'+(i+1)).style.visibility="hidden";
		//document.getElementById('buy_button'+(i+1)).removeAttribute("onclick");
	}
	var j=0;
	var raw_data=localStorage.search.split(",");
	localStorage.currentpage = parseInt(localStorage.currentpage)-1;
	document.getElementById('pagenumber').innerHTML="Page "+localStorage.currentpage;
	if(parseInt(localStorage.currentpage) > 1){ //belum ke page 1
		document.getElementById('<').style.visibility="visible";
	
	}
	else{ //jadi ke page 1
		document.getElementById('<').style.visibility="hidden";	
	}
	for(var i=(localStorage.currentpage-1)*10;i<localStorage.currentpage*10;i++){
		document.getElementById('namaitem'+(j+1)).href="detail_barang.php?name="+raw_data[i*5];
		document.getElementById('namaitem'+(j+1)).innerHTML ="Nama Barang :"+raw_data[i*5+1];
		document.getElementById('hargaitem'+(j+1)).innerHTML ="Harga : "+raw_data[i*5+2]
		document.getElementById('itempicture'+(j+1)).src =raw_data[i*5+4];
		document.getElementById('jumlahitem'+(j+1)).value =0;				
		document.getElementById('jumlahitem'+(j+1)).setAttribute("max",parseInt(raw_data[i*5+3]));
		document.getElementById('data'+(j+1)).style.visibility="visible";
		//document.getElementById('buy_button'+(j+1)).setAttribute.onclick = function(){validate(raw_data[i*5],i+1);return false;};
		j++;
		//document.getElementById('buy_button'+(i+1)).setAttribute('onclick',  'javascript: validate('+raw_data[i*5]+','+(i+1)+');');
		
		}
	


}
function validate(t,num){//t adalah nama baranag di database, num adalah nomor di tabel 
//kalo yang mau beli belum login dia di redirect
if(localStorage.IsLogin ==1){ //belum login
	window.location.assign("index.jsp")
}
else{//udah login, check cart nya kosong atau gak :v
	//aturan cart : id,jumlah,keterangan
	var temp = document.getElementById('jumlahitem'+num).value;
	if(parseInt(temp)>=1){
		//window.alert('Masukin Angka dong :v');
		if(temp >parseInt(document.getElementById('jumlahitem'+num).getAttribute('max'))){
			//batalin transaksi
			window.alert("Jumlah Barang tidak mencukupi, jumlah barang saat ini ada : "+parseInt(document.getElementById('jumlahitem'+num).getAttribute('max')))
		}
		else if(JSON.parse(localStorage.cart).length>=10){
			window.alert('cart ada sudah penuh, mohon selesaikan transaksi terlebih dahulu');
		
		}
		else{ //cart masih muat, masukin ke dalem :v
			if(localStorage.cart){//check cart ada ga di localStorage
				//pake JSOn buat stringify array nya
				var cart_item = JSON.parse(localStorage.cart);
				cart_item.push(document.getElementById('namaitem'+num).innerHTML+","+document.getElementById('hargaitem'+num).innerHTML+","+temp+","+"normal");
				localStorage.cart = JSON.stringify(cart_item);
			}
			else{//cart ga ada
				//buat cart nya
				var cart_item = new Array();
				cart_item.push(document.getElementById('namaitem'+num).innerHTML+","+document.getElementById('hargaitem'+num).innerHTML+","+temp+","+"normal");
				//cart_item.push(t+","+temp+","+"normal");
				localStorage.cart = JSON.stringify(cart_item);
			}
		}			
	}
	else{
		window.alert("Masukan angka / jangan masukan angka 0");
	}
}

}
function sorting(){
	var t = window.location.href;
	var raw_data = t.split("?");
	//dapetin value dari  form :v
	var sb=document.getElementById('sortby').value;
    var st=	document.getElementById('sorttype').value;
	//ini yang rata , sorting nya gmna coba :v
	if(raw_data.length <2){
		//redirect ke halaman lain
		window.location.assign("index.html");
	}
	else{
		if(raw_data.length==2){
			t=raw_data[1]+'&sortby='+sb+'&sorttype='+st;
		}
		else{
			var temp = raw_data[1];
			var baru=temp.split('=');
			t=raw_data[2]+"="+baru[1]+'&sortby='+sb+'&sorttype='+st;	
		}
		
		//window.alert(raw_data[1]);
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
				localStorage.search=temp;
				//var hasil = JSON.parse(temp);
				//window.alert(temp);
			}
		}
		xmlhttp.open("GET","search.php?"+t,false);
		xmlhttp.send();
		raw_data=localStorage.search.split(",");
		for(var i=0;i<10;i++){
			document.getElementById('data'+(i+1)).style.visibility="hidden";
		}
		//masukin data yang di dapet ke list
		raw_data=localStorage.search.split(",");
		//window.alert('namaitem'+0+' ini panjang iterasi : '+((raw_data.length-1)/5));
		if(((raw_data.length-1)/5)<=10){ //kalo hasil pencarian kurang dari 10, gek perlu paging
			for(var i=0;i<((raw_data.length-1)/5);i++){
				document.getElementById('namaitem'+(i+1)).href="detail_barang.php?name="+raw_data[i*5];
				document.getElementById('namaitem'+(i+1)).innerHTML ="Nama Barang :"+raw_data[i*5+1];
				document.getElementById('hargaitem'+(i+1)).innerHTML ="Harga : "+raw_data[i*5+2]
				document.getElementById('itempicture'+(i+1)).src =raw_data[i*5+4];
				document.getElementById('jumlahitem'+(i+1)).value =0;				
				document.getElementById('jumlahitem'+(i+1)).setAttribute("max",parseInt(raw_data[i*5+3]));
				document.getElementById('data'+(i+1)).style.visibility="visible";
				document.getElementById('buy_button'+(i+1)).setAttribute('onclick', 'validate('+raw_data[i*5]+','+(i+1)+');');
			}
		//set tombol paginasi biar ilang
		document.getElementById('<').style.visibility="hidden";
		document.getElementById('>').style.visibility="hidden";
		document.getElementById('pagenumber').style.visibility="hidden";
		}
		else{//bagian paginasi
			var temp =((raw_data.length-1)/50); //dapetin jumlah page
			if(((raw_data.length-1)%50)>0){ //ada sisa kalo 1 page max 10 halaman, buat halaman sisa nya
				temp += 1;
			}
			localStorage.currentpage=1;
			localStorage.pagenumber=temp;
			document.getElementById('<').style.visibility="hidden";
			document.getElementById('>').style.visibility="visible";
			//document.getElementById('<').onclick=before();
			//document.getElementById('>').onclick=next();
			document.getElementById('pagenumber').innerHTML="Page "+localStorage.currentpage;
		for(var i=0;i<10;i++){
			document.getElementById('namaitem'+(i+1)).href="detail_barang.php?name="+raw_data[i*5];
			document.getElementById('namaitem'+(i+1)).innerHTML ="Nama Barang :"+raw_data[i*5+1];
			document.getElementById('hargaitem'+(i+1)).innerHTML ="Harga : "+raw_data[i*5+2]
			document.getElementById('itempicture'+(i+1)).src =raw_data[i*5+4];
			document.getElementById('jumlahitem'+(i+1)).value =0;				
			document.getElementById('jumlahitem'+(i+1)).setAttribute("max",parseInt(raw_data[i*5+3]));
			document.getElementById('data'+(i+1)).style.visibility="visible";
			document.getElementById('buy_button'+(i+1)).setAttribute('onclick', 'validate('+raw_data[i*5]+','+(i+1)+');');
			}
		}
	}	
	
}
