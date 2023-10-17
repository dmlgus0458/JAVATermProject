<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbConn.jsp" %>
<% request.setCharacterEncoding("euc-kr"); %>


<%
String nick = (String)session.getAttribute("user_nick"); 

String id = (String)session.getAttribute("user_id"); 
String Title = request.getParameter("Title");
String recruit = request.getParameter("recruit");
String price = request.getParameter("price");
String place = request.getParameter("place");
String category = request.getParameter("category");
String Content = request.getParameter("Content");

try {

String query = "INSERT INTO board(Title,nick,id,recruit, price, place, category, sdate, Content, recruit_count,review,review_count ,status, c_count )  VALUES('"+Title+"','"+nick+"','"+id+"','"+recruit+"','"+price+"','"+place+"', '"+category+"', now(), '"+Content+"' ,'"+1+"','"+recruit+"','"+1+"', '"+0+"', '"+0+"')";
	
	stmt = conn.createStatement();
	/* exeuteUpdate - select 외 create, drop, insert, delete, update 실행시 사용 */
	int result = stmt.executeUpdate(query);
	//out.println("게시물을 등록했습니다.");
}

catch (SQLException ex) {
	out.println("게시물을 등록하는데 실패했습니다. <br>");
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
	response.setHeader("Refresh", "1;URL=list.jsp");
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
</head>
<body>
	<script type="text/javascript">
		alert("게시물을 등록했습니다.");
  </script>
</body>
</html>