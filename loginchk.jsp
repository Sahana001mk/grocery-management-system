 <%@page import="java.sql.*"%>
		 
		<%
			String username=request.getParameter("busername");	
			String password=request.getParameter("bpassword");	
			if((username.equals("admin")&&password.equals("qwert")))
			{
				response.sendRedirect("groceryhome.html");
			}
			else if((username.equals("user")&&password.equals("asdzxc")))
			{
				response.sendRedirect("userhome.html");
			}
			else
			{
				response.sendRedirect("loginfail.html");
			}
		%>