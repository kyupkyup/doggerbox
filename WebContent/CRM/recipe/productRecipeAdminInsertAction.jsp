<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "recipe.Recipe" %>
<%@ page import= "recipe.RecipeDAO" %>
<%@ page import= "java.io.PrintWriter" %>
<%@ page import= "util.CheckType" %>

<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id ="recipe" class="recipe.Recipe" scope="page"/>
<jsp:setProperty name ="recipe" property="ingredientPrimeNum" />
<jsp:setProperty name ="recipe" property="rawIngredient" />
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
			int productPrimeNum = 0;
			if(request.getParameter("productPrimeNum")!=null){
				productPrimeNum = Integer.parseInt(request.getParameter("productPrimeNum"));
			}

			int recipePrimeNum = 0;
			if(request.getParameter("recipePrimeNum")!=null){
				recipePrimeNum = Integer.parseInt(request.getParameter("recipePrimeNum"));
			}
			

	
			RecipeDAO recipeDAO = new RecipeDAO();
			int result = recipeDAO.recipeAdd(productPrimeNum, recipe.getIngredientPrimeNum(), recipe.getRawIngredient(), recipePrimeNum, recipe.getMixRate(), -1);
			
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
				script.println("location.href = 'productRecipeAdminInsert.jsp?productPrimeNum="+productPrimeNum+"&recipePrimeNum="+recipePrimeNum+"'");
				script.println("</script>");
			}

		
	
	%>

	<script src ="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	
</body>

</html>