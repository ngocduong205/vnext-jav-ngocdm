<%@page import="javax.sound.midi.Soundbank"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%
		String username =request.getParameter("use"); 
		String password =request.getParameter("password"); 
		Class.forName("com.mysql.jdbc.Driver"); 
		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demologin","root","ngocke12"); 
		Statement st= con.createStatement(); 
		ResultSet rs=st.executeQuery("select * from accounts where _Username ='"+ username +"' and _Password ='" + password + "'"); 
		while(rs.next())
        {
	        String user=rs.getString(1);
	        String pass=rs.getString(2);
	        if(username.equals(username) && password.equals(password)){
	            session.setAttribute("vnext","Vnext");
	          //  response.sendRedirect("http://localhost:3306/registration/welcome.jsp");
	          response.sendRedirect("index.jsp");
				
	        }
            else{
           // response.sendRedirect("http://localhost:3306/registration/error.jsp");
        	System.out.print("error");  	
           }
    }
	%>
</body>
</html>