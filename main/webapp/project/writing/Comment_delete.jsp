<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbConn.jsp" %>
<% request.setCharacterEncoding("euc-kr"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
String Bno = request.getParameter("Bno");
String Cno = request.getParameter("Cno");
String c_count = request.getParameter("c_count");
int count = Integer.parseInt(c_count);
%>

<%


    try {
    	String query = "delete from comment where Cno = " + Cno;
    	String query2 = "UPDATE board SET c_count = ? WHERE Bno= ?" ;
    	
    	stmt = conn.createStatement();
    	/* exeuteUpdate - select �� create, drop, insert, delete, update ����� ��� */
    	int result = stmt.executeUpdate(query);
    	pstmt = conn.prepareStatement(query2);
    	
    	count--;
    	pstmt.setInt(1, count);
    	pstmt.setString(2, Bno);
    	pstmt.executeUpdate();
    	
    	//out.println("�Խù��� ����߽��ϴ�.");
    }
    catch(Exception e) {
    	out.println("������ ������ �ֽ��ϴ�. <hr>");
        out.println(e.toString());
        e.printStackTrace();
    }
    finally {
        if(pstmt != null) pstmt.close();
        if(conn != null) conn.close();
    }
	response.setHeader("Refresh", "1;URL=Content.jsp?Bno="+Bno);
	
%>

</body>
</html>