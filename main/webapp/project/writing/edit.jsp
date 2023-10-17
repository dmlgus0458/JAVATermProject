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
	번호: <%= rs.getString("Bno") %><br>
	Title: <input type="text" name="fTitle" value="<%= rs.getString("Title") %>"><br>
	recruit: <input type="number" name="recruit" min="2" max="4" value="<%= rs.getString("Title") %>"><br>
	price: <input type="number" name="price" min="1000" max="999999" value="<%= rs.getString("price") %>"><br>
	place: <input type="text" name="place"value="<%= rs.getString("place") %>"><br>
	Content: <input type="text" name="fContent" value="<%= rs.getString("Content") %>"><br>
	<input type="submit" value="수 정">
	<input type="reset" value="취 소">
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
		out.println("수정된 결과가 없습니다.");
	else 
		out.println("수정된 결과가 " + rowCount + "건 입니다.");    
%>
</font>
</body>
</html>