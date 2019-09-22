<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src ="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/js/swiper.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="css/main_style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/css/swiper.min.css">

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale=1>
<style type="text/css">
 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: black; text-decoration: none;}
</style>
<title>도거박스:&nbsp;건강한 변화를 선물합니다. </title>
</head>
<body>
<%
String userID = null;
if(session.getAttribute("userID") != null){
	userID = (String)session.getAttribute("user");
}
%>
	<div class="container"> 
		
			<div class="header">
				<a href="main.jsp"><img src="img/logo.png" width="150px" height="50px" class="logo"></a>
				<a href="main.jsp"><img src="img/logo.png" width="100px" height="40px" class="logo_mobile"></a>
				<div class="link-container">		
					<a href="myPage.jsp"  class="my-page">마이 페이지</a>
					<a href="bulletin/bulletin_intro.jsp"  class="bulletin">게시판</a>
					<a href="product/basic_lineup.jsp"  class="product-introduce">제품 소개</a>
					<a href="company_introduce.jsp"  class="company-introduce">회사소개</a>
					
				</div>
				
			</div>
	
			
		<div class="main-container">
			<div class="img-container1">
				<img src="img/main1-3.jpg" width="100%" height="100%" class="img1">
				<a href="http://pf.kakao.com/_gTelj/chat"><img src="img/main1-1.jpg" width="100%" height="100%" class="mobile_img1"></a>
 				<a class="kakao-button1" href="http://pf.kakao.com/_gTelj/chat"></a>
			</div>
			<div class="img-container2">
				<img src="img/main2-1.jpg" width="100%" height="100%" class="img2">
				<a href="http://pf.kakao.com/_gTelj/chat"><img src="img/main2-2.jpg" width="100%" height="100%" class="mobile_img2"></a>
 				<a class="kakao-button2" href="http://pf.kakao.com/_gTelj/chat"></a>
			</div>
			<div class="img-container3">
				<img src="img/main3-1.jpg" width="100%" height="100%" class="img3">
				<a href="http://pf.kakao.com/_gTelj/chat"><img src="img/main3-2.jpg" width="100%" height="100%" class="mobile_img3"></a>
			</div>

			<div class="swiper-container swiper-home">
			    <!-- Additional required wrapper -->
			    <div class="swiper-wrapper">
			        <!-- Slides -->
			        <div class="swiper-slide"><a href="product/basic_lineup.jsp"><img src="img/product/puppy.jpg" width="600px" height="600px"></a></div>
			        <div class="swiper-slide"><a href="product/basic_lineup.jsp"><img src="img/product/original.jpg" width="600px" height="600px"></a></div>
			        <div class="swiper-slide"><a href="product/basic_lineup.jsp"><img src="img/product/senior.jpg" width="600px" height="600px"></a></div>
			   		<div class="swiper-slide"><img src="img/product/fish.jpg" width="600px" height="600px"></div>
			        <div class="swiper-slide"><img src="img/product/pork.jpg" width="600px" height="600px"></div>
			        <div class="swiper-slide"><img src="img/product/kangaroo.jpg" width="600px" height="600px"></div>
			 		<div class="swiper-slide"><img src="img/product/horse.jpg" width="600px" height="600px"></div>  
			          
			    </div>
			    <!-- If we need pagination -->
			    <div class="swiper-pagination"></div>
			
			    <!-- If we need navigation buttons -->
			    <div class="swiper-button-prev"></div>
			    <div class="swiper-button-next"></div>
			
			    <!-- If we need scrollbar -->
			    <div class="swiper-scrollbar"></div>
			</div>
			
			<div class="swiper-container swiper-mobile">
			    <!-- Additional required wrapper -->
			    <div class="swiper-wrapper">
			        <!-- Slides -->
			        <div class="swiper-slide"><a href="product/basic_lineup.jsp"><img src="img/product/puppy_mobile.jpg" width="100%" height="100%"></a></div>
			        <div class="swiper-slide"><a href="product/basic_lineup.jsp"><img src="img/product/original_mobile.jpg" width="100%" height="100%"></a></div>
			        <div class="swiper-slide"><a href="product/basic_lineup.jsp"><img src="img/product/senior_mobile.jpg" width="100%" height="100%"></a></div>
			   		<div class="swiper-slide"><img src="img/product/fish_mobile.jpg" width="100%" height="100%"></div>
			        <div class="swiper-slide"><img src="img/product/pork_mobile.jpg" width="100%" height="100%"></div>
			        <div class="swiper-slide"><img src="img/product/kangaroo_mobile.jpg" width="100%" height="100%"></div>
			 		<div class="swiper-slide"><img src="img/product/horse_mobile.jpg" width="100%" height="100%"></div>  		       
			    </div>
			    <!-- If we need pagination -->
			    <div class="swiper-pagination"></div>
			
			    <!-- If we need navigation buttons -->
			    <div class="swiper-button-prev"></div>
			    <div class="swiper-button-next"></div>
			
			    <div class="swiper-scrollbar"></div> 
			</div>
		</div>
		 	<div class="img-container3">
				<img src="img/main4-1.jpg" width="100%" height="100%" class="img3">
				<img src="img/main4-2.jpg" width="100%" height="100%" class="mobile_img3">
			
<!-- 				<button class="kakao-button3">카톡으로 넘어가기</button>
 -->		</div> 
<!-- 		<div class="footer"></div>
 -->	</div>
	
	  <script>
  var mySwiper = new Swiper ('.swiper-mobile', {
	    // Optional parameters
		slidesPerView:1,
		spaceBetween:10,
		
	    // If we need pagination
	    pagination: {
	      el: '.swiper-pagination',
	      clickable:true,
	    },

	    // Navigation arrows
	    navigation: {
	      nextEl: '.swiper-button-next',
	      prevEl: '.swiper-button-prev',
	    },

	    // And if we need scrollbar

	  })
  </script>
  <script>
  
  var mySwiper = new Swiper ('.swiper-home', {
    // Optional parameters
	slidesPerView:1,
	spaceBetween:30,
	
    // If we need pagination
    pagination: {
      el: '.swiper-pagination',
      clickable:true,
    },

    // Navigation arrows
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
    },

    // And if we need scrollbar

  })
  </script>

  

</body>


</html>