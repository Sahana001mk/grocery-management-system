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
 
  a{ padding-top:1vh; padding-bottom:1vh;
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
    <div style="margin-top:3vh;margin-left:10%;">
       <h1 style="color: rgb(50,255,50); font-size:240%; margin-left: 25%; "><i>GROCERY MANAGEMENT SYSTEM</i></h1>
   </div>
   
      <div style="width:100%; overflow: auto;">
    <div style="width:22%; float: left; "><br>
     <a href="groceryhome.html"  > Home</a>
	  <a href="profits.jsp"  >Profits</a>
	 <a href="addproduct.html" style="color:black; background-color:white;  width:100%;  ">+ PRODUCT</a>
	 <a href="addsupplier.html" > + SUPPLIER</a>
	 <a href="addcustomer.html"  > + CUSTOMER</a>
	 <a href="restock.html"  > Restock</a>
	
    </div>
	
	  <div style="width:75%; float:top; margin-left:23vw; background-color:#333333; padding-bottom:3vh;">
	    <%@page import="java.sql.*"%>
		 
		 
			<br><br> 
		<table  border="1" >
		<tr>
		<th>Product ID</th>
		<th>Product name</th>
		<th>Product type</th>
		<th> Supplier ID</th>
		<th> Quantity per packet</th>
		<th> Market price</th>
		<th> Cost price</th>
		<th> Difference</th>
 

		</tr>
		<%
		try{
			Connection connection = null;
            Class.forName("oracle.jdbc.driver.OracleDriver");
            connection=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","asdzxc"); 
			Statement statement = connection.createStatement();
			ResultSet rs= statement.executeQuery("select * from product order by proid asc");
		while(rs.next()){
		%>
		<tr>
		<td><%=rs.getString("proid") %></td>
		<td><%=rs.getString("proname") %></td>
	    <td><%=rs.getString("protype") %></td>
		<td><%=rs.getString("supid") %></td>
		<td><%=rs.getString("quantity")%></td>
		<td><%=rs.getString("markprice") %></td>
		<td><%=rs.getString("costprice") %></td>
		<td><%=rs.getString(8)%></td>
		 
		</tr>
		<%
		}
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