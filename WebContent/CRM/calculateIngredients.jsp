<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="recipeList.RecipeList" %>
<%@ page import ="recipeList.RecipeListDAO" %>
<%@ page import ="recipe.Recipe" %>
<%@ page import ="recipe.RecipeDAO" %>
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

 	int sumPuppy = 0;
 	if(request.getParameter("sumPuppy")!=null){
 		sumPuppy = Integer.parseInt(request.getParameter("sumPuppy"));
	} 
 	int sumOriginal = 0;
 	if(request.getParameter("sumOriginal")!=null){
 		sumOriginal = Integer.parseInt(request.getParameter("sumOriginal"));
	} 
 	int sumSenior = 0;
 	if(request.getParameter("sumSenior")!=null){
 		sumSenior = Integer.parseInt(request.getParameter("sumSenior"));
	} 
 	int sumFish = 0;
 	if(request.getParameter("sumFish")!=null){
 		sumFish = Integer.parseInt(request.getParameter("sumFish"));
	} 
 	int sumPork = 0;
 	if(request.getParameter("sumPork")!=null){
 		sumPork = Integer.parseInt(request.getParameter("sumPork"));
	} 
 	int sumKangaroo = 0;
 	if(request.getParameter("sumKangaroo")!=null){
 		sumKangaroo = Integer.parseInt(request.getParameter("sumKangaroo"));
	} 
 	int sumHorse = 0;
 	if(request.getParameter("sumHorse")!=null){
 		sumHorse = Integer.parseInt(request.getParameter("sumHorse"));
	} 
 	
		OrderDAO orderDAO = new OrderDAO();
		RecipeListDAO recipeListDAO = new RecipeListDAO();
		RecipeDAO recipeDAO = new RecipeDAO();
		IngredientDAO ingredientDAO = new IngredientDAO();

		
		
