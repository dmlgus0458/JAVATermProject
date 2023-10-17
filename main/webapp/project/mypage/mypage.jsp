<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%> 
 <%
 request.setCharacterEncoding("euc-kr"); 
 String nick = (String)session.getAttribute("user_nick"); 
 String id = (String)session.getAttribute("user_id"); 
  %>
 <%@ include file="dbConn.jsp" %>
 <%
 String sql= "SELECT AVG(rate) as Avgrate FROM review where Bid= '"+id+"'";
 pstmt = conn.prepareStatement(sql);
 ResultSet rs = pstmt.executeQuery();
 while(rs.next()){
	 String avg = rs.getString("Avgrate") ;
 %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="EUC-KR" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="./mypage.css" />
    <link rel="stylesheet" href="../navbar/navibar.css">
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
        <div class="side-bar-check" style="color: black">회원정보 확인</div>
      </a>
      <a href="./enterpostlist.jsp">
      <div class="side-bar-chatlist" style="color: gray"> 참여한 게시글 목록 </div>
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
    <main class="main">
      <table class="table">
        <tr>
          <td>
            <div>
              <img src="./user.png" alt="" />
            </div>
          </td>
          <td>
            <div class="main-title">
              <div class="name"><%=nick %></div>
            </div>
          </td>
        </tr>

      </table>
      <hr />
      <section class="relibility-main">
        <div class="relibility">내 신뢰도 확인</div>
        <table>
          <tr>
            <td>
              <div class="relibility_check">
                <div class="relibility_intro"><%=nick %> 님의 신뢰도는 </div>
              </div>
            </td>
            <td>
              <div class="relibility_check">
              <%
              	              	if(avg == null){
              %>
                <div class="temperature">아직 후기가 없습니다</div>
               <%
              	}else{
               %>
               	<div class="temperature"><%= rs.getString("Avgrate") %> 점</div>
               <%
              	}
               %>
              </div>
            </td>
          </tr>
        </table>
      </section>
    </main>
  </body>
</html>
<%
 }
%>
