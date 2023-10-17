<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ include file="dbConn.jsp" %>
<% request.setCharacterEncoding("euc-kr"); %>
<%@ include file="../navbar/navbar.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="euc-kr">
<title>Insert title here</title>
<link rel="stylesheet" href="./list.css">
<link rel="stylesheet" href="../navbar/navibar.css">
</head>
<body>
<%
    String sql = "select * from board";
    int rowCount = 0;

    try {
        pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();
%>

<div id="logo"><a href="../main/main.jsp"><img src="./img/logo.png" alt=""></a></div>
	    <!-- 검색창 -->
      <!-- 검색창 -->
      <%@ include file="../search/search.jsp" %>	
	<br>
  <table cellpadding=1>
    <tr class="head">
      <th width=200>제목</th>
      <th width=80>글쓴이</th>
      <th width=80>모집현황</th>
      <th width=80>가격</th>
      <th width=110>위치</th>
      <th width=150>게시글 시간</th>
    </tr>
    <%
    while (rs.next()) {
     String status = rs.getString("status");
  %>
    <%
        if(status.equals("0")) {
    %>
    <tr class="table_ing">
        <td align=center><a href="Content.jsp?Bno=<%= rs.getString("Bno") %>"><%= rs.getString("Title") %></a></td>
        <td align=center><%= rs.getString("nick") %></td>
        <td align=center><%= rs.getString("recruit_count") %> / <%= rs.getString("recruit") %> 명</td>
        <td align=center><%= rs.getString("price") %> 원</td>
        <td align=center><%= rs.getString("place") %></td>
        <td align=center><%= rs.getString("sdate") %></td>
    </tr>
    <!--  -->
    <%
        }else{
    %>
    <tr class="table_end"> 
        <td align=center><%= rs.getString("Title") %></td>
        <td align=center><%= rs.getString("nick") %></td>
        <td align=center><%= rs.getString("recruit_count") %> / <%= rs.getString("recruit") %> 명</td>
        <td align=center><%= rs.getString("price") %> 원</td>
        <td align=center><%= rs.getString("place") %></td>
        <td align=center><%= rs.getString("sdate") %></td>
     </tr>
    
    <%
        }
    %>
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

</body>
</html>