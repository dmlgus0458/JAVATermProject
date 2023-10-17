<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbConn.jsp" %>
<% request.setCharacterEncoding("euc-kr"); %>

<%
String nick = (String)session.getAttribute("user_nick"); 
String id = (String)session.getAttribute("user_id"); 
String Bno = request.getParameter("Bno");
String Content = request.getParameter("Content");
String recruit_count = request.getParameter("recruit_count");
String recruit= request.getParameter("recruit");

int r_count = Integer.parseInt(recruit_count);
try {

String query = "INSERT INTO enter(Eno,eid,Available)  VALUES('"+Bno+"', '"+id+"', '"+1+"')";
String query2 = "UPDATE board SET recruit_count = ? WHERE Bno= ?" ;

	Statement stmt2 = null;
	stmt = conn.createStatement();
	pstmt = conn.prepareStatement(query2);
%>
<%
	if(recruit.equals(recruit_count)){
%>
	
	<script type="text/javascript">
  		alert("모집 인원이 다 찼습니다");
	</script>
<% 
	}else{
		
	r_count++;
	pstmt.setInt(1, r_count);
	pstmt.setString(2, Bno);
	int result = stmt.executeUpdate(query);
	pstmt.executeUpdate();
%>
<% 	
	}
%>
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
