<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "round.Round" %>
<%@ page import= "round.RoundDAO" %>
<%@ page import= "java.io.PrintWriter" %>

<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id ="user" class="doggerboxuser.DoggerboxUser" scope="page"/>
<jsp:setProperty name ="user" property="userName" />
<jsp:setProperty name ="user" property="userBasicAddressNum" />
<jsp:setProperty name ="user" property="userAddress" />
<jsp:setProperty name ="user" property="userPhoneNum" />
<jsp:setProperty name ="user" property="userIntroRoute" />
<jsp:setProperty name ="user" property="userRoutine" />
<jsp:setProperty name ="user" property="userTerm" />




<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content = "text/html; charset=UTF-8">

<title>luppyworld_write_action_page</title>

</head>
<body>
	
	<!-- 글쓰기 부분 -->
	<%
		
 	int roundPrimeNum = 0;
	if(request.getParameter("roundPrimeNum")!=null){
		roundPrimeNum = Integer.parseInt(request.getParameter("roundPrimeNum"));
	}  



				RoundDAO roundDAO = new RoundDAO();
				int result = roundDAO.deleteRound(roundPrimeNum);
				
				if(result == -1 ){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('차수 추가에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");

				}
				
				else{
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('차수 삭제 성공')");
					script.println("location.href = 'productionAdmin.jsp'");
					script.println("</script>");
				}


		
		
	%>

		<script src ="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	
</body>
</html>