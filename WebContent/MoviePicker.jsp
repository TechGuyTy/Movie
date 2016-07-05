<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="main.css" rel="stylesheet">
<title>Product List</title>
</head>
<body>
	<%
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		String url = "jdbc:mysql://localhost:3306/movieList";
		//DO NOT include this info in .java files pushed to GitHub in real projects
		String user = "java";
		String password = "java123";
		try {
			
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con = DriverManager.getConnection(url, user, password);
			st = con.createStatement();
			String query = "SELECT MovieID, Title, Genre, Actors, Year FROM movies";
			rs = st.executeQuery(query);

			%><table border="1"><%

			
			while (rs.next()) {
	%>

	<TR>
		<TD><%=rs.getInt(1)%></TD>
		<TD><%=rs.getString(2)%></TD>
		<TD><%=rs.getString(3)%></TD>
		<TD><%=rs.getString(4)%></TD>
		<TD><%=rs.getInt(5)%></TD>
	</TR>
	<%
		}

		} catch (SQLException e) {
			out.println("DB Exception: " + e);
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (st != null) {
					st.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (SQLException e) {
				out.println("DB Exception in finally: " + e);
			}
		}
	%>
	<form name="form1" action="category.jsp" method="get">