<%@ page import="DAO.CafeDAO" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>춘천 카페</title>
<link href="style.css;" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&display=swap" rel="stylesheet">
<script 
    src="https://kit.fontawesome.com/9002ad36d0.js" 
    crossorigin="anonymous">
</script>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="main.js?after"></script>
<style>


</style>
</head>
<body>
<%
	String userName = (String)session.getAttribute("userID");
	String cafeID = request.getParameter("list_id");
	String cafe_name = "";
	String cafe_desc = "";
	String cafe_address = "";
	String cafe_image_url = "";

	try{
	    String DriverName = "com.mysql.jdbc.Driver";
	    String url = "jdbc:mysql://localhost/cafe";
	    String user = "root";
	    String pwd = "1234";
	    ResultSet rs = null;
	    Class.forName(DriverName);
	    Connection con = DriverManager.getConnection(url, user, pwd);
	    
	    Statement stmt = con.createStatement();
	    String sql = "select cafe_name, cafe_desc, cafe_address, cafe_image_url from cafe where cafe_id=" + cafeID;
	    rs = stmt.executeQuery(sql);
	    
	    while(rs.next()) {
	    	cafe_name = rs.getString("cafe_name");
	    	cafe_desc = rs.getString("cafe_desc");
	    	cafe_address = rs.getString("cafe_address");
	    	cafe_image_url = rs.getString("cafe_image_url");
	    }
%>
    <nav id="navbar">
        <div class="navbar__logo"><a href="user_main.jsp">Home</a></div>
        <div class="navbar__profile">
        	<a href="#">게시판</a>
        	<a href="login.jsp">로그아웃</a>
        	<a href="#"><%= userName %>님</a>
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
            <img src="<%= cafe_image_url%>" alt="카페 전경1">
        </div>
    </section>
    <section id="content">
        <div class="section__container">
            <div class="text__box">
                <span class="title"><%= cafe_name %></span>
                <img class="cafe_img" src="<%= cafe_image_url%>" alt="카페 전경1">
                <span class="description" ><%= cafe_desc %></span>
                <span class="address" ><%= cafe_address %></span>
            </div>
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