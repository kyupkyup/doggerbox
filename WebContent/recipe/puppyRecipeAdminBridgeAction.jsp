<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "recipe.Recipe" %>
<%@ page import= "recipe.RecipeDAO" %>
<%@ page import= "java.io.PrintWriter" %>
<%@page import = "java.util.ArrayList" %>

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
			int productPrimeNum = 0;
			if(request.getParameter("productPrimeNum")!=null){
				productPrimeNum = Integer.parseInt(request.getParameter("productPrimeNum"));
			}
		
		
	
			RecipeDAO recipeDAO = new RecipeDAO();
			ArrayList<Recipe> list = recipeDAO.getList(productPrimeNum);
			for(int i=0; i<list.size();i++){
				
			
			int result = recipeDAO.recipeAdd(productPrimeNum+100, list.get(i).getIngredientPrimeNum(),null, list.get(i).getMixRate(), puppyPrimeNum);
			

			}
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('불러오기 성공')");
			script.println("location.href = 'puppyRecipeAdmin.jsp?puppyPrimeNum="+puppyPrimeNum+"&productPrimeNum="+productPrimeNum+"'");
			script.println("</script>");
	
	%>

	<script src ="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	
</body>

</html>