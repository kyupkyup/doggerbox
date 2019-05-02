<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import = "recipe.Recipe" %>
<%@page import = "recipe.RecipeDAO" %>
<%@page import = "order.Order" %>
<%@page import = "order.OrderDAO" %>
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
	
	int orderPrimeNum = 0;
	if(request.getParameter("orderPrimeNum")!=null){
		orderPrimeNum = Integer.parseInt(request.getParameter("orderPrimeNum"));
	}
	
	OrderDAO orderDAO = new OrderDAO();
	int individualGram = orderDAO.getIndividualGram(orderPrimeNum);
	int individualNum = orderDAO.getIndividualNum(orderPrimeNum);

%>


<button onclick="location.href='/doggerbox/main.jsp'">메인</button>
	<p>개별 레시피 재조량 산출</p>

	<table id="order_list" border="1" rules="all">
		
		<thead>
			<tr>
				<th>원료 번호</th>
				<th>원료 명</th>
				<th>배합비</th>
				<th>손실율</th>
				<th>kg 당 가격</th>
				<th>원가</th>
				<th>만들어야되는 양</th>
				<th>구매해야되는 양</th>

				
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
				
					ArrayList<Recipe> list = recipeDAO.getListByPuppy(puppyPrimeNum);
					
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
					<td><%=(individualGram*individualNum)* list.get(i).getMixRate()%></td>
					<td><%=((individualGram*individualNum)/(ingredientDAO.getIngredientLossRate(list.get(i).getIngredientPrimeNum())))*list.get(i).getMixRate()%></td>
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
	

</body>

</html>