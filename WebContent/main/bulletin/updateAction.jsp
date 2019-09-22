<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.File"  %>

<%@ page import= "bulletin.Bulletin" %>
<%@ page import= "bulletin.BulletinDAO" %>
<%@ page import= "java.io.PrintWriter" %>
<%@ page import= "doggerboxuser.DoggerboxUser" %>
<%@ page import= "doggerboxuser.DoggerboxUserDAO" %>

<%
	request.setCharacterEncoding("UTF-8");
%>
 <jsp:useBean id ="bulletin" class="bulletin.Bulletin" scope="page"/>
<jsp:setProperty name ="bulletin" property="bulletinTitle" />
<jsp:setProperty name ="bulletin" property="bulletinContent" />




<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content = "text/html; charset=UTF-8">

<title>luppyworld_write_action_page</title>

</head>
<body>
	
	<!-- 글쓰기 부분 -->
	<%
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String)session.getAttribute("userID");
	}
	if(userID==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	}
	int bulletinID = 0;
	if(request.getParameter("bulletinID")!=null){
		bulletinID = Integer.parseInt(request.getParameter("bulletinID"));
	}
		

		if(bulletin.getBulletinTitle()==null || bulletin.getBulletinContent()==null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
			
			
		}
		
		else{
			

				
				BulletinDAO bulletinDAO = new BulletinDAO();
				Bulletin bulletinOther = bulletinDAO.getBulletin(bulletinID);

				int result = bulletinDAO.update( bulletinID, bulletin.getBulletinTitle(), bulletin.getBulletinContent());
				

				if(result == -1 ){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('수정에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");

				}
				
				else{
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'bulletin_notice.jsp?="+bulletinOther.getBulletinCategory()+"'");
					script.println("</script>");
				}
				
		
		
			
		}
		
			
	%>

	
</body>
</html>