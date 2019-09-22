
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "doggerboxuser.DoggerboxUser" %>
<%@ page import= "doggerboxuser.DoggerboxUserDAO" %>

<%@ page import= "java.io.PrintWriter" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
 <jsp:useBean id ="doggerboxuser" class="doggerboxuser.DoggerboxUser" scope="page"/>
<jsp:setProperty name ="doggerboxuser" property="userName" />
<jsp:setProperty name ="doggerboxuser" property="userAddressNum" />
<jsp:setProperty name ="doggerboxuser" property="userAddress" />
<jsp:setProperty name ="doggerboxuser" property="userEmail" />
<jsp:setProperty name ="doggerboxuser" property="userPhoneNum"  />




<!-- 회원가입 하기 전에 기본적으로 세팅되어야 할 부분 -->

<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content = "text/html; charset=UTF-8">

<title>luppyworld_join_page</title>

</head>
<body>
	
	<%
			 	String userID = null;
			if(request.getParameter("userID")!=null){
				userID = (String) request.getParameter("userID");
				
				
			}
			/*
			if(userID != null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 로그인이 되어 있습니다.')");
				script.println("location.href = 'main.jsp'");
				script.println("</script>");
			}
			 */  //회원가입 되어 있을 경우 튕기게 하는 코드 -> 추후에 구현할 것
			 

				
				if(
						doggerboxuser.getUserName()==null || 
								doggerboxuser.getUserAddress()==null || 
										doggerboxuser.getUserPhoneNum()==null || 
												doggerboxuser.getUserEmail()==null
				){
			
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 부분이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
				
				}		


				

				else {

			
		 DoggerboxUserDAO userDAO = new DoggerboxUserDAO();
				int result = userDAO.additional_information_update(doggerboxuser.getUserName(), doggerboxuser.getUserAddressNum(), doggerboxuser.getUserAddress(),
						doggerboxuser.getUserPhoneNum(), doggerboxuser.getUserEmail(), userID);


				if(result == -1 ){
			PrintWriter script = response.getWriter();

			script.println("<script>");
			script.println("alert('추가에 실패하였습니다.')");
			script.println("history.back()");
			script.println("</script>");

				}
				
				else{
			PrintWriter script = response.getWriter();

			script.println("<script>");
			script.println("alert('정보추가 성공')");

			script.println("location.href = 'main.jsp'");
			script.println("</script>");
				}
				
				}
		%>
	
</body>
</html>