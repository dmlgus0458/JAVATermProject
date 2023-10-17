<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbConn.jsp" %>
<% request.setCharacterEncoding("euc-kr"); %>

<%
String Bno = request.getParameter("Bno");
String status = request.getParameter("status");


try {

String query = "UPDATE board SET status = ? WHERE Bno= ?" ;

	pstmt = conn.prepareStatement(query);
	pstmt.setString(1, "1");
	pstmt.setString(2, Bno);
	pstmt.executeUpdate();
	//out.println("게시물을 등록했습니다.");
}

catch (SQLException ex) {
	out.println("댓글을 등록하는데 실패했습니다. <br>");
	out.println("SQLException : " + ex.getMessage());
}

finally {
	if (stmt != null) {
		stmt.close();
	}
	if(conn != null) {
		conn.close();
	}
	/* 지정한 시간 이후에 리스트 페이지로 이동 */

	response.setHeader("Refresh", "1;URL=Content.jsp?Bno="+ Bno);
}
%>
