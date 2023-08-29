<%@page import="java.sql.*"%>
<%

String proid=request.getParameter("proid");

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","asdzxc");
	PreparedStatement ps=conn.prepareStatement("delete from tempstock where proid=?");
	ps.setString(1,proid);
	ps.executeQuery();
	response.sendRedirect("storetransc.jsp");
	conn.close();
	}
	catch (Exception e) {
			out.print(e);
		e.printStackTrace();
		}
%>		