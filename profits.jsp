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
	  <a href="profits.jsp" style="color:black; background-color:white;  width:100%;  ">Profits</a>
	 <a href="addproduct.html" >+ PRODUCT</a>
	 <a href="addsupplier.html" > + SUPPLIER</a>
	 <a href="addcustomer.html"  > + CUSTOMER</a>
	 <a href="restock.html"  > Restock</a>
	
	 
    </div>
    <div style="width:75%; float:top; margin-left:23vw; background-color:#333333; padding-bottom:3vh;">
	   <h1 style="color:rgb(50,255,50); font-size:150%; margin-left:1.5vw; font-family:cambria;">Financial Statistics:</h1>
	   <div class="stylabel" style="font-size:170%;">
	   <%@page import="java.sql.*"%>
		
		<%
		try{
			Connection connection = null;
            Class.forName("oracle.jdbc.driver.OracleDriver");
            connection=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","asdzxc"); 
			Statement statement = connection.createStatement();
			ResultSet rs= statement.executeQuery("select sum(s.quant*p.markprice) from stock s, product p where s.proid=p.proid");
		while(rs.next()){
		%>
		
		<p class="stylabel">Total Cost: Rs.<%=rs.getString(1) %></p>		
	
		<%
		}
		connection.close();
		} catch (Exception e) {
			out.print(e);
		e.printStackTrace();
		}
		%>
		
		<%@page import="java.sql.*"%>

		
		<%
		try{
			Connection connection = null;
            Class.forName("oracle.jdbc.driver.OracleDriver");
            connection=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","asdzxc"); 
			Statement statement = connection.createStatement();
			ResultSet rs= statement.executeQuery("select sum(t.squantity*p.costprice) from transac t,product p where t.proid=p.proid");
		while(rs.next()){
		%>
		
		<p class="stylabel">Profits made:  Rs.<%=rs.getString(1) %></p>
		
	
		<%
		}
		connection.close();
		} catch (Exception e) {
			out.print(e);
		e.printStackTrace();
		}
		%>

		
	    </div>
	  </div>
	 </div>
	</body>
</html>