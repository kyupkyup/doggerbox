<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "recipe.Recipe" %>
<%@ page import= "recipe.RecipeDAO" %>
<%@ page import= "java.io.PrintWriter" %>

<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id ="recipe" class="recipe.Recipe" scope="page"/>
<jsp:setProperty name ="recipe" property="ingredientPrimeNum" />
<jsp:setProperty name ="recipe" property="mixRate" />





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

			int recipePrimeNum = 0;
			if(request.getParameter("recipePrimeNum")!=null){
				recipePrimeNum = Integer.parseInt(request.getParameter("recipePrimeNum"));
			}

			RecipeDAO recipeDAO = new RecipeDAO();

			
			int result = recipeDAO.recipeAdd(-1, recipe.getIngredientPrimeNum(), recipePrimeNum, recipe.getMixRate(), puppyPrimeNum);
			
			if(result == -1 ){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('재료 추가에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");

			}
			
			else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('재료 추가 성공')");
				script.println("location.href = 'puppyRecipeAdmin.jsp?puppyPrimeNum="+puppyPrimeNum+"'");
				script.println("</script>");
			}

		
	
	%>

	<script src ="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	
</body>

</html>