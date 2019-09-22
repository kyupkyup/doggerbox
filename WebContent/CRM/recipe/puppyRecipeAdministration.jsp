<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import = "recipe.Recipe" %>
<%@page import = "recipe.RecipeDAO" %>
<%@page import = "recipeList.RecipeList" %>
<%@page import = "recipeList.RecipeListDAO" %>
<%@page import = "order.Order" %>
<%@page import = "order.OrderDAO" %>
<%@page import = "puppy.Puppy" %>
<%@page import = "puppy.PuppyDAO" %>
<%@page import = "ingredient.Ingredient" %>
<%@page import = "ingredient.IngredientDAO" %>
<%@page import = "java.util.ArrayList" %>
<%@ page import= "java.io.PrintWriter" %>

<!DOCTYPE html>
<html>
<head>
<meta charset=" text/html; euc-kr" http-equiv="Content-type" content="application/vns.cs-excel;">

<title>Insert title here</title>
</head>
<script type="text/javascript">

</script>
<body>
<%
	int puppyPrimeNum = 0;
	if(request.getParameter("puppyPrimeNum")!=null){
		puppyPrimeNum = Integer.parseInt(request.getParameter("puppyPrimeNum"));
	}
	
	int productPrimeNum = 0;
	if(request.getParameter("productPrimeNum")!=null){
		productPrimeNum = Integer.parseInt(request.getParameter("productPrimeNum"));
	}
	
	OrderDAO orderDAO = new OrderDAO();
	
%>

<button onclick="history.back()">이전 페이지</button>

<button onclick="location.href='../main.jsp'">메인</button>
	<p>강아지 개별 레시피 관리</p>


<button onclick="location.href='puppyRecipeAdminBridge.jsp?puppyPrimeNum=<%=puppyPrimeNum%>'">레시피 추가</button>
	
	
	<table id="order_list" border="1" rules="all">
		
		<thead>
			<tr>
				<th>레시피 번호</th>
				<th>제품 이름</th>
				<th>등록 날짜</th>
				<th>수정</th>
				<th>삭제</th>

				
			</tr>
			</thead>
			<tbody>
			<%

				RecipeListDAO recipeListDAO = new RecipeListDAO();
				PuppyDAO puppyDAO = new PuppyDAO();
					ArrayList<RecipeList> list = recipeListDAO.getList(puppyPrimeNum);
					
					for(int i = 0; i< list.size(); i++){
					
				%>
		
				<tr>
					<td><%=list.get(i).getRecipePrimeNum()%></td>
					<td><%=list.get(i).getProductName()%></td>
					<td><%=list.get(i).getRecipeDate()%></td>
					
					<td><a href="puppyRecipeAdmin.jsp?puppyPrimeNum=<%=puppyPrimeNum%>&recipePrimeNum=<%=list.get(i).getRecipePrimeNum()%>"><button>관리</button></a></td> <!-- 레시피 세부내용 puppyRecipeAdmin -->
					<td><a href="puppyRecipeDeleteAction.jsp?recipePrimeNum=<%=list.get(i).getRecipePrimeNum() %>&puppyPrimeNum=<%=puppyPrimeNum%>&productPrimeNum=<%=productPrimeNum%>"><button>삭제</button></a></td>
				</tr>
				
				 	
				<%
				}

				
			%>

			<tr>

			</tr>
			</tbody>
		</table>
	

		<script src ="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	

</body>

</html>