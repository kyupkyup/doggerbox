<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import = "recipe.Recipe" %>
<%@page import = "recipe.RecipeDAO" %>
<%@page import = "ingredient.Ingredient" %>
<%@page import = "ingredient.IngredientDAO" %>
<%@page import = "java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<meta charset=" text/html; euc-kr" http-equiv="Content-type" content="application/vns.cs-excel;">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
<script src ="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>

<body>
<%
	int productPrimeNum = 0;
	if(request.getParameter("productPrimeNum")!=null){
		productPrimeNum = Integer.parseInt(request.getParameter("productPrimeNum"));
	}
	int recipePrimeNum = 0;
	if(request.getParameter("recipePrimeNum")!=null){
		recipePrimeNum = Integer.parseInt(request.getParameter("recipePrimeNum"));
	}
	
%>

<nav class="navbar navbar-default">
	<div class="navbar-header">
		<a class="navbar-brand">도거박스 시스템관리 프로그램</a>
	</div>
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav">
			<li class=""><a href="../refined/realMain.jsp">메인</a>
		</ul>
		<ul class="nav navbar-nav">
			<li class=""><a href="../refined/main.jsp">주문 입력</a>
		</ul>
		<ul class="nav navbar-nav">
			<li class=""><a href="../refined/orderAdmin.jsp">주문 관리</a>
		</ul>
		<ul class="nav navbar-nav">
			<li class="active"><a href="recipeAdmin.jsp">베이스레시피/재료 관리</a>
		</ul>
	</div>
</nav>
<div class="container">
<button class="btn btn-primary" onclick="location.href='productRecipeAdminInsert.jsp?productPrimeNum=<%=productPrimeNum%>&recipePrimeNum=<%=recipePrimeNum%>'">재료 추가</button>

	
	<table id="order_list" border="1" rules="all" class="table table-bordered">
		
		<thead>
			<tr>
				<th>원료 번호</th>
				<th>원료 명</th>
				<th>배합비</th>
				<th>손실율</th>
				<th>kg 당 가격</th>
				<th>원가</th>
				<th>배합비 수정</th>
				<th>삭제</th>
				
			</tr>
			</thead>
			<tbody>
			<%
				double sumMixRate=0;
				double sumPricekg=0;
				double sumPrice=0;
				String num; 
			
				IngredientDAO ingredientDAO = new IngredientDAO();
				RecipeDAO recipeDAO = new RecipeDAO();
				ArrayList<Recipe> list = recipeDAO.getList(productPrimeNum);
				for(int i = 0; i< list.size(); i++){
				sumMixRate += list.get(i).getMixRate();
				sumPricekg += ingredientDAO.getIngredientPrice(list.get(i).getIngredientPrimeNum());
				sumPrice +=	ingredientDAO.getIngredientPrice(list.get(i).getIngredientPrimeNum())*list.get(i).getMixRate();
						
				
			%>
			
			
			<tr>
				<td><%=list.get(i).getIngredientPrimeNum()%></td>
				<td><%=ingredientDAO.getRawIngredient(list.get(i).getIngredientPrimeNum())%></td>
				<%
					if(list.get(i).getMixRate()==0){
						%>
						<td>배합비 정보 없음</td>
						<%
					}else{
				%>
				
				<td><%=list.get(i).getMixRate()%></td>
				
				<%
					}
				%>
				<td><%=ingredientDAO.getIngredientLossRate(list.get(i).getIngredientPrimeNum())%></td>
				<td><%=ingredientDAO.getIngredientPrice(list.get(i).getIngredientPrimeNum())%></td>
				<td><%=ingredientDAO.getIngredientPrice(list.get(i).getIngredientPrimeNum())*list.get(i).getMixRate()%></td>
				<td><button class="btn btn-default"onclick="location.href='productRecipeMixRateUpdate.jsp?ingredientPrimeNum=<%=list.get(i).getIngredientPrimeNum()%>&productPrimeNum=<%=productPrimeNum%>'">배합비 수정</button></td>
				<td><button class="btn btn-default"onclick="location.href='productRecipeDeleteAction.jsp?ingredientPrimeNum=<%=list.get(i).getIngredientPrimeNum()%>&productPrimeNum=<%=productPrimeNum%>'">삭제</button></td>
			</tr>
			
			 	
			<%
			}
			%>
			

			<tr>
				<td></td>
				<td></td>
				<td><%=String.format("%.5f" , sumMixRate)%></td>
				<td></td>
				<td><%=String.format("%.5f" , sumPricekg)%></td>
				<td><%=String.format("%.5f" , sumPrice) %></td>
				<td></td>
				<td></td>
			</tr>
			</tbody>
		</table>
		

		<script src ="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</div>	

</body>

</html>