<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="euc-kr">
<title>Insert title here</title>
<link rel="stylesheet" href="./search.css">
</head>
<body>
    <form action="../writing/search.jsp" method="post" class="search_form">
        <input type="text" name="word" placeholder="  검색어를 입력하세요" class="search_form_text">
        <input type="image" src="./search.png" name="Submit" value="Submit" class="search-btn">
    </form>	
</body>
</html>