<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "ingredient.Ingredient" %>
<%@ page import= "ingredient.IngredientDAO" %>
<%@ page import= "java.io.PrintWriter" %>

<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id ="ingredient" class="ingredient.Ingredient" scope="page"/>
<jsp:setProperty name ="ingredient" property="rawIngredient" />
<jsp:setProperty name ="ingredient" property="lossRate" />
<jsp:setProperty name ="ingredient" property="ingredientPrice" />





<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content = "text/html; charset=UTF-8">

<title>luppyworld_write_action_page</title>

</head>
<body>
	
	<!-- 글쓰기 부분 -->
	<%
	int ingredientPrimeNum =0;
	if(request.getParameter("ingredientPrimeNum")!=null){
		ingredientPrimeNum = Integer.parseInt(request.getParameter("ingredientPrimeNum"));
	}

		if(ingredient.getRawIngredient()==null ||ingredient.getLossRate()==0 ){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
			
			
		}
		
		else{
			IngredientDAO ingredientDAO = new IngredientDAO();
			int result = ingredientDAO.ingredientUpdate(ingredient.getRawIngredient(), ingredient.getLossRate(), ingredient.getIngredientPrice(), ingredientPrimeNum);
			
			if(result == -1 ){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('재료 수정에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");

			}
			
			else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('재료 수정 성공')");
				script.println("location.href = 'totalRecipeAdmin.jsp'");
				script.println("</script>");
			}

		
			
		}
	%>

	<script src ="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	
</body>

</html>