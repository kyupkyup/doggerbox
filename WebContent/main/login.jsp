<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src ="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="css/main_style.css">

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
	
			<a id="kakao-login-btn"></a>
			<a href="http://developers.kakao.com/logout"></a>
			<script type="text/javascript">
			    Kakao.init('364f1da68aeb8a565766246efcbaca89');
			    // 카카오 로그인 버튼을 생성합니다.
			    Kakao.Auth.createLoginButton({
			      container: '#kakao-login-btn',
			      success: function(authObj) {
			    	     Kakao.API.request({

			    	         url: '/v1/user/me',

			    	         success: function(res) {

			    	               alert(JSON.stringify(res)); //<---- kakao.api.request 에서 불러온 결과값 json형태로 출력

			    	               alert(JSON.stringify(authObj)); //<----Kakao.Auth.createLoginButton에서 불러온 결과값 json형태로 출력

			    	               console.log(res.id);//<---- 콘솔 로그에 id 정보 출력(id는 res안에 있기 때문에  res.id 로 불러온다)

			    	               console.log(res.kaccount_email);//<---- 콘솔 로그에 email 정보 출력 (어딨는지 알겠죠?)

			    	               console.log(res.properties['nickname']);//<---- 콘솔 로그에 닉네임 출력(properties에 있는 nickname 접근 
			    	          	 // res.properties.nickname으로도 접근 가능 )
			    	               console.log(authObj.access_token);//<---- 콘솔 로그에 토큰값 출력
			    	               
    	            			   location.href="loginAction.jsp?userID="+JSON.stringify(res.id)+"&profile_image="+encodeURIComponent(JSON.stringify(res.properties['profile_image']))+"&thumbnail_image="
    	            					   +encodeURIComponent(JSON.stringify(res.properties["thumbnail_image"]));
    	            							   
/*     	            							   +"&userGender="+encodeURIComponent(JSON.stringify(res.kakao_account.gender))+"&userAge="+encodeURIComponent(JSON.stringify(res.kakao_account.age_range)));
 
			    	               
			    	               function fetchUser()
			    	               {
			    	            	   $.ajax({
			    	            		   url:"C:\Users\lky\Downloads\JSP\도거박스\php",
			    	            		   method:"POST",
			    	            		   data:{data:res},
			    	            		   success:function(data){
			    	            			   }
			    	            		   
			    	            		
			    	            	   })
			    	               }
			    	               fetchUser(); */

			    	             }

			    	           })

			    	         },
 


			      fail: function(err) {
			         alert(JSON.stringify(err));
			      }
			    });
			</script>
			
 
<!-- 		<div class="footer"></div>
 -->	</div>
	


</body>


</html>