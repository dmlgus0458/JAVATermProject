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
    String sql = "select * from board where Bno = " + Bno;
    int rowCount = 0;

    try {
        pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();

  while (rs.next()) {
%>
	<form method="post" action="editAction.jsp?Bno=<%= rs.getString("Bno") %>">
	��ȣ: <%= rs.getString("Bno") %><br>
	Title: <input type="text" name="fTitle" value="<%= rs.getString("Title") %>"><br>
	recruit: <input type="number" name="recruit" min="2" max="4" value="<%= rs.getString("Title") %>"><br>
	price: <input type="number" name="price" min="1000" max="999999" value="<%= rs.getString("price") %>"><br>
	place: <input type="text" name="place"value="<%= rs.getString("place") %>"><br>
	Content: <input type="text" name="fContent" value="<%= rs.getString("Content") %>"><br>
	<input type="submit" value="�� ��">
	<input type="reset" value="�� ��">
	</form>
<%
	rowCount++;
    }
  	 rs.close();        
    }
    catch(Exception e) {
    	out.println("edit <hr>");
        out.println(e.toString());
        e.printStackTrace();
    }
    finally {
        if(pstmt != null) pstmt.close();
        if(conn != null) conn.close();
    }
%>


<p><hr>
<font color=blue>
<%
	if (rowCount == 0) 
		out.println("������ ����� �����ϴ�.");
	else 
		out.println("������ ����� " + rowCount + "�� �Դϴ�.");    
%>
</font>
</body>
</html>