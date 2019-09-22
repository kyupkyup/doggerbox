<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.File"  %>

<%@ page import= "reply.Reply" %>
<%@ page import= "reply.ReplyDAO" %>
<%@ page import= "java.io.PrintWriter" %>
<%@ page import= "doggerboxuser.DoggerboxUser" %>
<%@ page import= "doggerboxuser.DoggerboxUserDAO" %>

<%
	request.setCharacterEncoding("UTF-8");
%>
 <jsp:useBean id ="reply" class="reply.Reply" scope="page"/>
<jsp:setProperty name ="reply" property="replyContent" />




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
		script.println("location.href = '../login.jsp'");
		script.println("</script>");
	}
	
	
	int bulletinID = 0;
	if(request.getParameter("bulletinID")!=null){
		bulletinID = Integer.parseInt(request.getParameter("bulletinID"));
	}
	String currentUserID = null;
	if(request.getParameter("userID")!=null){
		currentUserID = request.getParameter("userID");
	}
	String userName = null;
	if(request.getParameter("userName")!=null){
		userName = request.getParameter("userName");
	}	
		
		if(reply.getReplyContent()==null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('댓글을 입력해주세요.')");
			script.println("history.back()");
			script.println("</script>");
			
			
		}
		
		else{
			

				
				ReplyDAO replyDAO = new ReplyDAO();
				int result = replyDAO.reply(bulletinID, userID, userName, reply.getReplyContent());
				

				if(result == -1 ){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('댓글쓰기에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");

				}
				
				else{
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'bulletin_view.jsp?bulletinID="+bulletinID+"'");
					script.println("</script>");
				}
				
		
		
			
		}
		
			
	%>

	
</body>
</html>