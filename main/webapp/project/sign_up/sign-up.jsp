<%@ page contentType="text/html;charset=euc-kr" import="java.sql.*" %>
<%
 request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="EUC-KR">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./sign-up.css">
   
    
</head>
<body>
    <main>
        <div class="sign">
            <h1><a href="../main/main.jsp"><img src="./logo.png" alt=""></a></h1>
            <form action="join.jsp" onsubmit="return sendit();" method="post" name="fr">
                <div class="id">
                    <input class="form-control" name="id" id="user-id" placeholder=" 아이디" onclick="idCheck()" readonly/>
                </div>
                <div class="email">
                    <input type="text" name="email"  id="user-email" placeholder="  이메일" style="width: 350px;">
                    <!-- <span style="font-weight: bold;"> @ </span> 
                    <select id="email-dropdown">
                        <option value="naver">naver.com</option>
                        <option value="gmail">gmail.com</option>
                        <option value="daum">daum.net</option>
                    </select> -->
                </div>
                <div class="nick">
                    <input type="text" name="nick"  id="user-nick" placeholder="  닉네임" onclick="nickCheck()" readonly>
                </div>
                <div class="pw">
                    <input type="password" name="pw"  id="user-pw" placeholder="  비밀번호">
                    <input type="password" name="pw_check"  id="user-pw-check" placeholder="  비밀번호 확인">
                </div>
                <div class="submit">
                    <input type="submit" id="sign-submit" value="Sign Up" onclick="check()">
                </div>
            </form>
            
        </div>
    </main>
    <script src="./sign-up.js"></script>
    <script>
        function idCheck() {
            window.open("idCheckForm.jsp", "id", "width=600, height=400");
        }
        function nickCheck() {
            window.open("nickCheckForm.jsp", "nick", "width=600, height=400");
        }
    </script>
    
</body>
</html>