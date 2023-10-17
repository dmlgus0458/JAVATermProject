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
%>

<%


    try {
    	String query = "delete from board where Bno = " + Bno;
    	
    	stmt = conn.createStatement();
    	/* exeuteUpdate - select 외 create, drop, insert, delete, update 실행시 사용 */
    	int result = stmt.executeUpdate(query);
  		%>
		 <script>
		 	alert("게시물을 삭제했습니다.");
		 </script>
		<%
    	//out.println("게시물을 등록했습니다.");
    }
    catch(Exception e) {
    	out.println("삭제에 문제가 있습니다. <hr>");
        out.println(e.toString());
        e.printStackTrace();
    }
    finally {
        if(pstmt != null) pstmt.close();
        if(conn != null) conn.close();
    }
	response.setHeader("Refresh", "1;URL=list.jsp");
	
%>

</body>
</html>