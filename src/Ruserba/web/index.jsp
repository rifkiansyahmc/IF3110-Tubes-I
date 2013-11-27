<%-- 
    Document   : index
    Created on : Nov 26, 2013, 3:19:34 PM
    Author     : ACER
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>


<%-- Head --%>
<head>
<link rel="stylesheet" type="text/css" href="Registration.css">
<link rel="stylesheet" type="text/css" href="header.css">
<link rel="stylesheet" type="text/css" href="slider.css">
</head>

<%-- Body --%>
<body onLoad=Inisialisasi()>

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
<input id="searchButton" type="button" value="Search" onclick="Search()">
</form>

<%-- Banner --%>
<a href=""> <img src="/img/Placeholder.png" width="800px" height="200px"> </a>

<%-- Menubar --%>
<ul id="nav">
    <li>
        <a href="Index.php">Home</a>
    </li>

    <li>
        <a href="#">Product</a>
        <ul>
            <li><a href="search.html?category=Prototype">Prototype</a></li>
            <li><a href="search.html?category=Grunts">Grunts</a></li>
            <li><a href="search.html?category=Zeon Obsolete Units">Zeon Obsolete</a></li>
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

<div id="content">
<h>Welcome to Whitewind Store! Check out our products!</h>
<br><br>

<h2>Prototypes</h2>
<div id="slider-wrapper">
		<div class="inner-wrapper">
			<input checked type="radio" name="slide" class="control" id="Slide1"/>
				<label for="Slide1" id="s1"></label>
			<input type="radio" name="slide" class="control" id="Slide2"/>
				<label for="Slide2" id="s2"></label>
			<input type="radio" name="slide" class="control" id="Slide3"/>
				<label for="Slide3" id="s3"></label>
			<div class="overflow-wrapper">
<%
    Connection con;
    Statement stat;
       try
        {
               Class.forName("com.mysql.jdbc.Driver");
               con = DriverManager.getConnection("jdbc:mysql//localhost/test", "rifkiansyah", "");
               stat = con.createStatement();
               ResultSet rs = stat.executeQuery("select * " +
                "from barang" +
                "where barang.Category = 'Protoypes' " + "order by barang.stock" + "limit 3");
               while(rs.next())
               {
                   %>
                   <a class='slide' href=''><img src="${pageContext.request.contextPath}/<%out.print(rs.getString(7));%>"></img></a>
                   <%
               }
        }
       catch(SQLException e)
        {
        } 
    %>
			</div>
		</div>
	</div>

<h2>Grunts</h2>
<div id="slider-wrapper2">
		<div class="inner-wrapper2">
			<input checked type="radio" name="slide2" class="control2" id="Slide12"/>
				<label for="Slide12" id="s12"></label>
			<input type="radio" name="slide2" class="control2" id="Slide22"/>
				<label for="Slide22" id="s22"></label>
			<input type="radio" name="slide2" class="control2" id="Slide32"/>
				<label for="Slide32" id="s32"></label>
			<div class="overflow-wrapper2">
    <%

       try
        {
               Class.forName("com.mysql.jdbc.Driver");
               con = DriverManager.getConnection("jdbc:mysql//localhost/test", "rifkiansyah", "");
               stat = con.createStatement();
               ResultSet rs = stat.executeQuery("select * " +
                "from barang" +
                "where barang.Category = 'Grunts' " + "order by barang.stock" + "limit 3");
               while(rs.next())
               {
                   %>
                   <a class='slide' href=''><img src="${pageContext.request.contextPath}/<% out.print(rs.getString(7)); %>"></img></a>
                   <%
               }
        }
       catch(SQLException e)
        {
        } 
    %>
   <a class='slide' href=''><img src="$row["barang.image_path"]."></a>                         
   
			</div>
		</div>
	</div>

<h2>Zeon Obsolete Units</h2>
<div id="slider-wrapper3">
		<div class="inner-wrapper3">
			<input checked type="radio" name="slide3" class="control3" id="Slide13"/>
				<label for="Slide13" id="s13"></label>
			<input type="radio" name="slide3" class="control3" id="Slide23"/>
				<label for="Slide23" id="s23"></label>
			<input type="radio" name="slide3" class="control3" id="Slide33"/>
				<label for="Slide33" id="s33"></label>
			<div class="overflow-wrapper3">
<%
       try
        {
               Class.forName("com.mysql.jdbc.Driver");
               con = DriverManager.getConnection("jdbc:mysql//localhost/test", "rifkiansyah", "");
               stat = con.createStatement();
               ResultSet rs = stat.executeQuery("select * " +
                "from barang" +
                "where barang.Category = 'Zeon Obsolete Units' " + "order by barang.stock" + "limit 3");
               while(rs.next())
               {
                   %>
                   <a class='slide' href=''><img src="${pageContext.request.contextPath}/<% out.print(rs.getString(7)); %>"></img></a>
                   <%
               }
        }
       catch(SQLException e)
        {
        } 
    %>
    echo "<a class='slide' href=''><img src=".$row["barang.image_path"]."></a>"; 

			</div>
		</div>
	</div>	

<h2>Special Paint Version</h2>
<div id="slider-wrapper4">
		<div class="inner-wrapper4">
			<input checked type="radio" name="slide4" class="control4" id="Slide14"/>
				<label for="Slide14" id="s14"></label>
			<input type="radio" name="slide4" class="control4" id="Slide24"/>
				<label for="Slide24" id="s24"></label>
			<input type="radio" name="slide4" class="control4" id="Slide34"/>
				<label for="Slide34" id="s34"></label>
			<div class="overflow-wrapper4">
<%
       try
        {
               Class.forName("com.mysql.jdbc.Driver");
               con = DriverManager.getConnection("jdbc:mysql//localhost/test", "rifkiansyah", "");
               stat = con.createStatement();
               ResultSet rs = stat.executeQuery("select * " +
                "from barang" +
                "where barang.Category = 'Special Paint Version' " + "order by barang.stock" + "limit 3");
               while(rs.next())
               {
                   %>
                echo "<a class='slide' href=''><img src="$<%out.print(rs.getString(7));%>"></img></a>"
                   <%
            }
        }
       catch(SQLException e)
        {
        } 
    %>

			</div>
		</div>
	</div>

<h2>Ver. Ka</h2>
<div id="slider-wrapper5">
		<div class="inner-wrapper5">
			<input checked type="radio" name="slide5" class="control5" id="Slide15"/>
				<label for="Slide15" id="s15"></label>
			<input type="radio" name="slide5" class="control5" id="Slide25"/>
				<label for="Slide25" id="s25"></label>
			<input type="radio" name="slide5" class="control5" id="Slide35"/>
				<label for="Slide35" id="s35"></label>
			<div class="overflow-wrapper5">
<%
       try
        {
               Class.forName("com.mysql.jdbc.Driver");
               con = DriverManager.getConnection("jdbc:mysql//localhost/test", "rifkiansyah", "");
               stat = con.createStatement();
               ResultSet rs = stat.executeQuery("select * " +
                "from barang" +
                "where barang.Category = 'Ver. Ka' " + "order by barang.stock" + "limit 3");
            while(rs.next())
               {
                   %>
                   <a class='slide' href=''><img src="<% out.print(rs.getString(7)); %>"></img></a>
                   <%
            }
        }
       catch(SQLException e)
        {
        } 
    %>
    echo "<a class='slide' href=''><img src=".$row["barang.image_path"]."></a>"; 

?>
			</div>
		</div>
	</div>
	
</div>

<p>Whitewind Company 2012</p>
<p>All rights reserved</p>
</div>

</body>
</html>