/* 		for(int i = 1; i<7; i++){
			ArrayList<Recipe> list = recipeDAO.getList(i);

			for(int j=0; j<list.size(); j++)
			// 레시피에서 재료 한줄 씩
			{
				for(int k=0; k<Ilist.size(); k++){
					//재료 테이블에서 한줄씩 비교
					if(list.get(j).getIngredientPrimeNum()==Ilist.get(k).getIngredientPrimeNum()){
						if(i==1){
							Ilist.get(k).setSum(Ilist.get(k).getSum()+list.get(j).getMixRate()*sumPuppy);
						}
						else if(i==2){
							Ilist.get(k).setSum(Ilist.get(k).getSum()+list.get(j).getMixRate()*sumOriginal);

						}else if(i==3){
							Ilist.get(k).setSum(Ilist.get(k).getSum()+list.get(j).getMixRate()*sumSenior);

						}else if(i==4){
							Ilist.get(k).setSum(Ilist.get(k).getSum()+list.get(j).getMixRate()*sumFish);

						}else if(i==5){	
							Ilist.get(k).setSum(Ilist.get(k).getSum()+list.get(j).getMixRate()*sumPork);

						}else if(i==6){
							Ilist.get(k).setSum(Ilist.get(k).getSum()+list.get(j).getMixRate()*sumKangaroo);

						}
					}
					
				}
			}
		} */

		ArrayList<Ingredient> Ilist = ingredientDAO.getList();

		ArrayList<Order> orderList = orderDAO.getList(roundPrimeNum);

		for(int i=0; i<orderList.size(); i++){

			ArrayList<Recipe> listPuppy = recipeDAO.getListByRecipe(orderList.get(i).getOrderProductPuppyRecipePrimeNum());
			for(int k=0; k<listPuppy.size(); k++){
				for(int j=0; j<Ilist.size(); j++){
					if(listPuppy.get(k).getIngredientPrimeNum()==Ilist.get(j).getIngredientPrimeNum()){
						Ilist.get(j).setSum(Ilist.get(j).getSum()+(listPuppy.get(k).getMixRate()*orderList.get(i).getOrderProductPuppyGram()*orderList.get(i).getOrderProductPuppyNum()));
					}
				}
			}

			ArrayList<Recipe> listOriginal = recipeDAO.getListByRecipe(orderList.get(i).getOrderProductOriginalRecipePrimeNum());

			for(int k=0; k<listOriginal.size(); k++){
				for(int j=0; j<Ilist.size(); j++){
					if(listOriginal.get(k).getIngredientPrimeNum()==Ilist.get(j).getIngredientPrimeNum()){
						Ilist.get(j).setSum(Ilist.get(j).getSum()+(listOriginal.get(k).getMixRate()*orderList.get(i).getOrderProductOriginalGram()*orderList.get(i).getOrderProductOriginalNum()));
					}
				}
			}
			ArrayList<Recipe> listSenior = recipeDAO.getListByRecipe(orderList.get(i).getOrderProductSeniorRecipePrimeNum());
			for(int k=0; k<listSenior.size(); k++){
				for(int j=0; j<Ilist.size(); j++){
					if(listSenior.get(k).getIngredientPrimeNum()==Ilist.get(j).getIngredientPrimeNum()){
						Ilist.get(j).setSum(Ilist.get(j).getSum()+(listSenior.get(k).getMixRate()*orderList.get(i).getOrderProductSeniorGram()*orderList.get(i).getOrderProductSeniorNum()));
					}
				}
			}
			ArrayList<Recipe> listFish = recipeDAO.getListByRecipe(orderList.get(i).getOrderProductFishRecipePrimeNum());
			for(int k=0; k<listFish.size(); k++){
				for(int j=0; j<Ilist.size(); j++){
					if(listFish.get(k).getIngredientPrimeNum()==Ilist.get(j).getIngredientPrimeNum()){
						Ilist.get(j).setSum(Ilist.get(j).getSum()+(listFish.get(k).getMixRate()*orderList.get(i).getOrderProductFishGram()*orderList.get(i).getOrderProductFishNum()));
					}
				}
			}
			ArrayList<Recipe> listPork = recipeDAO.getListByRecipe(orderList.get(i).getOrderProductPorkRecipePrimeNum());
			for(int k=0; k<listPork.size(); k++){
				for(int j=0; j<Ilist.size(); j++){
					if(listPork.get(k).getIngredientPrimeNum()==Ilist.get(j).getIngredientPrimeNum()){
						Ilist.get(j).setSum(Ilist.get(j).getSum()+(listPork.get(k).getMixRate()*orderList.get(i).getOrderProductPorkGram()*orderList.get(i).getOrderProductPorkNum()));
					}
				}
			}
			ArrayList<Recipe> listKangaroo = recipeDAO.getListByRecipe(orderList.get(i).getOrderProductKangarooRecipePrimeNum());
			for(int k=0; k<listKangaroo.size(); k++){
				for(int j=0; j<Ilist.size(); j++){
					if(listKangaroo.get(k).getIngredientPrimeNum()==Ilist.get(j).getIngredientPrimeNum()){
						Ilist.get(j).setSum(Ilist.get(j).getSum()+(listKangaroo.get(k).getMixRate()*orderList.get(i).getOrderProductKangarooGram()*orderList.get(i).getOrderProductKangarooNum()));
					}
				}
			}
			ArrayList<Recipe> listHorse = recipeDAO.getListByRecipe(orderList.get(i).getOrderProductHorseRecipePrimeNum());
			for(int k=0; k<listHorse.size(); k++){
				for(int j=0; j<Ilist.size(); j++){
					if(listHorse.get(k).getIngredientPrimeNum()==Ilist.get(j).getIngredientPrimeNum()){
						Ilist.get(j).setSum(Ilist.get(j).getSum()+(listHorse.get(k).getMixRate()*orderList.get(i).getOrderProductHorseGram()*orderList.get(i).getOrderProductHorseNum()));
					}
				}
			}

		}
		
	%>
		<table style="display:inline" rules="all">
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
			for(int i=0; i<Ilist.size(); i++){
				sumPrice+=(Ilist.get(i).getIngredientPrice() * ((Ilist.get(i).getSum()/1000) / Ilist.get(i).getLossRate()));
				%>
				<tr>
					<td><%=Ilist.get(i).getRawIngredient()%></td>
					<td><%=Ilist.get(i).getLossRate()%></td>
					<td><%=Math.round(Ilist.get(i).getSum()*100)/100.0%>g</td>
					<td><strong><%=Math.round((Ilist.get(i).getSum() / Ilist.get(i).getLossRate())*100)/100.0 %>g</strong></td>
					<td><%=Math.round((Ilist.get(i).getIngredientPrice() * ((Ilist.get(i).getSum()/1000.0) / Ilist.get(i).getLossRate()))*100)/100.0%>원</td>
				</tr>
				<%
			}
			%>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					
				</tr>
			</tbody>
			
		</table>
		
		<div style="margin-left:100px; display:inline-block;">
			<strong style="font-size:40pt; font-weight:bold;">비용 총합</strong><br>
			<strong style="font-size:40pt; font-weight:bold;"><%=sumPrice%>원</strong>
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