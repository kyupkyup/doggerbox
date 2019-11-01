<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="recipeList.RecipeList" %>
<%@ page import ="recipeList.RecipeListDAO" %>
<%@ page import ="recipe.Recipe" %>
<%@ page import ="recipe.RecipeDAO2" %>
<%@ page import ="order.Order" %>
<%@ page import ="order.OrderDAO" %>
<%@ page import ="ingredient.Ingredient" %>
<%@ page import ="ingredient.IngredientDAO" %>
<%@page import = "java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<meta charset=" text/html; UTF-8" http-equiv="Content-type">
<title>도거박스 관리자페이지</title>
</head>
<body>
<button onclick="history.back()">이전 페이지</button>

<button onclick="location.href='main.jsp'">메인</button>

	<p>도거박스 관리자페이지</p>
	<%

 	int roundPrimeNum = 0;
 	if(request.getParameter("roundPrimeNum")!=null){
 		roundPrimeNum = Integer.parseInt(request.getParameter("roundPrimeNum"));
	} 
	RecipeDAO2 recipeDAO = new RecipeDAO2();
	IngredientDAO ingredientDAO = new IngredientDAO();
	ArrayList<Ingredient> ingredientList = ingredientDAO.getList();
	ArrayList<Order> list = new OrderDAO().getList(roundPrimeNum);
	for(int i=0; i<list.size(); i++){
		if(list.get(i).getOrderProductPuppyAvailable()>0){
			int productPuppyRecipePrimeNum = list.get(i).getOrderProductPuppyRecipePrimeNum();
			ArrayList<Recipe> recipeList = recipeDAO.getRecipe(productPuppyRecipePrimeNum);
			for(int j = 0; j<recipeList.size(); j++){
				for(int k = 0; k<ingredientList.size();k++){
					if(recipeList.get(j).getIngredientPrimeNum() == ingredientList.get(k).getIngredientPrimeNum()){
						ingredientList.get(k).setSum(ingredientList.get(k).getSum() + (list.get(i).getOrderProductPuppyGram() * list.get(i).getOrderProductPuppyNum() * recipeList.get(j).getMixRate()));
					}
				}
			}
		}
		else if(list.get(i).getOrderProductPuppyAvailable() == 0 && list.get(i).getOrderProductPuppyGram() >0){
			int productPuppyRecipePrimeNum = 1;
			ArrayList<Recipe> recipeList = recipeDAO.getRecipe(productPuppyRecipePrimeNum);
			for(int j = 0; j<recipeList.size(); j++){
				for(int k = 0; k<ingredientList.size();k++){
					if(recipeList.get(j).getIngredientPrimeNum() == ingredientList.get(k).getIngredientPrimeNum()){
						ingredientList.get(k).setSum(ingredientList.get(k).getSum() + (list.get(i).getOrderProductPuppyGram() * list.get(i).getOrderProductPuppyNum() * recipeList.get(j).getMixRate()));
					}
				}
			}
		}
		
		if(list.get(i).getOrderProductOriginalAvailable()>0){
			int productOriginalRecipePrimeNum = list.get(i).getOrderProductOriginalRecipePrimeNum();
			ArrayList<Recipe> recipeList = recipeDAO.getRecipe(productOriginalRecipePrimeNum);
			for(int j = 0; j<recipeList.size(); j++){
				for(int k = 0; k<ingredientList.size();k++){
					if(recipeList.get(j).getIngredientPrimeNum() == ingredientList.get(k).getIngredientPrimeNum()){
						ingredientList.get(k).setSum(ingredientList.get(k).getSum() + (list.get(i).getOrderProductOriginalGram() * list.get(i).getOrderProductOriginalNum() * recipeList.get(j).getMixRate()));
					}
				}
			}
		}
		else if(list.get(i).getOrderProductOriginalAvailable() == 0 && list.get(i).getOrderProductOriginalGram() >0){
			int productOriginalRecipePrimeNum = 2;
			ArrayList<Recipe> recipeList = recipeDAO.getRecipe(productOriginalRecipePrimeNum);
			for(int j = 0; j<recipeList.size(); j++){
				for(int k = 0; k<ingredientList.size();k++){
					if(recipeList.get(j).getIngredientPrimeNum() == ingredientList.get(k).getIngredientPrimeNum()){
						ingredientList.get(k).setSum(ingredientList.get(k).getSum() + (list.get(i).getOrderProductOriginalGram() * list.get(i).getOrderProductOriginalNum() * recipeList.get(j).getMixRate()));
					}
				}
			}
		}
		
		if(list.get(i).getOrderProductSeniorAvailable()>0){
			int productSeniorRecipePrimeNum = list.get(i).getOrderProductSeniorRecipePrimeNum();
			ArrayList<Recipe> recipeList = recipeDAO.getRecipe(productSeniorRecipePrimeNum);
			for(int j = 0; j<recipeList.size(); j++){
				for(int k = 0; k<ingredientList.size();k++){
					if(recipeList.get(j).getIngredientPrimeNum() == ingredientList.get(k).getIngredientPrimeNum()){
						ingredientList.get(k).setSum(ingredientList.get(k).getSum() + (list.get(i).getOrderProductSeniorGram() * list.get(i).getOrderProductSeniorNum() * recipeList.get(j).getMixRate()));
					}
				}
			}
		}
		else if(list.get(i).getOrderProductSeniorAvailable() == 0 && list.get(i).getOrderProductSeniorGram() >0){
			int productSeniorRecipePrimeNum = 3;
			ArrayList<Recipe> recipeList = recipeDAO.getRecipe(productSeniorRecipePrimeNum);
			for(int j = 0; j<recipeList.size(); j++){
				for(int k = 0; k<ingredientList.size();k++){
					if(recipeList.get(j).getIngredientPrimeNum() == ingredientList.get(k).getIngredientPrimeNum()){
						ingredientList.get(k).setSum(ingredientList.get(k).getSum() + (list.get(i).getOrderProductSeniorGram() * list.get(i).getOrderProductSeniorNum() * recipeList.get(j).getMixRate()));
					}
				}
			}
		}
		
		if(list.get(i).getOrderProductFishAvailable()>0){
			int productFishRecipePrimeNum = list.get(i).getOrderProductFishRecipePrimeNum();
			ArrayList<Recipe> recipeList = recipeDAO.getRecipe(productFishRecipePrimeNum);
			for(int j = 0; j<recipeList.size(); j++){
				for(int k = 0; k<ingredientList.size();k++){
					if(recipeList.get(j).getIngredientPrimeNum() == ingredientList.get(k).getIngredientPrimeNum()){
						ingredientList.get(k).setSum(ingredientList.get(k).getSum() + (list.get(i).getOrderProductFishGram() * list.get(i).getOrderProductFishNum() * recipeList.get(j).getMixRate()));
					}
				}
			}
		}
		else if(list.get(i).getOrderProductFishAvailable() == 0 && list.get(i).getOrderProductFishGram() >0){
			int productFishRecipePrimeNum = 4;
			ArrayList<Recipe> recipeList = recipeDAO.getRecipe(productFishRecipePrimeNum);
			for(int j = 0; j<recipeList.size(); j++){
				for(int k = 0; k<ingredientList.size();k++){
					if(recipeList.get(j).getIngredientPrimeNum() == ingredientList.get(k).getIngredientPrimeNum()){
						ingredientList.get(k).setSum(ingredientList.get(k).getSum() + (list.get(i).getOrderProductFishGram() * list.get(i).getOrderProductFishNum() * recipeList.get(j).getMixRate()));
					}
				}
			}
		}
		
		if(list.get(i).getOrderProductPorkAvailable()>0){
			int productPorkRecipePrimeNum = list.get(i).getOrderProductPorkRecipePrimeNum();
			ArrayList<Recipe> recipeList = recipeDAO.getRecipe(productPorkRecipePrimeNum);
			for(int j = 0; j<recipeList.size(); j++){
				for(int k = 0; k<ingredientList.size();k++){
					if(recipeList.get(j).getIngredientPrimeNum() == ingredientList.get(k).getIngredientPrimeNum()){
						ingredientList.get(k).setSum(ingredientList.get(k).getSum() + (list.get(i).getOrderProductPorkGram() * list.get(i).getOrderProductPorkNum() * recipeList.get(j).getMixRate()));
					}
				}
			}
		}
		else if(list.get(i).getOrderProductPorkAvailable() == 0 && list.get(i).getOrderProductPorkGram() >0){
			int productPorkRecipePrimeNum = 5;
			ArrayList<Recipe> recipeList = recipeDAO.getRecipe(productPorkRecipePrimeNum);
			for(int j = 0; j<recipeList.size(); j++){
				for(int k = 0; k<ingredientList.size();k++){
					if(recipeList.get(j).getIngredientPrimeNum() == ingredientList.get(k).getIngredientPrimeNum()){
						ingredientList.get(k).setSum(ingredientList.get(k).getSum() + (list.get(i).getOrderProductPorkGram() * list.get(i).getOrderProductPorkNum() * recipeList.get(j).getMixRate()));
					}
				}
			}
		}
		
		if(list.get(i).getOrderProductKangarooAvailable()>0){
			int productKangarooRecipePrimeNum = list.get(i).getOrderProductKangarooRecipePrimeNum();
			ArrayList<Recipe> recipeList = recipeDAO.getRecipe(productKangarooRecipePrimeNum);
			for(int j = 0; j<recipeList.size(); j++){
				for(int k = 0; k<ingredientList.size();k++){
					if(recipeList.get(j).getIngredientPrimeNum() == ingredientList.get(k).getIngredientPrimeNum()){
						ingredientList.get(k).setSum(ingredientList.get(k).getSum() + (list.get(i).getOrderProductKangarooGram() * list.get(i).getOrderProductKangarooNum() * recipeList.get(j).getMixRate()));
					}
				}
			}
		}
		else if(list.get(i).getOrderProductKangarooAvailable() == 0 && list.get(i).getOrderProductKangarooGram() >0){
			int productKangarooRecipePrimeNum = 6;
			ArrayList<Recipe> recipeList = recipeDAO.getRecipe(productKangarooRecipePrimeNum);
			for(int j = 0; j<recipeList.size(); j++){
				for(int k = 0; k<ingredientList.size();k++){
					if(recipeList.get(j).getIngredientPrimeNum() == ingredientList.get(k).getIngredientPrimeNum()){
						ingredientList.get(k).setSum(ingredientList.get(k).getSum() + (list.get(i).getOrderProductKangarooGram() * list.get(i).getOrderProductKangarooNum() * recipeList.get(j).getMixRate()));
					}
				}
			}
		}
		
		if(list.get(i).getOrderProductHorseAvailable()>0){
			int productHorseRecipePrimeNum = list.get(i).getOrderProductHorseRecipePrimeNum();
			ArrayList<Recipe> recipeList = recipeDAO.getRecipe(productHorseRecipePrimeNum);
			for(int j = 0; j<recipeList.size(); j++){
				for(int k = 0; k<ingredientList.size();k++){
					if(recipeList.get(j).getIngredientPrimeNum() == ingredientList.get(k).getIngredientPrimeNum()){
						ingredientList.get(k).setSum(ingredientList.get(k).getSum() + (list.get(i).getOrderProductHorseGram() * list.get(i).getOrderProductHorseNum() * recipeList.get(j).getMixRate()));
					}
				}
			}
		}
		else if(list.get(i).getOrderProductHorseAvailable() == 0 && list.get(i).getOrderProductHorseGram() >0){
			int productHorseRecipePrimeNum = 7;
			ArrayList<Recipe> recipeList = recipeDAO.getRecipe(productHorseRecipePrimeNum);
			for(int j = 0; j<recipeList.size(); j++){
				for(int k = 0; k<ingredientList.size();k++){
					if(recipeList.get(j).getIngredientPrimeNum() == ingredientList.get(k).getIngredientPrimeNum()){
						ingredientList.get(k).setSum(ingredientList.get(k).getSum() + (list.get(i).getOrderProductHorseGram() * list.get(i).getOrderProductHorseNum() * recipeList.get(j).getMixRate()));
					}
				}
			}
		}
	}
		
	%>
		<table class="table table-bordered" rules="all">
			<thead>	
				<tr>
					<th>재료명</th>
					<th>손실율</th>
					<th>만들어지는 양</th>		
					<th>구입해야 하는 양</th>
					<th>가격</th>		
				</tr>
			</thead>
			
			
			<tbody>
			<%
			int sumPrice=0;
			double sum = 0;
			for(int i=0; i<ingredientList.size(); i++){
				sumPrice+=(ingredientList.get(i).getIngredientPrice() * ((ingredientList.get(i).getSum()/1000) / ingredientList.get(i).getLossRate()));
				sum += ingredientList.get(i).getSum()/1000;
				%>
				<tr>
					<td><%=ingredientList.get(i).getRawIngredient()%></td>
					<td><%=ingredientList.get(i).getLossRate()%></td>
					<td><%=Math.round(ingredientList.get(i).getSum()*100)/100.0%>g</td>
					<td><strong><%=Math.round((ingredientList.get(i).getSum() / ingredientList.get(i).getLossRate())*100)/100.0 %>g</strong></td>
					<td><%=Math.round((ingredientList.get(i).getIngredientPrice() * ((ingredientList.get(i).getSum()/1000.0) / ingredientList.get(i).getLossRate()))*100)/100.0%>원</td>
				</tr>
				<%
			}
			%>
				<tr>
					<td></td>
					<td></td>
					<td><%=Math.round(sum * 100000) / 100 %> g </td>
					<td></td>
					<td></td>
					
				</tr>
			</tbody>
			
		</table>
		
		<div style="margin-left:100px; display:inline-block;">
			<strong style="font-size:30pt; font-weight:bold;">비용 총합</strong><br>
			<strong style="font-size:30pt; font-weight:bold;"><%=sumPrice%>원</strong>
		</div>
		<div style="margin-left:100px; display:inline-block;">
			<strong style="font-size:30pt; font-weight:bold;">총 중량</strong><br>
			<strong style="font-size:30pt; font-weight:bold;"><%=Math.round(sum * 100000) / 100000.0%> kg</strong>
		</div>
	
		<script src ="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
	var num;
	 function roundNum(num){
		return num.toPrecision(3);
	}
	</script>
</body>

</html>