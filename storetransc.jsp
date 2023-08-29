<%@page import="java.sql.*"%>
<%
String proid=request.getParameter("gproid");
String proname=request.getParameter("gproname");
String protype=request.getParameter("gprotype");
String quantity=request.getParameter("gquantity");

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
   Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","asdzxc"); 
   PreparedStatement ps= conn.prepareStatement("insert into tempstock (proid,proname,protype,squantity) values(?,?,?,?)");
   ps.setString(1,proid);
   ps.setString(2,proname);
   ps.setString(3,protype);
   ps.setString(4,quantity); 
 
   int x=ps.executeUpdate();
   if(x==0)
   {	
		out.print("something went wrong");
   }
}
catch(Exception e)
{
	 out.print(e);
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
	 <h1 style="color:rgb(50,255,50); font-size:150%; margin-left:1.5vw; font-family:cambria;">Buy Products:</h1>
	   <form  action="storetransc.jsp" method="post" >
	     <label for="gproid" class="stylabel">Product ID: </label>  <input type="text" name="gproid"  style="margin-left:4vw;"> <br> <br>
	     <label for="gproname" class="stylabel">Product Name: </label>  <input type="text" name="gproname"  style="margin-left:2vw;"> <br> <br>
		 <div style="width:100%;">
		 <label for="gprotype" class="stylabel">Product type:</label> <select   name="gprotype" style="margin-left:2.75vw;">
			<option value="vegetables">Vegetables</option> <option value="fruits">Fruits</option>
			<option value="Dairy">Dairy</option> <option value="bakery goods">Bakery goods</option>
			<option value="snacks">Snacks</option> 	<option value="stationery">Stationery</option> 
			<option value="personal care">Personal Care</option> <option value="cleaning product">Cleaning Product</option>
			</select>
			<br> <br>
		</div>
	    <label for="gquantity" class="stylabel">Quantity: </label>  <input type="text" name="gquantity"   style=" margin-left:5vw; "> <br> <br>
	    <input type="reset" value="Clean"  style="margin-left:2vw; font-size:80%; " ><input type="submit" value="Add to cart"  style="margin-left:1vw; font-size:80%;" >
	   </form>
	   
	   
	   	<br><br> 
		<table  border="1" >
		<tr>
		<th>Product ID</th>
		<th>Product name</th>
		<th>Product type</th>
		<th> Quantity </th>
		<th> Cost Price</th>
		<th>Delete</th>
		</tr>
		<%
		try{
			Connection connection = null;
            Class.forName("oracle.jdbc.driver.OracleDriver");
            connection=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","asdzxc"); 
			PreparedStatement ps=connection.prepareStatement("select t.proid, t.proname, t.protype, t.squantity, t.squantity*p.costprice from tempstock t, product p where t.proid=p.proid order by proid asc");
			ResultSet rs= ps.executeQuery();
		while(rs.next()){
		%>
		<tr>
		<td><%=rs.getString("proid") %></td>
		<td><%=rs.getString("proname") %></td>
	    <td><%=rs.getString("protype") %></td>
		<td><%=rs.getString("squantity") %></td>
		<td><%=rs.getString(5)%></td>
		<%out.print("<td>"+"<a href='deleterow.jsp?proid="+rs.getString("proid")+"'>Delete</a>"+"</td>");%>
		 
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
		
		<form action="confirmtransc.jsp" method="post">

		<input type="submit" value="Confirm buy" style="margin-left:20vw; font-size:100%; margin-top:2vh;" >
		</form>
	  </div>
   </div>
   
  </body> 
</html>   