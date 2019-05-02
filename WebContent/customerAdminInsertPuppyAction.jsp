<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "puppy.Puppy" %>
<%@ page import= "puppy.PuppyDAO" %>
<%@ page import= "java.io.PrintWriter" %>

<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id ="puppy" class="puppy.Puppy" scope="page"/>
<jsp:setProperty name ="puppy" property="userPrimeNum" />
<jsp:setProperty name ="puppy" property="puppyPrimeNum" />
<jsp:setProperty name ="puppy" property="puppyName" />
<jsp:setProperty name ="puppy" property="puppySpecies" />
<jsp:setProperty name ="puppy" property="puppyAge" />
<jsp:setProperty name ="puppy" property="puppyGender" />
<jsp:setProperty name ="puppy" property="puppyNeutralization" />
<jsp:setProperty name ="puppy" property="puppyWeight" />
<jsp:setProperty name ="puppy" property="puppyActivity" />
<jsp:setProperty name ="puppy" property="puppyETC" />
<jsp:setProperty name ="puppy" property="puppyRestrict" />
<jsp:setProperty name ="puppy" property="recommendQuantity" />


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

	
			
			if(
					puppy.getPuppyName()==null ||puppy.getPuppySpecies()==null|| puppy.getPuppyAge()==0
				||puppy.getPuppyNeutralization()==0 ||puppy.getPuppyGender()==0||
						puppy.getPuppyWeight()==0 ||puppy.getPuppyActivity()==0||puppy.getPuppyETC()==null 
						||puppy.getPuppyRestrict()==null||puppy.getRecommendQuantity()==0
					){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
				
				
			}
			
			else{
				PuppyDAO puppyDAO = new PuppyDAO();
				int result = puppyDAO.puppyAdd(userPrimeNum,puppy.getPuppyName(),puppy.getPuppySpecies(),puppy.getPuppyAge()
						,puppy.getPuppyGender(),
						puppy.getPuppyNeutralization(),puppy.getPuppyWeight(),puppy.getPuppyActivity(),
						puppy.getRecommendQuantity(),puppy.getPuppyETC(),puppy.getPuppyRestrict());
				
				if(result == -1 ){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('강아지 추가에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");

				}
				
				else{
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('강아지 추가 성공')");
					script.println("location.href = 'customerAdminPuppy.jsp?userPrimeNum="+userPrimeNum+"'");
					script.println("</script>");
				}

	
				
			}
			
		
		
	%>

	<script src ="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	
</body>

</html>