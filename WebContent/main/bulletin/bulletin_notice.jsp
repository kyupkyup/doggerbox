<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bulletin.Bulletin" %>
<%@ page import="bulletin.BulletinDAO" %>
<%@ page import="doggerboxuser.DoggerboxUser" %>
<%@ page import="doggerboxuser.DoggerboxUserDAO" %>
<%@ page import = "java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>

<script src ="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="../css/main_style.css">
<link rel="stylesheet" href="../css/bulletin/notice_style.css">


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
	int bulletinCategory =0;
	if(request.getParameter("bulletinCategory")!=null){
		bulletinCategory = Integer.parseInt(request.getParameter("bulletinCategory"));
	}

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
			
				<div class="image-container">					
						<p class="image-title">공지사항</p>
						<p class="image-content">도거박스의 공지사항을 확인하세요~</p>
					</div>
					<div class="bulletin-container">
					<div class="button-container">
						
						<select class="select-one radio-container" name = "bulletinAvailable" data-width="fit">
							<option value = 1>댓글 순</option>
							<option value = 2>조회 순</option>
							<option value = 3>인기 순</option>
						</select>
						<a href="write.jsp?bulletinCategory=<%=bulletinCategory%>"  class="write-button">게시물 작성하기</a>
					</div>
					<table class="notice-bulletin">
						<tbody class="head">
							<tr>
								<td class="th-profile"></td>
								<td class="th-title">제목</td>
								<td class="th-reply">댓글</td>
								<td class="th-like">좋아요</td>
								<td class="th-click">조회</td>
							</tr>
						</tbody>
						<%
							DoggerboxUserDAO userDAO = new DoggerboxUserDAO();
							BulletinDAO bulletinDAO = new BulletinDAO();
							ArrayList<Bulletin> list = bulletinDAO.getList(bulletinCategory);
							for(int i=0; i<list.size(); i++){
								DoggerboxUser user = userDAO.getUser(list.get(i).getUserID());
							
						%>
						
						<tbody>
							<tr>
								<td rowspan=2 class="td-profile"><img src=<%=user.getThumbnail_image() %> class="profile_thumbnail" width="50px" height="50px"></td>
								<td class="td-title"><a href="bulletin_view.jsp?bulletinID=<%=list.get(i).getBulletinID()%>"><%=list.get(i).getBulletinTitle() %></a></td>
								<td rowspan=2 class="td-reply"><%=list.get(i).getBulletinReplyCount()%></td>
								<td rowspan=2 class="td-like"><%=list.get(i).getBulletinLikeCount()%></td>
								<td rowspan=2 class="td-click"><%=list.get(i).getBulletinClickCount()%></td>
								
							</tr>
							
							<tr>
								<td class="td-name"><%=list.get(i).getUserName() %></td>
								<td class="td-name"></td>
							</tr>
							
						</tbody>
						<%
							}
						%>
					</table>
				</div>
			

	 	</div> 
<!-- 		<div class="footer"></div>
 -->	</div>
	

			
</body>


</html>