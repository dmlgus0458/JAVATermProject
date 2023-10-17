<%@ page contentType="text/html;charset=euc-kr" import="java.sql.*" %>
<%
 request.setCharacterEncoding("utf-8");  //Set encoding
 String id  =        request.getParameter("id");  
 String email =     request.getParameter("email");    
 String nick =     request.getParameter("nick");       
 String pw =   request.getParameter("pw");
 String pw_check =   request.getParameter("pw_check");
 
//POST로 Input.html로부터 입력받은 내용을 변수화

 try{
  Class.forName("com.mysql.jdbc.Driver");
  String url = "jdbc:mysql://localhost:3306/mysql06";
  Connection con = DriverManager.getConnection(url,"root","kbc0924");
  Statement stat = con.createStatement();

  String query = "INSERT INTO user(id,email,nick,pw,pw_check)  VALUES('"+id+"','"+email+"','"+nick+"','"+pw+"','"+pw_check+"')";
//INSERT into member(id,name,pwd,email) VALUES ('id','name','pwd','email') 쿼리문
  stat.executeUpdate(query);
  
  stat.close();
  con.close();
 }
 catch(Exception e){
  out.println( e );
 }
 response.sendRedirect("../login/login.jsp"); 
%>