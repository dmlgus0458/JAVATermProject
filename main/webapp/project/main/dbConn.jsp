<%@ page language="java" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.*" %>


<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	Statement stmt = null;

	try {

		String url = "jdbc:mysql://localhost:3306/mysql06?serverTimezone=Asia/Seoul&characterEncoding=UTF-8";
			String userId = "root";
			String userPw = "kbc0924";
			//Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, userId, userPw);
	}
	catch (SQLException ex) {
		out.println("db error");
		out.println("SQLException: " + ex.getMessage());
	}
	%>
</body>
</html>