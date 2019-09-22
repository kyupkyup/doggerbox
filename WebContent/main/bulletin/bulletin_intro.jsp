<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bulletin.Bulletin" %>
<%@ page import="bulletin.BulletinDAO" %>
<!DOCTYPE html>
<html>
<head>
<script src ="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="../css/bulletin/intro_style.css">
<link rel="stylesheet" href="../css/main_style.css">

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale=1>
<title>도거박스:&nbsp;건강한 변화를 선물합니다. </title>
<style type="text/css">
 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: black; text-decoration: none;}
</style>
</head>
<body>

<% 
	BulletinDAO bulletinDAO = new BulletinDAO();
	
%>


	<div class="container"> 
		
			<div class="header">
				<a href="../main.jsp"><img src="../img/logo.png" width="150px" height="50px" class="logo"></a>
				<a href="../main.jsp"><img src="../img/logo.png" width="100px" height="40px" class="logo_mobile"></a>
				<div class="link-container">
					<a href="../myPage.jsp"  class="my-page">마이 페이지</a>
					<a href="bulletin_intro.jsp"  class="bulletin">게시판</a>
					<a href="../product/basic_lineup.jsp"  class="product-introduce">제품 소개</a>
					<a href="../company_introduce.jsp"  class="company-introduce">회사소개</a>
				</div>	
				
			</div>
		
	
			
		<div class="main-container1">


			<div class="notice">
				<a href="bulletin_notice.jsp?bulletinCategory=1"><img src="#" width="50px" height="50px" alt="" class="img11" ></a>
				<div class="title-container">
					<p class="bulletin-intro-title"><a href="bulletin_notice.jsp?bulletinCategory=1">공지사항</a></p>
					<p class="bulletin-intro-content">도거박스의 공지사항을 확인하세요~</p>
				</div>

				<div class="click-container">
					<p class="click-num"><%=bulletinDAO.getSumClickCount(1)-1 %></p>
					<p class="click">조회수 </p>
				</div>
				<div class="posting-container">
					<p class="posting-num"><%=bulletinDAO.getBulletinCount(1)-1 %></p>
					<p class="posting">게시물 </p>
				</div>
			</div>
			
			<div class="notice">
				<a href="bulletin_notice.jsp?bulletinCategory=2"><img src="#" width="50px" height="50px" alt="" class="img11" ></a>
				<div class="title-container">
					<p class="bulletin-intro-title"><a href="bulletin_notice.jsp?bulletinCategory=2">자연식 상담</a></p>
					<p class="bulletin-intro-content">도거박스의 공지사항을 확인하세요~</p>
				</div>

				<div class="click-container">
					<p class="click-num"><%=bulletinDAO.getSumClickCount(2)-1 %></p>
					<p class="click">조회수 </p>
				</div>
				<div class="posting-container">
					<p class="posting-num"><%=bulletinDAO.getBulletinCount(2)-1 %></p>
					<p class="posting">게시물 </p>
				</div>
			</div>
			<div class="notice">
				<a href="bulletin_notice.jsp?bulletinCategory=3"><img src="#" width="50px" height="50px" alt="" class="img11" ></a>
				<div class="title-container">
					<p class="bulletin-intro-title"><a href="bulletin_notice.jsp?bulletinCategory=3">1:1 상담</a></p>
					<p class="bulletin-intro-content">도거박스의 공지사항을 확인하세요~</p>
				</div>

				<div class="click-container">
					<p class="click-num"><%=bulletinDAO.getSumClickCount(3)-1 %></p>
					<p class="click">조회수 </p>
				</div>
				<div class="posting-container">
					<p class="posting-num"><%=bulletinDAO.getBulletinCount(3)-1 %></p>
					<p class="posting">게시물 </p>
				</div>
			</div>
			<div class="notice">
				<a href="bulletin_notice.jsp?bulletinCategory=4"><img src="#" width="50px" height="50px" alt="" class="img11" ></a>
				<div class="title-container">
					<p class="bulletin-intro-title"><a href="bulletin_notice.jsp?bulletinCategory=4">후기공유</a></p>
					<p class="bulletin-intro-content">도거박스의 공지사항을 확인하세요~</p>
				</div>

				<div class="click-container">
					<p class="click-num"><%=bulletinDAO.getSumClickCount(4)-1 %></p>
					<p class="click">조회수 </p>
				</div>
				<div class="posting-container">
					<p class="posting-num"><%=bulletinDAO.getBulletinCount(4)-1 %></p>
					<p class="posting">게시물 </p>
				</div>	
			</div>
			
			
 -->	</div> 
<!-- 		<div class="footer"></div>
 -->	</div>
	

</body>


</html>