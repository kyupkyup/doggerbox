<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "puppy.Puppy" %>
<%@ page import= "puppy.PuppyDAO" %>
<%@ page import= "java.io.PrintWriter" %>

<% request.setCharacterEncoding("UTF-8");%>


<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content = "text/html; charset=UTF-8">

<title>luppyworld_write_action_page</title>

</head>
<body>
	
	<!-- 글쓰기 부분 -->
	<%
		
 	int puppyPrimeNum = 0;
 	if(request.getParameter("puppyPrimeNum")!=null){
 		puppyPrimeNum = Integer.parseInt(request.getParameter("puppyPrimeNum"));
	} 

 	int userPrimeNum = 0;
 	if(request.getParameter("userPrimeNum")!=null){
		userPrimeNum = Integer.parseInt(request.getParameter("userPrimeNum"));
	} 
			
			
				PuppyDAO puppyDAO = new PuppyDAO();
				int result = puppyDAO.deletePuppy(puppyPrimeNum);
				
				if(result == -1 ){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('강아지 삭제에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");

				}
				
				else{
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('강아지 삭제 성공')");
					script.println("location.href = 'customerAdminPuppy.jsp?userPrimeNum="+userPrimeNum+"'");
					script.println("</script>");
				}

	
	
			
		
		
	%>

	<script src ="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	
</body>

</html>