<%@page import="java.sql.*"%>

<%
String proid=request.getParameter("gproid");
String supid=request.getParameter("gsupid");
String quantity=request.getParameter("gquantity");
 
 try{
	 Class.forName("oracle.jdbc.driver.OracleDriver");
   Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","asdzxc"); 
   PreparedStatement ps= conn.prepareStatement("insert into stock values(?,?,?)");
   ps.setString(1,proid);
   ps.setString(2,supid); 
   ps.setString(3,quantity);

	PreparedStatement statemt=conn.prepareStatement("update totalstock set totalstock=totalstock+? where proid=?");
    statemt.setString(1,quantity);
	statemt.setString(2,proid);
   statemt.executeQuery();
  
 
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
	 <a href="addproduct.html" >+ PRODUCT</a>
	 <a href="addsupplier.html" > + SUPPLIER</a>
	 <a href="addcustomer.html"  > + CUSTOMER</a>
	 <a href="restock.html" style="color:black; background-color:white;  width:100%;  " > Restock</a>
	
	 
    </div>
    <div style="width:75%; float:top; margin-left:23vw; background-color:#333333; padding-bottom:3vh;">
	   <h1 style="color:rgb(50,255,50); font-size:150%; margin-left:1.5vw; font-family:cambria;">Restock:</h1>
	   <p style="color:white; font-size:110%; font-family:cambria; margin-left:2vw; margin-top:0vh;"  class="no_hover">To view current stock <a href="viewstock.jsp" 
	   style=" color:rgb(50,200,50);  font-family:cambria;  margin-left:0px;  border:none; width:10%; padding:0px; padding-left:0.25vh; display:inline; text-decoration:underline; 
	   font-size:90%;  "><span style="font-size:120%;">Click here</span> </a> </p> <br>
	   <form  action="submititems.jsp" method="post" >
	     <label for="gproid" class="stylabel">Product ID: </label>  <input type="text" name="gproid"  style="margin-left:3.85vw;"> <br> <br>
	    <label for="gsupid" class="stylabel">Supplier ID :</label>  <input type="text" name="gsupid" style="margin-left:3.25vw;"  > <br> <br>
	    <label for="gquantity" class="stylabel">Quantity: </label>  <input type="text" name="gquantity"   style=" margin-left:5vw; "> <br> <br>
		 <input type="reset" value="Clean"  style="margin-left:2vw; font-size:80%; " ><input type="submit" value="Submit"  style="margin-left:1vw; font-size:80%;" >
		 </form>
		 	 <p style="color:white; font-size:110%; margin-left:2vw;">Restocking Successful!</p>
		<div class="stylabel" style="font-size:170%;">
		<%@page import="java.sql.*"%>
		<%@page import="java.util.*"%>
		<label class="stylabel">Total Cost:</label>
		<%

		try{
			Connection connection = null;
            Class.forName("oracle.jdbc.driver.OracleDriver");
            connection=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","asdzxc"); 
			Statement statement = connection.createStatement();
			PreparedStatement ps=  connection.prepareStatement("select markprice*? from product where proid=? ");
			ps.setString(1,quantity);
			ps.setString(2,proid);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				%> 
				<%=rs.getString(1)%>
				<%
			}	
		
		connection.close();
		} catch (Exception e) {
			out.print(e);
		e.printStackTrace();
		}
		%>
 
		</div>	    
	       <br> <br>
		  
	  </div>
	 </div>
	</body>
</html>