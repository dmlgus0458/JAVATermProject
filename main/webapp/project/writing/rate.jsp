<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbConn.jsp" %>
<% request.setCharacterEncoding("euc-kr"); %>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%
	String Bno = request.getParameter("Bno");
	String rating = request.getParameter("rating");
	String board_id = request.getParameter("board_id");
	int rating_int = Integer.parseInt(rating);
    String sql = "select * from user where id = '"+board_id+"'";

 

    try {
        pstmt = conn.prepareStatement(sql);
        PreparedStatement pstmt2 = null;
        ResultSet rs = pstmt.executeQuery();

  while (rs.next()) {
	  		String rate_count = rs.getString("rate_count");
	  		String rate = rs.getString("rate");
	  		int rate_int = Integer.parseInt(rate);
			int ra_count = Integer.parseInt(rate_count);
			ra_count++;
			String sql2 = "UPDATE user SET rate = ? , rate_count = ? WHERE id= ?" ;	
			pstmt2 = conn.prepareStatement(sql2);
			pstmt2.setInt(1, rate_int += rating_int);
			pstmt2.setInt(2, ra_count);
			pstmt2.setString(3, board_id);
	
		  	pstmt2.executeUpdate();  
    		
    	}
    }
    catch(Exception e) {
    	out.println("½ÇÆĞ <hr>");
        out.println(e.toString());
        e.printStackTrace();
    }
    finally {
        if(pstmt != null) pstmt.close();
        if(conn != null) conn.close();
    }
	response.setHeader("Refresh", "1;URL=Content.jsp?Bno="+ Bno);
%>
</font>
</body>
</html>

</body>
</html>