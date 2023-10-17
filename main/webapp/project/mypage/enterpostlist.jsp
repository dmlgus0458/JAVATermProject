<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ include file="dbConn.jsp" %>
  <%@ include file="../navbar/navbar.jsp" %>
<% 
request.setCharacterEncoding("euc-kr");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="euc-kr">
<title>Insert title here</title>
	<script src="js/bootstrap.js"></script>
		<script src="//code.jquery.com/jquery.min.js"></script>
<style>
table,tr,td {
	border: 1px solid black;
	border-collapse: collapse;
}
</style>
<link rel="stylesheet" href="./mypage.css" />
<link rel="stylesheet" href="../navbar/navibar.css">
<link rel="stylesheet" href="../search/search.css">
<link rel="stylesheet" href="./list.css">
</head>
<body>
  <header>
    <div>
      <a href="../main/main.jsp">
        <img src="./logo.png" alt="" />
      </a>
    </div>
  </header>
  <aside class="side-bar">
    <a href="./mypage.jsp">
      <div class="side-bar-check" style="color: gray">회원정보 확인</div>
    </a>
    <a href="./enterpostlist.jsp">
    <div class="side-bar-chatlist" style="color: black"> 참여한 게시글 목록 </div>
  </a>
  <a href="./mypostlist.jsp">
    <div class="side-bar-my-write" style="color: gray">내가 쓴 게시글</div>
    </a>
    <a href="./likepostlist.jsp">
      <div class="side-bar-my-write" style="color: gray">내가 찜한 게시글</div>
      </a>
      <a href="./delete_revise.jsp">
        <div class="side-bar-my-write" style="color: gray">회원 탈퇴</div>
        </a>
        </aside>

<%	
	String user_id = (String)session.getAttribute("user_id"); 
	String sql = "SELECT * FROM board JOIN enter ON board.Bno =enter.Eno AND enter.eid = '"+user_id+"'"; 
	
    int rowCount = 0;

    try {
        pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();
%>
    <br>
    <!-- 검색창 -->
    <%@ include file="../search/search.jsp" %>
    <br><br>
      <table cellpadding=1>
        <tr class="head">
          <th width=120>제목</th>
          <th width=80>글쓴이<br>닉네임</th>
          <th width=80>모집인원</th>
          <th width=80>배달비</th>
          <th width=110>위치</th>
          <th width=150>게시글 시간</th>
        </tr>
<%
  while (rs.next()) {
%>
<tr class="table_ing">
  <td align=center><a href="../writing/Content.jsp?Bno=<%= rs.getString("Bno") %>"><%= rs.getString("Title") %></a></td>
  <td align=center><%= rs.getString("nick") %></td>
  <td align=center><%= rs.getString("recruit") %></td>
  <td align=center><%= rs.getString("price") %></td>
  <td align=center><%= rs.getString("place") %></td>
  <td align=center><%= rs.getString("sdate") %></td>
</tr>
<%
	rowCount++;
    }
    rs.close();        
    }
    catch(Exception e) {
    	out.println("list 조회에 문제가 있습니다. <hr>");
        out.println(e.toString());
        e.printStackTrace();
    }
    finally {
        if(pstmt != null) pstmt.close();
        if(conn != null) conn.close();
    }
%>
</table>
</center>

<hr>
</body>
</html>