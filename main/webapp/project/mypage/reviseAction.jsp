<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ include file="dbConn.jsp" %>
<% request.setCharacterEncoding("euc-kr"); %>

<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
</head>
<body>
<%
    StringBuffer SQL = new StringBuffer("update board "); 
    SQL.append("set fnick=?");
  	String fnick = request.getParameter("nick");
    try {
    	
        pstmt = conn.prepareStatement(SQL.toString());
        
        pstmt.setString(1, request.getParameter("fnick"));


        int rowCount = pstmt.executeUpdate();     
    	if (rowCount == 1) out.println("<hr>[" + fnick +"] 게시물에 삽입 되었습니다.<hr>");
        else out.println("레코드 삽입에 문제가 있습니다."); 
  
       
        stmt = conn.createStatement();

    }
    catch(Exception e) {
    	out.println("editAction <hr>");
        out.println(e.toString());
        e.printStackTrace();
    }
    finally {
        if(pstmt != null) pstmt.close();
        if(conn != null) conn.close();
    }
	response.setHeader("Refresh", "1;URL=mypage_revise.jsp?");
%>

<p><hr>
</body>
</html>