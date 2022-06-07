<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 화면</title>
    <link href="user.css?after;" rel="stylesheet">
</head>
<body>
	<div class="content-wrap">
        <h1>로그인</h1>
        <form method="post" action="./login_check.jsp">
            아이디 <input type="text" name="id">
            패스워드 <input type="password" name="pw">
            <input type="submit" value="로그인">
            <input type="button" value="회원가입" onclick="join()">
        </form>
    </div>
    <script>
    	function join() {
    		location.href = 'join.jsp';
    	}
    </script>
</body>
</html>