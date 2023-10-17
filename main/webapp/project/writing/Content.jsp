<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
    <%@ page import="java.sql.*"%>
    <%@ page import="javax.sql.*"%>
    <%@ page import="javax.naming.*"%>
    <%@ include file="dbConn.jsp" %>
    <% request.setCharacterEncoding("euc-kr"); %>
    <%@ include file="../navbar/navbar.jsp" %>
    <%
    String nick = (String)session.getAttribute("user_nick"); 
    String id = (String)session.getAttribute("user_id");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="euc-kr">
<title>Insert title here</title>
<link rel="stylesheet" href="Content.css">
<link rel="stylesheet" href="../navbar/navibar.css">
<link rel="stylesheet" href="./review/star.css"/>
<link rel="stylesheet" href="./review/review.css"/>
</head>
<body>
          <div id="logo"><a href="../main/main.jsp"><img src="./img/logo.png" alt=""></a></div>
  <div class="contents">
<%
	String Bno = request.getParameter("Bno");
	String Cno = request.getParameter("Cno");
    String sql = "select * from board where Bno= " + Bno;
   	String sql2 = "select * from comment where Bno= " + Bno; 
   	String sql3 = "select * from enter where Eno= '"+Bno+"' AND eid= '"+id+"'"  ; 
	String sql4 = "select * from likepost where Lno= '"+Bno+"' AND lid= '"+id+"'";
    try {
    	PreparedStatement pstmt2 = null;
    	PreparedStatement pstmt3 = null;
    	PreparedStatement pstmt4 = null;  	
        pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery(sql);
    	pstmt2 = conn.prepareStatement(sql2);
        ResultSet rs2 = pstmt2.executeQuery(sql2); 
    	pstmt3 = conn.prepareStatement(sql3);
        ResultSet rs3 = pstmt3.executeQuery(sql3); 
    	pstmt4 = conn.prepareStatement(sql4);
        ResultSet rs4 = pstmt4.executeQuery(sql4); 
  while (rs.next()) {
%>
<%
	String board_id = rs.getString("id");
	String recruit_count = rs.getString("recruit_count");
	String recruit = rs.getString("recruit");
	String status = rs.getString("status");
	String user_id = (String)session.getAttribute("user_id"); 
    String review = rs.getString("review");
	String review_count = rs.getString("review_count");
	String c_count = rs.getString("c_count");
%>	
<div class="main">
    <div class="top">
        <span class="no">no : <%= rs.getInt("Bno") %></span>
        <div class="title">
            <span><%= rs.getString("Title")%></span>
        </div>
        <span style="font-size: 13px; float: right;"><%= rs.getString("sdate") %></span>
        
        
        <div class="num_nick">
            <span class="nick">
                <img src="./img/user.png" alt="user" style="vertical-align: middle;"/>&nbsp;&nbsp; 
                <a href="reviewlist.jsp?id=<%= rs.getString("id") %>&Bno=<%= rs.getString("Bno") %>"><%= rs.getString("nick") %></a><br>        
            </span>
        </div>
        <hr>
        <div class="edt">
            <span> 장소 : <%= rs.getString("place") %></span> &nbsp;&nbsp;
            <span> 가격 : <%= rs.getString("price") %> 원</span>
        </div>     
    </div>
    <div class="content">
        <%= rs.getString("Content") %>
    </div>
    <div class="cate">
        <span># <%= rs.getString("category")%></span>
    </div>
</div>

 
<%
	 if(user_id.equals(board_id)){	
%>
<div id="writer_right">
    
<a class="delete" href="delete.jsp?Bno=<%= rs.getString("Bno") %>">게시글삭제</a>
<a class="writeedit" href="edit.jsp?Bno=<%= rs.getString("Bno") %>">게시글수정</a>

</div>
<%
if(recruit.equals(recruit_count)){
%>
<%
    if(status.equals("0")){
%>
 <form action="./status.jsp" method="post">
<div id="rate"> 
    <input class="rate_input" type="submit" value="모집 종료">
    <input type="hidden" name="Bno" value="<%=Bno %>"><br>
    <input type="hidden" name="status" value="<%=status %>"><br>
            <br> <br> 	
</div>
</form>
<%
    }
%>
<%
}
%>

<br>
<br><br>
<div class="bottom">
<div class="writeComment">
    <div>
          <span style="font-weight: 600;">댓글 <%= c_count %>개</span>
    </div>
    <form action="./CommentAction.jsp" method="post">
        <div id="comment"> 
          <textarea name="Content" rows="5" cols="50" placeholder="give a reply!!"></textarea>
          <input class="comment_register" type="submit" value="댓글 쓰기">
          <input type="hidden" name="Bno" value="<%= Bno %>">
          <input type="hidden" name=c_count value="<%= c_count %>">
        </div>
    </form>
	</div>
</div>      

<% 
    }else if(review.equals(review_count)){
    
%>
	<script type="text/javascript">
  		alert("already end up post");
	</script>
<%
response.setHeader("Refresh", "1;URL=list.jsp");

%>	
<%
    }else{
%>
	
	 	<%
 			if(status.equals("1")){
 		%>
 		<form action="./review.jsp" method="post">
            <script type="text/javascript" src="./review/review.js"></script>
            <div class="mb-3" id="myform">
                <div class="text-bold">Review</div>
                <fieldset>
                    <input type="radio" name="rating" value="5" id="rate1"><label for="rate1">★</label>
                    <input type="radio" name="rating" value="4" id="rate2"><label for="rate2">★</label>
                    <input type="radio" name="rating" value="3" id="rate3"><label for="rate3">★</label>
                    <input type="radio" name="rating" value="2" id="rate4"><label for="rate4">★</label>
                    <input type="radio" name="rating" value="1" id="rate5"><label for="rate5">★</label>
                    <input type="hidden" name="Bid" value="<%=board_id %>"><br>
                    <input type="hidden" name="Bno" value="<%=Bno %>"><br>
                    <input type="hidden" name="review" value="<%=review %>"><br>
                    <input type="hidden" name="review_count" value="<%=review_count%>"><br>
                </fieldset>
                <div>
                    <textarea class="col-auto form-control" type="text" name="Rcontent" id="reviewContents"
                        placeholder="좋은 리뷰를 남겨주시면 큰 힘이 됩니다! "></textarea>
                </div>
                <div class="cmd">
                    <input type="submit" name="save" id="save" value="등록">
                </div>
            </div>
        
 		</form>
		<%
	 	}
		%>
		<%
 			if(status.equals("0")){
 		%>
 	 <form action="./Enter.jsp" method="post">
        <div id="Enter"> 
             <input type="submit" value="참여하기" class="enterBtn">
             <input type="hidden" name="Bno" value="<%=Bno %>"><br>
             <input type="hidden" name="recruit_count" value="<%=recruit_count %>"><br>
             <input type="hidden" name="recruit" value="<%=recruit %>"><br>
        </div>
 	</form>
	 	<%
		 	}
	 	%>
	 	
<% 
    }
%>

<%
	 if(!user_id.equals(board_id)){	
%>     
<% 
if(rs4.next()){   
    String likeA = rs4.getString("likeA");
%> 
<%
    if(likeA.equals("1")){
%>
      <form action="./unlike.jsp" method="post">
    <div id="unlike"> 
         <input type="submit" value="찜 목록에서 삭제하기" class="likeBtn">
         <input type="hidden" name="Bno" value="<%=Bno %>"><br>
         <br> <br> 	
    </div>
     </form>
<%
    }
%>
<%
}else{
%>
<form action="./like.jsp" method="post">
    <div id="like"> 
         <input type="submit" value="찜 목록에 추가하기" class="likeBtn">
         <input type="hidden" name="Bno" value="<%=Bno %>"><br>
         <br> <br> 	
    </div>
</form>

<%
}
%>  

<%
}
%>  
<% 
    while(rs3.next()){   
    	String Available = rs3.getString("Available");
%>
	                   
<%
	if(Available.equals("1")){
%>    
	<%
		 if(!user_id.equals(board_id)){	
	%> 
<div class="bottom">
<div class="writeComment">
    <div>
        <span style="font-weight: 600;">댓글 <%= c_count %>개</span>
    </div>
    <form action="./CommentAction.jsp" method="post">
        <div id="comment"> 
          <textarea name="Content" rows="5" cols="50" placeholder="give a reply!!"></textarea>
          <input class="comment_register" type="submit" value="댓글 쓰기">
          <input type="hidden" name="Bno" value="<%= Bno %>">
          <input type="hidden" name=c_count value="<%= c_count %>">
        </div>
    </form>
	</div>
</div>
	 	<%
		    }
		%> 
	<%
	    }
	%>  
<%
    }
%>  

<% 
        while(rs2.next()){
%>
  <div id="comment_table_div">
        <table cellpadding=1 class="comment_table">
            <tr>
                <td style="font-weight: 800;">
                    [<%= rs2.getString("nick") %>]
                </td>
                <td class="comment_table_content">
                    <div><%= rs2.getString("Content") %></div>
                </td>
                <td align=center><%= rs2.getString("cdate") %></td>
                <td style="border: 0px solid;">
                    <form action="./Comment_delete.jsp" method="post" id="comment_delete">
                        <div>
                            <input type="submit" value="댓글 삭제" class="delete">
                            <input type="hidden" name="Bno" value="<%=Bno%>"><br>
                            <input type="hidden" name="Cno" value="<%=rs2.getString("Cno")%>"><br>
                            <input type="hidden" name=c_count value="<%= c_count %>">
                            
                        </div>
                    </form>
                </td>
            </tr>
        </table>
     </div>
  
	 
	  
<%
    }
%>

<%
	//rowCount++;
        
    }
    }
    catch(Exception e) {
    	out.println("error occured <hr>");
        out.println(e.toString());
        e.printStackTrace();
    }
    finally {
        if(pstmt!= null) pstmt.close();
        
        if(conn != null) conn.close();
    }
%>





</body>
</html>


