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

<title>Insert title here</title>
</head>

<body>
<%
	int productPrimeNum = 0;
	if(request.getParameter("productPrimeNum")!=null){
		productPrimeNum = Integer.parseInt(request.getParameter("productPrimeNum"));
	}
	
	
%>


<button onclick="location.href='/doggerbox/main.jsp'">메인</button>
	<p>도거박스 제품 레시피 관리</p>
<button onclick="location.href='productRecipeAdminInsert.jsp?productPrimeNum=<%=productPrimeNum%>'">재료 추가</button>

	
	<table id="order_list" border="1" rules="all">
		
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
				<td><button onclick="location.href='productRecipeMixRateUpdate.jsp?ingredientPrimeNum=<%=list.get(i).getIngredientPrimeNum()%>&productPrimeNum=<%=productPrimeNum%>'">배합비 수정</button></td>
				<td><button onclick="location.href='productRecipeDeleteAction.jsp?ingredientPrimeNum=<%=list.get(i).getIngredientPrimeNum()%>&productPrimeNum=<%=productPrimeNum%>">삭제</button></td>
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