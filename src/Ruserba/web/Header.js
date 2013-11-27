/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function Login(){
	var win = open("test.jsp", 'example', 'width=300,height=300');
	win.focus();
	
}

function UpdateFunction(){
	document.getElementById('LoginB').onclick=LogOut;
	document.getElementById('LoginB').value="Log Out";
	document.getElementById("new_id").innerHTML="Welcome "+ localStorage.id;		
	document.getElementById("new_id").href="Profile.html?id="+localStorage.id;
	pattern = /Register/;
	if(pattern.test(document.URL))
		window.location.href="index.jsp";
}

var GlobalUpdateFunction = this.UpdateFunction;

function LogOut(){
	localStorage.IsLogin= 1;
	localStorage.id = "Null";
	localStorage.data = "";
	document.getElementById('LoginB').value="Log In";
	document.getElementById('LoginB').onclick=Login;
	document.getElementById("new_id").innerHTML="Register";
	document.getElementById("new_id").href="Register.html";
	sessionStorage.clear();
	pattern = /Profile/;
	if(pattern.test(document.URL))
		window.location.href="Index.jsp";
}

function Inisialisasi(){
	if(typeof(Storage)!=="undefined"){
		if (localStorage.IsLogin){
			if(localStorage.IsLogin == 0){
					document.getElementById("new_id").innerHTML="Profile"; 
					document.getElementById("LoginB").value="Log Out"; 
					document.getElementById("LoginB").onclick=LogOut; 
					document.getElementById("new_id").href="Profile.html?id="+localStorage.id;
				}
				else{//belumlogin
				}
			}
		else{//islogin belum ada
			localStorage.IsLogin= 1;
			localStorage.id = "Null";
		}
	}
	else{
		document.getElementById("result").innerHTML="Sorry, your browser does not support web storage...";
		document.getElementById("result").href='#';
	}
} 

function Search(){

var temp=document.getElementById("searchbar").value;
var temp2=document.getElementById("select").value;
window.location.assign("search.html?search="+temp+"?"+temp2);
}