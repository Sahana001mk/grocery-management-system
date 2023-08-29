<%@ page import="java.sql.*"%>

<%
String supid=request.getParameter("gsupid");
String supname=request.getParameter("gsupname");
String address=request.getParameter("gaddress");
String dealer=request.getParameter("gdealer");
String phone=request.getParameter("gphone");
String email=request.getParameter("gemail");


String dob=request.getParameter("gdob");
 
 try{
	 Class.forName("oracle.jdbc.driver.OracleDriver");
   Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","asdzxc"); 
   PreparedStatement ps= conn.prepareStatement("insert into supplier values(?,?,?,?,?,?)");
   ps.setString(1,supid );
   ps.setString(2,supname);
   ps.setString(3,address);
   ps.setString(4,dealer);
   ps.setString(5,phone);
   ps.setString(6,email);
   
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
	 <a href="addproduct.html">+ PRODUCT</a>
	 <a href="addsupplier.html"  style="color:black; background-color:white;  width:100%;  "> + SUPPLIER</a>
	 <a href="addcustomer.html"  > + CUSTOMER</a>
	 <a href="restock.html"  > Restock</a>
	
	 
    </div>
    <div style="width:75%; float:top; margin-left:23vw; background-color:#333333; padding-bottom:3vh;">
	   <h1 style="color:rgb(50,255,50); font-size:150%; margin-left:1.5vw; font-family:cambria;">Add Supplier:</h1>
	   <p style="color:white; font-size:110%; font-family:cambria; margin-left:2vw; margin-top:0vh;"  class="no_hover">To view list of Suppliers <a href="retsupplier1.jsp" 
	   style=" color:rgb(50,200,50);  font-family:cambria;  margin-left:0px;  border:none; width:10%; padding:0px; padding-left:0.25vh; display:inline; text-decoration:underline; 
	   font-size:90%;  "><span style="font-size:120%;">Click here</span> </a> </p> <br>
	   <form  action="storesup1.jsp" method="post" >
	     <label for="gsupid" class="stylabel">Supplier ID: </label>   <input type="text" name="gsupid"  style="margin-left: 3.05vw;"> <br> <br>
		 <label for="gsupname" class="stylabel">Supplier Name:</label>   <input type="text"  name="gsupname" style="margin-left:1vw;"> <br> <br>
		  <div width=100%> 
	       <div width=20%> 
		   <label for="gaddress" class="stylabel" style=" text-align:top; width:10%; float:left;" >Address: </label> 
		   </div> 
		   <textarea name="gaddress" rows="4" cols="30" style="margin-left:2.7vw; "></textarea> <br><br>
		</div> 
		 <label for="gdealer" class="stylabel">Dealer: </label>   <input type="text" name="gdealer"  style=" margin-left:5.75vw; "> <br> <br>
	    <label for="gphone" class="stylabel">Phone No. :</label>   <input type="text" name="gphone" style="margin-left:3.3vw;" maxlength="10"> <br> <br>
	    <label for="gemail" class="stylabel">Email: </label>  <input type="text" name="gemail" style="margin-left:6.25vw;"> <br> <br>
	    <input type="reset" value="Clean"  style="margin-left:40px; " ><input type="submit" value="Register"  style="margin-left:20px;" >  
		<p style="color:white; font-size:100%; margin-left:2vw;">Registration Successful!</p>
		</form>
		
	   
	  </div>
	 </div>
	</body>
</html>