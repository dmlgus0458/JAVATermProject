<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%> 
 <%request.setCharacterEncoding("euc-kr");  %>
 <%@ include file="dbConn.jsp" %>
 <% String nick = (String)session.getAttribute("user_nick"); %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="EUC-KR" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="./mypage.css">
    <link rel="stylesheet" href="./mypage_revise.css" />
  </head>
  <body>
    <header>
      <div>
        <a href="../main/main.jsp">
          <img style="margin-left: 8px;" src="./logo.png" alt="" />
        </a>
      </div>
    </header>
    <aside class="side-bar">
      <a href="./mypage.jsp">
        <div class="side-bar-check" style="color: gray">회원정보 확인</div>
      </a>
<!--       <a href="./mypage_revise.jsp">
        <div class="side-bar-revise" style="color: black">회원정보 수정</div>
      </a> -->
      <a href="./enterpostlist.jsp">
      <div class="side-bar-chatlist" style="color: gray"> 참여한 게시글 목록 </div>
    </a>
    <a href="./mypostlist.jsp">
      <div class="side-bar-my-write" style="color: gray">내가 쓴 게시글</div>
      </a>
      <a href="./likepostlist.jsp">
        <div class="side-bar-my-write" style="color: gray">내가 찜한 게시글</div>
        </a>
        <a href="./unsign_check.jsp">
          <div class="side-bar-my-write" style="color: gray">회원 탈퇴</div>
          </a>
          </aside>
    <main class="user">
        <div>
            <img src="./user.png" alt="">
        </div>
    </main>

<%--     <div class="sign">
        <form action="./reviseAction.jsp" onsubmit="return sendit();" method="post" name="fr">
          <div class="nick">
                <input type="text" name="fnick"  id="user-nick" value="  <%=nick %>"/>            </div>
            <div class="submit">
                <input type="submit" id="sign-submit" value="수정하기" onclick="check()">
            </div>
        </form> --%>

  </body>
</html>