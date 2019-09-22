<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "doggerboxuser.DoggerboxUser" %>
<%@ page import= "doggerboxuser.DoggerboxUserDAO" %>

<%@ page import= "java.io.PrintWriter" %>
<%
	request.setCharacterEncoding("UTF-8");
%>


<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content = "text/html; charset=UTF-8">

<title>luppyworld_login_page</title>

</head>
<body>

	<%
	String userID = null;
	String profile_image = null;
	String thumbnail_image = null;
	String userGender = null;
	String userAge = null;

			
		if(request.getParameter("userID") != null){
			userID = request.getParameter("userID");
			
				}
		if(request.getParameter("profile_image") != null){
			profile_image = request.getParameter("profile_image");
			
				}
		if(request.getParameter("thumbnail_image") != null){
			thumbnail_image = request.getParameter("thumbnail_image");
			
				}
		if(request.getParameter("userGender") != null){
			userGender = request.getParameter("userGender");
			
				}
		if(request.getParameter("userAge") != null){
			userAge = request.getParameter("userAge");
			
				}
 
				if(session.getAttribute("userID") != null){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('로그인 직전')");
					script.println("</script>");
					script.println("<script>");
					script.println("alert('이미 로그인이 되어 있습니다.')");
					script.println("location.href = 'main.jsp'");
					script.println("</script>");
				}
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('로그인 직전"+profile_image+"')");
				script.println("</script>");
				DoggerboxUserDAO userDAO = new DoggerboxUserDAO();
				int result = userDAO.login(userID);
			
				if(result ==1 ){/* 로그인 성공  */
			
			session.setAttribute("userID", userID);

 			PrintWriter script1 = response.getWriter();
 			script1.println("<script>");
 			script1.println("alert('로그인ㅅ 성공')");
 			script1.println("location.href = 'main.jsp'");
 			script1.println("</script>");
				}
				
				
				else if(result == -1 ){/* 아이디가 존재하지 않을 경우 */
					
					script.println("<script>");
					script.println("alert('가입 직전')");
					script.println("</script>");
					
					int resultJoin = userDAO.join(userID, profile_image, thumbnail_image,"미정","미정"); 
					if(resultJoin==1){
						script.println("<script>");
						script.println("alert('가입 성공"+profile_image+"')");
						script.println("</script>");
						
						int result2 = userDAO.login(userID);
						session.setAttribute("userID", userID);
						
			 			script.println("<script>");
			 			script.println("alert('로그인ㅅ 성공')");
			 			script.println("location.href = 'main.jsp'");
			 			script.println("</script>");
					}
					else if(resultJoin==-1){
						script.println("<script>");
						script.println("alert('가입 실패')");
						script.println("</script>");
					}
 /* 				PrintWriter script = response.getWriter();

 */							

				}
				
				else if(result == -2 ){  /* 데이터베이스 오류  */
/* 			PrintWriter script = response.getWriter();
 */			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다.')");
			script.println("history.back()");
			script.println("</script>");
				}
		%>
	
</body>
</html>