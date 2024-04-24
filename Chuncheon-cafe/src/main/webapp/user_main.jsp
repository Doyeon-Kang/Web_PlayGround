<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>춘천 카페</title>
<link href="style.css?after;" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&display=swap" rel="stylesheet">
<script 
    src="https://kit.fontawesome.com/9002ad36d0.js" 
    crossorigin="anonymous">
</script>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="main.js?after"></script>

</head>
<body>
<style>
a > img {
    width: 30%;
    height: 250px;
    float: left;
    margin-right: 20px;
}
</style>
<%
	String userName = (String)session.getAttribute("userName");
	try{
	    String DriverName = "com.mysql.jdbc.Driver";
	    String url = "jdbc:mysql://localhost/cafe";
	    String user = "root";
	    String pwd = "1234";
	    ResultSet rs = null;
	    Class.forName(DriverName);
	    Connection con = DriverManager.getConnection(url, user, pwd);
	    
	    Statement stmt = con.createStatement();
	    String sql = "select * from cafe ";
	    rs = stmt.executeQuery(sql);
%>

    <nav id="navbar">
        <div class="navbar__logo"><a href="user_main.jsp">Home</a></div>
        <div class="navbar__profile">
        	<a href="#">게시판</a>
        	<a href="logout.jsp">로그아웃</a>
            <%= userName %>님 환영합니다!
            
        </div>
    </nav>
    <section id="home">
        <div class="home__container">
            <div class="search__bar">
                <label>
                <form action="search.jsp" method="get">
                    <input type="text" placeholder="검색어를 입력해주세요">
                    <input type="submit" value="검색">
                </form>
                </label>
            </div>
            <img src="./img/카페2.jpg"  style="width: 100%" alt="카페 전경1">
        </div>
    </section>
    <section id="content">
        <div class="section__container">
            <ul class="cafe__list">
                	<%
                		while(rs.next()){
							out.println("<li class='cafe'><a href='user_cafe.jsp?list_id=" +rs.getString("cafe_id") +"'>");
                			out.println("<img src='" + rs.getString("cafe_image_url") + "' alt='카페 전경'>");
                			out.println("<div class='text__box'>");
                			out.println("<span class='title'>" +rs.getString("cafe_name") + "</span>");
                			out.println("<span class='description'>" +rs.getString("cafe_desc") + "</span></div></a></li>");
                		}
                	%>
            </ul>
        </div>
        <%
		    } catch(Exception e){
		        out.println(e.getMessage());
		    }    	
        
		%>
    </section>
    <section id="contact"></section>
    <button class="arrow-up">
        <i class="fas fa-arrow-up"></i>
    </button>
</body>
</html>