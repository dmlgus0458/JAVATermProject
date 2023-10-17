<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr" %>

  <% String id=(String)session.getAttribute("user_id"); String nick=(String)session.getAttribute("user_nick"); %>
    <% request.setCharacterEncoding("euc-kr"); %>
    <%@ include file="../navbar/navbar.jsp" %>
      <!DOCTYPE html>
      <html lang="en">

      <head>
        <meta charset="euc-kr" />
        <title>Document</title>
        <link rel="stylesheet" href="../main/main.css" />
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" />
        <link rel="stylesheet" href="./write.css">
        <link rel="stylesheet" href="../navbar/navibar.css">
      </head>

      <body>

             <div id="logo"><a href="../main/main.jsp"><img src="./img/logo.png" alt=""></a></div>

              <div class="writecontainer">
                <form action="writeAction.jsp" method="post">
                  <div class="title"><input type="text" name="Title" placeholder="    게시글 제목을 작성하세요." /></div>
                  <div class="usercount"><input type="number" name="recruit" min="2" max="8"
                      placeholder="    모집인원을 선택하세요."></div>
                  <div class="cost"><input type="number" name="price" min="5000" max="99999"
                      placeholder="    가격(배달비+음식값)을 입력하세요."></div><br />

                  <div class="place">
                    <div style="margin: 100px 0 0 0; width: 600px;">모집장소를 선택하세요.<br /></div>
                    <select class="form=control" name="place">
                      <option value="본부동">본부동</option>
                      <option value="목양관">목양관</option>
                      <option value="기숙사">기숙사</option>
                    </select>
                    <input type="text" class="form=control" name="place" placeholder="직접입력" maxlength="100">
                  </div>
                 

                    <div class="category">
                      <div style="margin: 0px; width: 600px;">카테고리를 입력하세요</div>
                      <table>
                        <tr>
                          <td><input type='radio' name='category' value='chicken' />치킨</td>
                          <td><input type='radio' name='category' value='hamburger' />햄버거</td>
                          <td><input type='radio' name='category' value='pizza' />피자</td>
                          <td><input type='radio' name='category' value='sushi' />스시</td>                         
                        </tr>
                        <tr>
                          <td><input type='radio' name='category' value='schoolfood' />분식</td>
                          <td><input type='radio' name='category' value='meat' />고기</td>
                          <td><input type='radio' name='category' value='chinese' />중식</td>
                          <td><input type='radio' name='category' value='dessert' />디저트</td>
                        </tr>
                      </table>
                    </div>
                    <br>
                    <div class="detail">상세내용을 입력하세요.<br />
                      <textarea name="Content" rows="5" cols="50"></textarea>
                    </div>
                    <br />
                    <input type="hidden" name="nick" value="<%=nick%>"><br>
                    <input type="submit" class="submit" />&nbsp;
                    <input type="reset" class="submit" />
                </form>
              </div>

      </body>

      </html>