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

<title>luppyworld_write_action_page</title>

</head>
<body>
	
	<!-- 글쓰기 부분 -->
	<%
		int userPrimeNum = 0;
	 
	 	if(request.getParameter("userPrimeNum")!=null){
			userPrimeNum = Integer.parseInt(request.getParameter("userPrimeNum"));
		} 

		
			DoggerboxUserDAO userDAO = new DoggerboxUserDAO();
			int result = userDAO.deleteUser(userPrimeNum);
			
			if(result == -1 ){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원 삭제에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");

			}
			
			else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원 삭제 성공')");
				script.println("location.href = 'customerAdmin.jsp'");
				script.println("</script>");
			}

		
			
		
	%>

	<script src ="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	
</body>

</html>