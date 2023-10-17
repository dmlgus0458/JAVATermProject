<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%> 

  <% request.setCharacterEncoding("euc-kr"); 
  String id=(String)session.getAttribute("user_id"); 
  String nick=(String)session.getAttribute("user_nick"); %> 
 
 
    <!DOCTYPE html>
    <html lang="ko">

    <head>
      <meta charset="EUC-KR" />
      <meta http-equiv="X-UA-Compatible" content="IE=edge" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>Document</title>
      <link rel="stylesheet" href="../navbar/navibar.css">
      <link rel="stylesheet" href="./main.css" />
      <link rel="stylesheet" href="../search/search.css">
      <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" />
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	  <link rel="icon" type="image/png" sizes="40x40" href="./sitelogo.png">
    </head>

    <body>
    	<script type="text/javascript">
		alert("댓글을 등록했습니다.");
  </script>
        <%
           if (id == null){
      %>
    <header id="header">
        <span><a href="../login/login.jsp">로그인</a></span>
      <span> | </span>
      <span><a href="../sign_up/sign-up.jsp">회원가입</a></span>
    </header>
      <%
           }else{
      %>
	 <%@ include file="../navbar/navbar.jsp" %>
     <header id="header">
      <span class="nickname">
      <%=nick %>님 ▼
      <div class="dropdown-content">
        <a href="../mypage/mypage.jsp">마이페이지</a>
      </div>
      </span>
      <span> | </span>
      <span><a href="./main_logout.jsp">로그아웃</a></span>
    </header>
      <% 
           }
       %>
      <div id="logo"><a href="./main.jsp"><img src="./logo.png" alt=""></a></div>
      <section id="banner">
        <div class="banner_img">
          <img src="./main_banner.png" alt="" />
        </div>
      </section>
      <hr />
            <!-- 검색창 -->
            <%@ include file="../search/search.jsp" %>	
      <main class="category">
        <table>
          <tr>
            <form action="../main/category.jsp" method="post">
       		<td><input type="image"  class="category1" src="./chicken.png" width="160px"/></td>
        	<input type="hidden" name="category"  value='chicken' />
        	</form>
        	<form action="../main/category.jsp" method="post">
       		<td><input type="image"  class="category2" src="./hamburger.png" width="140px"/></td>
        	<input type="hidden" name="category"  value='hamburger' />
        	</form>
        	<form action="../main/category.jsp" method="post">
       		<td><input type="image"  class="category3" src="./pizza.png" width="140px"/></td>
        	<input type="hidden" name="category"  value='pizza' />
        	</form>  
        	<form action="../main/category.jsp" method="post">
       		<td><input type="image"  class="category4" src="./sushi.png" width="150px"/></td>
        	<input type="hidden" name="category"  value='sushi' />
        	</form>              
          </tr>
          <tr>
            <form action="../main/category.jsp" method="post">
       		<td><input type="image"  class="category5" src="./schoolfood.png" width="220px"/></td>
        	<input type="hidden" name="category"  value='schoolfood' />
        	</form>
        	<form action="../main/category.jsp" method="post">
       		<td><input type="image"  class="category6" src="./meat.png" width="140px"/></td>
        	<input type="hidden" name="category"  value='meat' />
        	</form>
        	<form action="../main/category.jsp" method="post">
       		<td><input type="image"  class="category7" src="./chinese.png" width="180px"/></td>
        	<input type="hidden" name="category"  value='chinese' />
        	</form>  
        	<form action="../main/category.jsp" method="post">
       		<td><input type="image"  class="category8" src="./dessert.png" width="140px"/></td>
        	<input type="hidden" name="category"  value='dessert' />
        	</form> 
          </tr>
        </table>
      </main>
       <%@ include file="../footer/footer.jsp" %>
    </body>

    </html>