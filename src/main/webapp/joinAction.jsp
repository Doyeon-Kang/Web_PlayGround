<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="DAO.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 정보 확인</title>
</head>
<body>
	<% request.setCharacterEncoding("utf-8"); %>
	<jsp:useBean id="user" class="user.User" scope="page"/>
	<jsp:setProperty name="user" property="userID" param="id"/>
	<jsp:setProperty name="user" property="userPassword" param="pw"/>
	<jsp:setProperty name="user" property="userName" param="name"/>
	<jsp:setProperty name="user" property="userEmail" param="email"/>
	
	<% 
		if (user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null || user.getUserEmail() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			UserDAO userDAO = new UserDAO();
			int result = userDAO.join(user);
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디입니다')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				PrintWriter script = response.getWriter();
				session.setAttribute("userID", "id");
				session.setAttribute("userPassword", "pw");
				session.setAttribute("userName", "name");
				session.setAttribute("userEmail", "email");
				script.println("<script>");
				script.println("alert('회원가입 성공')");
				script.println("location.href='user_main.jsp'");
				script.println("</script>");
			}
		}
	%>
</body>
</html>