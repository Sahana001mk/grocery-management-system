<%@page import="java.sql.*"%>
<% 

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","asdzxc");
	PreparedStatement statmt=conn.prepareStatement("update totalstock  set totalstock.totalstock=totalstock.totalstock-(select coalesce(sum(squantity),0) from tempstock t where totalstock.proid=t.proid) "); 
	statmt.executeQuery();
	PreparedStatement stmt=conn.prepareStatement("insert into transac select * from tempstock");
	stmt.executeQuery();
	conn.close();
	}
	catch (Exception e) {
			out.print(e);
		e.printStackTrace();
		}
%>	

	<!DOCTYPE html>
	
	<html lang="en">
  <head>
  <title>Grocery management</title>
  <link rel="stylesheet" href="stylebldbnk.css">
  <link rel="icon" href="favicon.ico" type="image/icon type">
  <style>
   * {
	box-sizing: border-box;
  }
  .stylabel{
  color:white; font-size:110%; font-family:cambria; margin-left:2vw;
  }
  a{ padding-top:1vh; padding-bottom:1vh;
  }
  .no_hover a:hover{
   background-color:rgb(0,0,0,0);
   }
   
   table,td{ border: 0.1vw solid white;
			border-collapse:collapse;
			color:white; font-size:100%;
			padding:0.3vw; margin-left:1vw;
			}
	th{
		border: 0.1vw solid white;
		border-collapse:collapse;
		color:white; font-size:100%;
		padding:0.3vw; margin-left:1vw; background-color:black;
		}
  </style>
  </head>
  <body>
    <a href="grocerymgmt.html" style=" font-size:110%; text-decoration:none; float:right; margin-right:1.5vw; width:6%; ">Logout</a>
    <img src="grocerylogo.png" style="width:4.5vw; height:9vh; float:left; margin-left: 5%;">
    <div style="margin-top:2vh;margin-left:10%;">
       <h1 style="color: rgb(50,255,50); font-size:240%; margin-left: 25%; "><i>GROCERY MANAGEMENT SYSTEM</i></h1>
   </div>
   
   <div style="width:100%; overflow: auto;">
    <div style="width:22%; float: left; "><br>
     <a href="userhome.html"> Home</a>
     <a href="transaction.html"  style="color:black; background-color:white;  width:100%;  "  >Buy products</a>
	 
    </div>
    <div style="width:75%; float:top; margin-left:23vw; background-color:#333333; padding-bottom:5vh;">
	 <h1 style="color:rgb(50,255,50); font-size:150%; margin-left:1.5vw; font-family:cambria;">Products Bought!</h1><br>
	  	   
	   <h3 style="color:rgb(50,255,50); font-size:135%; margin-left:1.5vw; font-family:cambria;">Bill of Purchase:</h1>
	   	<br><br> 
		<table  border="1" >
		<tr>
		<th>Product ID</th>
		<th>Product name</th>
		<th>Product type</th>
		<th> Quantity </th>
		<th> Cost Price</th>
		</tr>
		<%
		try{
			Connection connection = null;
            Class.forName("oracle.jdbc.driver.OracleDriver");
            connection=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","asdzxc"); 
			PreparedStatement ps=connection.prepareStatement("select t.proid, t.proname, t.protype, t.squantity, t.squantity*p.costprice from tempstock t, product p where t.proid=p.proid order by proid asc");
			ResultSet rs= ps.executeQuery();
			PreparedStatement stmt=connection.prepareStatement("select sum(t.squantity*p.costprice) from tempstock t,product p where t.proid=p.proid");
			ResultSet rss=stmt.executeQuery();
		while(rs.next()){
		%>
		<tr>
		<td><%=rs.getString("proid") %></td>
		<td><%=rs.getString("proname") %></td>
	    <td><%=rs.getString("protype") %></td>
		<td><%=rs.getString("squantity") %></td>
		<td><%=rs.getString(5)%></td>
		 
		</tr>
		<%
		}
		while(rss.next()){
			%>
		<tr>
		<th  colspan="4">Total Amount:</th><td><%=rss.getString(1)%></td>
		</tr>
		<%
		}
		PreparedStatement pss=connection.prepareStatement("delete from tempstock ");
		pss.executeQuery();
		connection.close();
		} catch (Exception e) {
			out.print(e);
		e.printStackTrace();
		}
		%>
		</table>
		 
	  </div>
   </div>
   
  </body> 
</html>   