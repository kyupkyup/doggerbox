<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="doggerboxuser.DoggerboxUser" %>
<%@ page import="doggerboxuser.DoggerboxUserDAO" %>
<%@ page import="bulletin.BulletinDAO" %>
<%@ page import="bulletin.Bulletin" %>
<%@ page import= "like.Like" %>
<%@ page import= "like.LikeDAO" %>
<%@ page import="reply.ReplyDAO" %>
<%@ page import="reply.Reply" %>


<%@ page import = "java.util.ArrayList" %>
<%@ page import= "java.io.PrintWriter" %>

<!DOCTYPE html>
<html>
<head>
<script src ="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="css/main_style.css">
<link rel="stylesheet" href="css/mypage/mypage_style.css">
<link rel="stylesheet" href="css/bulletin/notice_style.css">


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
	userID = (String)session.getAttribute("userID");
}
if(userID==null){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('로그인을 먼저 해주세요.')");
	script.println("location.href = 'login.jsp'");
	script.println("</script>");
}

	DoggerboxUserDAO userDAO = new DoggerboxUserDAO();
	BulletinDAO bulletinDAO = new BulletinDAO();
	DoggerboxUser user = userDAO.getUser(userID);
	LikeDAO likeDAO = new LikeDAO();
	ReplyDAO replyDAO = new ReplyDAO();
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
			
			<div class="main-container1">
			
				
				<%
					if(userDAO.getUser(userID).getUserName()!=null){
						
					
						%>
				<div class="profile-container">
					<img src=<%=userDAO.getUser(userID).getProfile_image()%> class="profile_thumbnail" width="300px" height="300px" class="mypage-profile-image">
				
					
						<div class="numbering-container">
							<span><%=bulletinDAO.getBulletinCountByUserID(userID) %></span><span>내가 쓴 글</span>
							<span><%=replyDAO.getReplyCountByUserID(userID) %></span><span>내가 쓴 댓글</span>
						</div>
						
						<div class="user-info-container">
							<span class="mypage-userName"><%=user.getUserName() %></span>
							<span class="mypage-phoneNum"><%=user.getUserPhoneNum() %></span>
							<span class="mypage-address"><%=user.getUserAddress() %></span>
						</div>
					</div>
				<%
					}
					else{
						%>
						<div class="down-profile-container">
							<img src=<%=userDAO.getUser(userID).getProfile_image()%> width="300px" height="300px" class="mypage-profile-image">
						
							
								<div class="numbering-container">
								</div>
								
								<div class="user-info-container">
								</div>
						</div>
						<div class="up-profile-container">
							
						</div>
						<a href="additional_information.jsp?userID=<%=userID%>" class="additional-info">추가 정보 입력</a>
						<%
					}
				%>
				
				<div class="update-button-container">
					<a href="additional_information_update.jsp?userID=<%=userID%>" class="write-button">수정</a>
					<a href="logoutAction.jsp"  class="write-button">로그아웃</a>
				</div> 
				

				
				<div class="bulletin-container">
					<div class="mypage-button-container">
						<a class="write-button bulletin-button" id="boxes_item1">내가 쓴 글</a>
						<a class="write-button bulletin-button" id="boxes_item2">내가 쓴 댓글</a>
						<a class="write-button bulletin-button" id="boxes_item3">내가 좋아요 한 글</a>
						
					</div>
					<table class="notice-bulletin" id="written-bulletin">
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
							ArrayList<Bulletin> list = bulletinDAO.getListByUserID(userID);
							
							for(int i=0; i<list.size(); i++){
							String userID1= list.get(i).getUserID();	
							String profile_image = userDAO.getUser(userID1).getProfile_image();
							String thumbnail_image = userDAO.getUser(userID1).getThumbnail_image();
						%>
							
						<tbody>
							<tr>
								<td rowspan=2 class="td-profile"><img src="<%=thumbnail_image%>" width="50px" height="50px"></td>
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
					
					<table class="notice-bulletin" id="reply-bulletin">
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
							ArrayList<Reply> listReply = replyDAO.getListByUserID(userID);
							ArrayList<Bulletin> list1 = new ArrayList<Bulletin>();
							for(int i=0; i<listReply.size();i++){
								list1 = bulletinDAO.getListByUserID(listReply.get(i).getUserID());

							}
							
							for(int i=0; i<list1.size(); i++){
							String userID1= list1.get(i).getUserID();	
							String profile_image = userDAO.getUser(userID1).getProfile_image();
							String thumbnail_image = userDAO.getUser(userID1).getThumbnail_image();
						%>
							
						<tbody>
							<tr>
								<td rowspan=2 class="td-profile"><img src="<%=thumbnail_image%>" width="50px" height="50px"></td>
								<td class="td-title"><a href="bulletin_view.jsp?bulletinID=<%=list1.get(i).getBulletinID()%>"><%=list1.get(i).getBulletinTitle() %></a></td>
								<td rowspan=2 class="td-reply"><%=list1.get(i).getBulletinReplyCount()%></td>
								<td rowspan=2 class="td-like"><%=list1.get(i).getBulletinLikeCount()%></td>
								<td rowspan=2 class="td-click"><%=list1.get(i).getBulletinClickCount()%></td>
								
							</tr>
							
							<tr>
								<td class="td-name"><%=list1.get(i).getUserName() %></td>
								<td class="td-name"></td>
							</tr>
							
						</tbody>
						<%
							}
						%>
					</table>
					
					<table class="notice-bulletin" id="like-bulletin">
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
						ArrayList<Like> listLike = likeDAO.getListByUserID(userID);
						ArrayList<Bulletin> list2 = new ArrayList<Bulletin>();
						for(int i=0; i<listLike.size();i++){
							 list2 = bulletinDAO.getListByUserID(listLike.get(i).getUserID());

						}
							
							for(int i=0; i<list2.size(); i++){
							String userID1= list2.get(i).getUserID();	
							String profile_image = userDAO.getUser(userID1).getProfile_image();
							String thumbnail_image = userDAO.getUser(userID1).getThumbnail_image();
						%>
							
						<tbody>
							<tr>
								<td rowspan=2 class="td-profile"><img src="<%=thumbnail_image%>" width="50px" height="50px"></td>
								<td class="td-title"><a href="bulletin_view.jsp?bulletinID=<%=list2.get(i).getBulletinID()%>"><%=list2.get(i).getBulletinTitle() %></a></td>
								<td rowspan=2 class="td-reply"><%=list2.get(i).getBulletinReplyCount()%></td>
								<td rowspan=2 class="td-like"><%=list2.get(i).getBulletinLikeCount()%></td>
								<td rowspan=2 class="td-click"><%=list2.get(i).getBulletinClickCount()%></td>
								
							</tr>
							
							<tr>
								<td class="td-name"><%=list2.get(i).getUserName() %></td>
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
	
<script type="text/javascript">
	
	var boxes_item1= document.getElementById("boxes_item1");
	var boxes_item2= document.getElementById("boxes_item2");
	var boxes_item3= document.getElementById("boxes_item3");
	
	var boxes_explain_item1= document.getElementById("written-bulletin");
	var boxes_explain_item2= document.getElementById("reply-bulletin");
	var boxes_explain_item3= document.getElementById("like-bulletin");
	
	boxes_explain_item1.style.display='inline-block';
	boxes_explain_item2.style.display='none';
	boxes_explain_item3.style.display='none';
	
	function boxes_listener(event){
		
		
		switch(event.target.id){
			case "boxes_item1":
				boxes_explain_item1.style.display='inline-block';
				boxes_explain_item2.style.display='none';
				boxes_explain_item3.style.display='none';
				break;
			case "boxes_item2":
				boxes_explain_item1.style.display='none';
				boxes_explain_item2.style.display='inline-block';
				boxes_explain_item3.style.display='none';
	
				break;
			case "boxes_item3":
				boxes_explain_item1.style.display='none';
				boxes_explain_item2.style.display='none';
				boxes_explain_item3.style.display='inline-block';
				break;
		
					
		}
		
	}
	boxes_item1.addEventListener('click', boxes_listener);
	boxes_item2.addEventListener('click', boxes_listener);
	boxes_item3.addEventListener('click', boxes_listener);
</script>

</body>


</html>