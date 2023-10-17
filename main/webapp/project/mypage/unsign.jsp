<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
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
String pw = request.getParameter("pw_check");
String id = (String)session.getAttribute("user_id");
%>

<%

		PreparedStatement pstmt2 = null;
    try {
    	String query ="select * from user WHERE pw= '"+pw+"' AND id = '"+id+"' ";
    	String query2 ="delete from user WHERE pw= '"+pw+"' AND id = '"+id+"' ";
    	
    	pstmt = conn.prepareStatement(query);
    	pstmt2 = conn.prepareStatement(query2);
    	ResultSet rs = pstmt.executeQuery();
    	if(rs.next()){
    		pstmt2.executeUpdate();
    		%>
    		 <script>
    		 	alert("탈퇴 완료하였습니다.");
    		 </script>
    		<%
    		session.invalidate();
    		response.setHeader("Refresh", "1;URL=../main/main.jsp?");
    	}else{
    		%>
    		 <script>
    		 	alert("비밀번호를 확인해주세요");
    		 </script>
    		<%
       		response.setHeader("Refresh", "1;URL=delete_revise.jsp?");
    	}
        	
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
	
	
%>

</body>
</html>