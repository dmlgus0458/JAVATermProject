<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ include file="dbConn.jsp" %>
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
<link rel="stylesheet" href="./search.css">
</head>
<body>

<%	String word = request.getParameter("word");
    String sql = "select * from board where Title LIKE '%"+word+"%'";
    int rowCount = 0;

    try {
        pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();
%>
<nav id="navigation_bar">
  <div>
    <button><a href="./write.jsp">글 쓰기</a></button>
    <button><a href="./list.jsp">글 목록 보러가기</a></button>
    <button>내 글 보러가기</button>
  </div>
</nav>
<div id="logo"><a href="../main/main.jsp"><img src="./img/logo.png" alt=""></a></div>
	    <!-- 검색창 -->
      <form action="search.jsp" method="post" class="search_form">
        <input type="text" name="word" placeholder="  검색어를 입력하세요" class="search_form_text">
        <input type="image" src="./search.png" name="Submit" value="Submit" class="search-btn">
    </form>	
	<br>
  

  <table border=1 cellpadding=1>
    <tr class="head">
      <th width=50>번호</th>
      <th width=120>제목</th>
      <th width=80>글쓴이</th>
      <th width=80>닉네임</th>
      <th width=80>모집인원</th>
      <th width=80>배달비</th>
      <th width=110>위치</th>
      <th width=150>게시글 시간</th>
      <th width=200>내용</th>
    </tr>
<%
  while (rs.next()) {
%>
  <tr>
    <td align=center><%= rs.getString("Bno") %></td>
    <td align=center><a href="Content.jsp?Bno=<%= rs.getString("Bno") %>"><%= rs.getString("Title") %></a></td>
    <td align=center><%= rs.getString("id") %></td>
    <td align=center><%= rs.getString("nick") %></td>
    <td align=center><%= rs.getString("recruit") %></td>
    <td align=center><%= rs.getString("price") %></td>
    <td align=center><%= rs.getString("place") %></td>
    <td align=center><%= rs.getString("sdate") %></td>
    <td align=center><%= rs.getString("Content") %></td>
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
<p><hr>
</body>
</html>