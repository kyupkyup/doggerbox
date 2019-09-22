<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "recipeList.RecipeList" %>
<%@ page import= "recipeList.RecipeListDAO" %>
<%@ page import= "recipe.Recipe" %>
<%@ page import= "recipe.RecipeDAO" %>
<%@ page import= "java.io.PrintWriter" %>
<%@page import = "java.util.ArrayList" %>

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
			int puppyPrimeNum = 0;
			if(request.getParameter("puppyPrimeNum")!=null){
				puppyPrimeNum = Integer.parseInt(request.getParameter("puppyPrimeNum"));
			}
/* 			String productName = null;
			if(request.getParameter("productName")!=null){
				productName =request.getParameter("productName");
			} */
			int productPrimeNum = 0;
			if(request.getParameter("productPrimeNum")!=null){
				productPrimeNum = Integer.parseInt(request.getParameter("productPrimeNum"));
			}
			/* 			int recipePrimeNum = 0;
			if(request.getParameter("recipePrimeNum")!=null){
				recipePrimeNum = Integer.parseInt(request.getParameter("recipePrimeNum"));
			} */
			
			
			RecipeListDAO recipeListDAO = new RecipeListDAO();
			RecipeDAO recipeDAO = new RecipeDAO();
			
			String productName = recipeListDAO.getProductName(productPrimeNum);
			if(productName==null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('제품 명을 불러오지 못했습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			int recipePrimeNum = recipeListDAO.getRecipePrimeNum(productPrimeNum);
			if(recipePrimeNum==-1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('레시피 고유번호를 불러오지 못했씁니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			int result = recipeListDAO.recipeListAdd(puppyPrimeNum, productName, productPrimeNum);
				
			int MaxRecipePrimeNum = recipeListDAO.getMaxRecipePrimeNum();
			ArrayList<Recipe> list = recipeDAO.getListByRecipe(productPrimeNum);

			if(result==-1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('불러오기 실패')");
				script.println("history.back()");
				script.println("</script>");
			}

			for(int i=0; i<list.size(); i++){
				int result1 = recipeDAO.customRecipeBaseAdd(list.get(i).getIngredientPrimeNum(), list.get(i).getRawIngredient(), MaxRecipePrimeNum, list.get(i).getMixRate() , puppyPrimeNum );
				
				
			}
			
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('불러오기 성공')");
			script.println("opener.parent.recipeAdminFunction("+recipePrimeNum+");");
			script.println("self.close();");
			script.println("</script>");
	%>

	<script src ="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	
</body>

</html>