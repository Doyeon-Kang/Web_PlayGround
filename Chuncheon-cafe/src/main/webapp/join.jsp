<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
	
</style>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="user.css?after;" rel="stylesheet">
</head>
<body>
	<div class="content-wrap">
        <h1>회원가입</h1>
        <form method="post" action="joinAction.jsp">
            <input type="text" name="id" placeholder="아이디">
            <input type="password" name="pw" placeholder="비밀번호">
            <input type="text" name="name" placeholder="이름">
            <input type="email" name="email" placeholder="이메일">
            <input type="submit" value="회원가입">
        </form>
    </div>
</body>
</html>