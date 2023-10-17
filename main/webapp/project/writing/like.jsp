<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbConn.jsp" %>
<% request.setCharacterEncoding("euc-kr"); %>

<%
String nick = (String)session.getAttribute("user_nick"); 
String id = (String)session.getAttribute("user_id"); 
String Bno = request.getParameter("Bno");
//PreparedStatement pstmt2 = null;


try {

String query = "INSERT INTO likepost(Lno,lid,likeA)  VALUES('"+Bno+"', '"+id+"', '"+1+"')";
//String query2 = "delete liekpost WHERE Lno= '"+Bno+"' AND lid = '"+id+"'";

	pstmt = conn.prepareStatement(query);
	//pstmt2 = conn.prepareStatement(query2);
	pstmt.executeUpdate();
%>

<script type="text/javascript">
  		alert("찜목록에 추가 되었습니다");
	</script>

<% 	
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
