<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "recipe.Recipe" %>
<%@ page import= "recipe.RecipeDAO" %>
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

			int recipePrimeNum = 0;
			if(request.getParameter("recipePrimeNum")!=null){
				recipePrimeNum = Integer.parseInt(request.getParameter("recipePrimeNum"));
			}
			String rawIngredient = null;
			if(request.getParameter("rawIngredient")!=null){
				rawIngredient = request.getParameter("rawIngredient");
			}			
			int ingredientPrimeNum = 0;
			if(request.getParameter("ingredientPrimeNum")!=null){
				ingredientPrimeNum = Integer.parseInt(request.getParameter("ingredientPrimeNum"));
			}			
			int puppyPrimeNum = 0;
			if(request.getParameter("puppyPrimeNum")!=null){
				puppyPrimeNum = Integer.parseInt(request.getParameter("puppyPrimeNum"));
			}
			
			RecipeDAO recipeDAO = new RecipeDAO();
			int result = recipeDAO.recipeAdd( ingredientPrimeNum, rawIngredient, recipePrimeNum, puppyPrimeNum );
			
			if(result == -1 ){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('재료 추가에 실패했습니다.')");
				script.println("self.close();");
				script.println("</script>");

			}
			
			else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('재료 추가 성공')");
				script.println("opener.parent.recipeAdminFunction("+recipePrimeNum+");");

				script.println("self.close();");

				script.println("</script>");
			}

		
	
	%>

	<script src ="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	
</body>

</html>