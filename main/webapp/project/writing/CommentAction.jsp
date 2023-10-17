<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbConn.jsp" %>
<% request.setCharacterEncoding("euc-kr"); %>

<%
String nick = (String)session.getAttribute("user_nick"); 
String id = (String)session.getAttribute("user_id"); 
String Bno = request.getParameter("Bno");
String Content = request.getParameter("Content");
String c_count = request.getParameter("c_count");
int count = Integer.parseInt(c_count);
try {

String query = "INSERT INTO comment(Bno,nick,Content,cdate)  VALUES('"+Bno+"', '"+nick+"','"+Content+"', now())";
String query2 = "UPDATE board SET c_count = ? WHERE Bno= ?" ;

	
	stmt = conn.createStatement();
	pstmt = conn.prepareStatement(query2);
	int result = stmt.executeUpdate(query);
	
	count++;
	pstmt.setInt(1, count);
	pstmt.setString(2, Bno);
	pstmt.executeUpdate();
	
}

catch (SQLException ex) {
	out.println("����� ����ϴµ� �����߽��ϴ�. <br>");
	out.println("SQLException : " + ex.getMessage());
}

finally {
	if (stmt != null) {
		stmt.close();
	}
	if(conn != null) {
		conn.close();
	}
	/* ������ �ð� ���Ŀ� ����Ʈ �������� �̵� */

	response.setHeader("Refresh", "1;URL=Content.jsp?Bno="+ Bno);
}
%>
