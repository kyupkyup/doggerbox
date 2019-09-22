<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bulletin.Bulletin" %>
<%@ page import="bulletin.BulletinDAO" %>
<%@ page import="reply.Reply" %>
<%@ page import="reply.ReplyDAO" %>
<%@ page import="doggerboxuser.DoggerboxUser" %>
<%@ page import="doggerboxuser.DoggerboxUserDAO" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import= "java.io.PrintWriter" %>
<%@ page import="java.net.URLEncoder" %>


<!DOCTYPE html>
<html>
<head>
<script src ="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="../css/main_style.css">
<link rel="stylesheet" href="../css/bulletin/view_style.css">


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
	int bulletinID =0;
	if(request.getParameter("bulletinID") != null){
		bulletinID = Integer.parseInt(request.getParameter("bulletinID"));
	}
	
	String currentUserID = null;
	if(session.getAttribute("userID")!=null){
		currentUserID = (String)session.getAttribute("userID");
	}
	else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요.')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	}
	
	
	BulletinDAO bulletinDAO = new BulletinDAO();
	int result = bulletinDAO.clickAdd(bulletinID);
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
		
	<%
		ReplyDAO replyDAO = new ReplyDAO();
		DoggerboxUserDAO userDAO = new DoggerboxUserDAO();
		Bulletin bulletin = bulletinDAO.getBulletin(bulletinID);
		
		ArrayList<Reply> list = replyDAO.getList(bulletinID);
		DoggerboxUser user = userDAO.getUser(bulletin.getUserID());
		DoggerboxUser currentUser = userDAO.getUser(currentUserID);

	%>
			
		<div class="main-container1">		
			<div class="view-container">	
				<div class="profile-container">
					<span>
						<span class="profile"><img src=<%=user.getThumbnail_image()%> class="profile_thumbnail" width="50px" height="50px"></span>
						<span class="writer"><%=bulletin.getUserName()%>
						</span>
					</span>
					<span class="date">
						<%=bulletin.getBulletinDate() %>
					</span>
					
				</div>
				
				<div class="title">
					<%=bulletin.getBulletinTitle() %>
				</div>
				
				<div class="reply">
					<span>댓글</span><span><%=bulletin.getBulletinReplyCount() %></span>
					<span>조회</span><span><%=bulletin.getBulletinClickCount() %></span>
					
				</div>
				<div class="content">
					<%=bulletin.getBulletinContent() %>
				</div>

					<span class="like"><%=bulletin.getBulletinLikeCount() %></span>
				
			</div>
			<%
				for(int i=0; i<list.size(); i++){
					
				
			%>
			<div class="reply-container">
				<div class="profile-container">
						<span class="profile"><img src=<%=user.getThumbnail_image()%> width="50px" height="50px" class="profile_thumbnail"></span>
						<span class="writer"><%=bulletin.getUserName()%>
					</span>
					<span class="date">
						<%=list.get(i).getReplyDate() %>
					</span>
				
				</div>
					<div class="reply-content">
						<%=list.get(i).getReplyContent() %>
					</div>
				<%
				}
				%>
			</div>
			
			<div class="reply-write-container">
				<div class="profile-container">
					<span class="profile"><img src=<%=currentUser.getThumbnail_image()%> width="50px" height="50px"  class="profile_thumbnail"></span>
					<span class="writer"><%=currentUser.getUserName()%>
					</span>
				</div>
				<form action="replyAction.jsp?bulletinID=<%=bulletinID%>&userID=<%=currentUserID%>&userName=<%=URLEncoder.encode(currentUser.getUserName(),"UTF-8")%>" method="post">
					<textarea class="reply-write-content" placeholder="댓글을 입력하세요" name="replyContent"></textarea>
					<input type="submit" id="replybutton" class="write-button" value="게시" >
					
				</form>
			</div>
				
			
			
 	</div> 
<!-- 		<div class="footer"></div>
 -->	</div>
	

</body>


</html>