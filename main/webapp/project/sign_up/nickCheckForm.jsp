<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("EUC-KR"); %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="euc-kr" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>ID Check</title>
    <link href="./css/styles.css" rel="stylesheet" />
</head>

<body class="bg-white">
    <div id="layoutAuthentication">
        <div id="layoutAuthentication_content">
            <main>
                <div class="container-xl px-4">
                    <div class="row justify-content-center">
                        <div class="col-lg-5">
                            
                            <div class="card shadow-lg border-0 rounded-lg mt-5">
                                <div class="card-header justify-content-center text-center text-black fw-600">닉네임 중복 확인</div>
                                <div class="card-body">
                                    <form method="post" action="joinNickCheck.jsp">
                                        <div class="mb-3">
                                            <label class="small mb-1" for="inputId">닉네임</label>
                                            <input class="form-control form-control-solid" placeholder="닉네임을 입력하세요." type="text" id="inputNick" name="nick" maxlength="10" autofocus />
                                        </div>

                                        <div class="mb-0">
                                            <input class="btn btn-primary" style="float: right;" type="submit" value="확인" />
                                        </div>
                                    </form>
                                </div>
                                <div class="card-footer text-center">
                                    <div class="small"><a href="javascript:window.close()">창 닫기</a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>    
    </div>

</body>
</html>