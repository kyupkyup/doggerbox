<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "recipe.Recipe" %>
<%@ page import= "recipe.RecipeDAO" %>
<%@ page import= "recipeList.RecipeList" %>
<%@ page import= "recipeList.RecipeListDAO" %>

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
		
 	int recipePrimeNum = 0;
 	if(request.getParameter("recipePrimeNum")!=null){
 		recipePrimeNum = Integer.parseInt(request.getParameter("recipePrimeNum"));
	} 

 	int puppyPrimeNum = 0;
 	if(request.getParameter("puppyPrimeNum")!=null){
 		puppyPrimeNum = Integer.parseInt(request.getParameter("puppyPrimeNum"));
	} 

 	int productPrimeNum = 0;
 	if(request.getParameter("productPrimeNum")!=null){
 		productPrimeNum = Integer.parseInt(request.getParameter("productPrimeNum"));
	} 

			
			
				RecipeDAO recipeDAO = new RecipeDAO();
				RecipeListDAO recipeListDAO = new RecipeListDAO();

				int result = recipeDAO.recipeDelete(recipePrimeNum);
				int result1 = recipeListDAO.recipeDelete(recipePrimeNum);

				if(result == -1 ){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('레시피 삭제에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");

				}
				if(result1 == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('레시피 삭제에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}
				
				else{
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('레시피 삭제 성공')");
					script.println("location.href = 'puppyRecipeAdministration.jsp?puppyPrimeNum="+puppyPrimeNum+"&productPrimeNum="+productPrimeNum+"'");
					script.println("</script>");
				}

	
	
			
		
		
	%>

	<script src ="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	
</body>

</html>