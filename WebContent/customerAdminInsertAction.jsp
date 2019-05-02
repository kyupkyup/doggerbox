<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "doggerboxuser.DoggerboxUser" %>
<%@ page import= "doggerboxuser.DoggerboxUserDAO" %>
<%@ page import= "java.io.PrintWriter" %>

<%
	request.setCharacterEncoding("UTF-8");
%>
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
		/* 	int userPrimeNum = 0;
	 */	
	/* 	if(request.getParameter("userPrimeNum")!=null){
			userPrimeNum = Integer.parseInt(request.getParameter("userPrimeNum"));
		} */

		String userName = request.getParameter("userName");
	/* 	int userBasicAddressNum = Integer.parseInt(request.getParameter("userBasicAddressNum"));
		String userAddress = request.getParameter("userAddress"); */
		String userPhoneNum = request.getParameter("userPhoneNum");
		String userIntroRoute = request.getParameter("userIntroRoute");
		int userRoutine =  Integer.parseInt(request.getParameter("userRoutine"));
		int userTerm = Integer.parseInt(request.getParameter("userTerm"));
		
		
		if(userName==null ||userPhoneNum==null|| userIntroRoute==null ){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
			
			
		}
		
		else{
			DoggerboxUserDAO userDAO = new DoggerboxUserDAO();
			int result = userDAO.userAdd(userName,1,"주소",userPhoneNum,userIntroRoute,
					userRoutine,userTerm);
			
			if(result == -1 ){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원 추가에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");

			}
			
			else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원 추가 성공')");
				script.println("location.href = 'customerAdmin.jsp'");
				script.println("</script>");
			}

		
			
		}
	%>

	<script src ="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	
</body>

</html>