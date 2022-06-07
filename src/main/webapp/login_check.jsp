<%@ page import="DAO.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 확인</title>
</head>
<body>
	<jsp:useBean id="user" class="user.User" scope="page"/> <!-- 한명의 회원 정보를 담는 User클래스를 자바 빈즈로 사용하며 현재 page안에서만 빈즈를 사용 -->
	<jsp:setProperty name="user" property="userID" param="id"/>
	<jsp:setProperty name="user" property="userPassword" param="pw"/>

<%
	request.setCharacterEncoding("utf-8"); 
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	UserDAO userDAO = new UserDAO();
	int result = userDAO.login(id, pw);
	
	if (result == 1){ // 관리자 페이지
		response.sendRedirect("admin.jsp");
	} else if (result == 2){ // 일반 사용자 페이지
		response.sendRedirect("user_main.jsp");
		session.setAttribute("userID", id);
		session.setAttribute("userPW", pw);
	} else if (result == 0){ 
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter m = response.getWriter();

		m.println("<script language='javascript'>");
		m.println("alert('아이디 또는 비밀번호를 잘못 입력했습니다.')");
		m.println("</script>");

		m.flush();
		m.println("<script>location.href='login.jsp'</script>");
	} else {
		response.sendRedirect("login.jsp");
	}
	

 %>
</body>
</html>