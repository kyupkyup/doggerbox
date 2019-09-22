<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "bulletin.Bulletin" %>
<%@ page import= "bulletin.BulletinDAO" %>
<%@ page import= "java.io.PrintWriter" %>
<%@ page import= "doggerboxuser.DoggerboxUser" %>
<%@ page import= "doggerboxuser.DoggerboxUserDAO" %>


<%
	request.setCharacterEncoding("UTF-8");
%>



<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content = "text/html; charset=UTF-8">

<title>luppyworld_write_action_page</title>

</head>
<body>
	
	<!-- 글쓰기 부분 권한 제어 추가로 만들것 -->
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

	if(request.getParameter("bulletinID") != null)
	{
		bulletinID = Integer.parseInt(request.getParameter("bulletinID"));
	}
	
	
		PrintWriter script = response.getWriter();

			
			
		
			if(bulletinID == 0){
				script.println("<script>");
				script.println("alert('유효하지 않은 글입니다.')");
				script.println("location.href = 'main.jsp'");
				script.println("</script>");
			}
			
			else{
			BulletinDAO bulletinDAO = new BulletinDAO();
			int result = bulletinDAO.delete(bulletinID);


			if(result == -1 ){
				script.println("<script>");
				script.println("alert('삭제에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");

			}
			
			else{
				script.println("<script>");
				script.println("alert('삭제에 성공했습니다.')");
				script.println("location.href = 'main.jsp'");
				script.println("</script>");
			}
			
		
		
			}
			

	%>

	
</body>
</html>