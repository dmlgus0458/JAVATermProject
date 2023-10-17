<%@ page contentType="text/html;charset=euc-kr" import="java.sql.*" %>
<%
 	request.setCharacterEncoding("euc-kr");
	String id = (String)session.getAttribute("user_id");
	String nick = (String)session.getAttribute("user_nick");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<script type="text/javascript">
  		alert("<%=nick %> ¥‘ æ»≥Á«œººø‰");
		  document.location.href="../main/main.jsp";
	</script>
	
</body>
</html>