<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="recipeList.RecipeList" %>
<%@ page import ="recipeList.RecipeListDAO" %>
<%@ page import ="recipe.Recipe" %>
<%@ page import ="recipe.RecipeDAO" %>
<%@ page import ="order.Order" %>
<%@ page import ="order.OrderDAO" %>
<%@ page import ="doggerboxuser.DoggerboxUserDAO" %>
<%@ page import ="doggerboxuser.DoggerboxUser" %>
<%@ page import ="puppy.Puppy" %>
<%@ page import ="puppy.PuppyDAO" %>
<%@ page import ="ingredient.Ingredient" %>
<%@ page import ="ingredient.IngredientDAO" %>
<%@page import = "java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<meta charset=" text/html; UTF-8" http-equiv="Content-type">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../../css/userList.css">
<script src ="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 
<title>도거박스 관리자페이지</title>
</head>
<body>
 <nav class="navbar navbar-default">
	<div class="navbar-header">
		<a class="navbar-brand">도거박스 시스템관리 프로그램</a>
	</div>
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav ">
					<li class=""><a href="refined/realMain.jsp">메인</a>
		
		</ul>
		<ul class="nav navbar-nav ">
			<li class="active"><a href="refined/main.jsp">주문 입력</a>
		</ul>
		<ul class="nav navbar-nav ">
			<li class=""><a href="refined/orderAdmin.jsp">주문 관리</a>
		</ul>
		<ul class="nav navbar-nav ">
			<li class=""><a href="recipe/recipeAdmin.jsp">베이스레시피/재료 관리</a>
		</ul>
	</div>
</nav>
<div class="container">

	
	<%

 	int orderPrimeNum = 0;
 	if(request.getParameter("orderPrimeNum")!=null){
 		orderPrimeNum = Integer.parseInt(request.getParameter("orderPrimeNum"));
	} 
	DoggerboxUserDAO userDAO = new DoggerboxUserDAO();
	PuppyDAO puppyDAO = new PuppyDAO();
	
 	OrderDAO orderDAO = new OrderDAO();
 	
 	Order order = orderDAO.getOrder(orderPrimeNum);
 	int userPrimeNum = order.getUserPrimeNum();
	int puppyPrimeNum = order.getPuppyPrimeNum();
 	RecipeDAO recipeDAO = new RecipeDAO();
 	IngredientDAO ingredientDAO = new IngredientDAO();
 	%>
 	

 	 <p><%=userDAO.getUserName(userPrimeNum) %> 의 <%=puppyDAO.getPuppyName(puppyPrimeNum) %> 의 처방 레시피</p>
 	
 	<%
 	if(order.getOrderProductPuppyAvailable()==1){//퍼피
 		%>
 		<p>퍼피 기반 처방레시피 </p>
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
			
			
			ArrayList<Recipe> Ilist = recipeDAO.getListByRecipe(order.getOrderProductPuppyRecipePrimeNum());
			
			double sum = order.getOrderProductPuppyNum() * order.getOrderProductPuppyGram();

			for(int i=0; i<Ilist.size(); i++){
				int ingredientPrimeNum = Ilist.get(i).getIngredientPrimeNum();
				Ingredient ingredient = ingredientDAO.getIngredient(ingredientPrimeNum);
				if(ingredient!=null){
					
				
				%>
						<tr>
							<td><%=ingredient.getRawIngredient()%></td>
							<td><%=ingredient.getLossRate()%></td>
							<td><%=Math.round(sum*Ilist.get(i).getMixRate()*100)/100.0%>g</td>
							<td><strong><%=Math.round(((sum*Ilist.get(i).getMixRate()) / ingredient.getLossRate()*100)/100.0) %>g</strong></td>
							<td><%=Math.round((ingredient.getIngredientPrice() * ((sum*Ilist.get(i).getMixRate()/1000.0) / ingredient.getLossRate())*100)/100.0)%>원</td>
						</tr>
						<%
						}
					}
			%>

				<tr>
					<td></td>
					<td></td>
					<td><%=sum%></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
 	<%
 	}
			else if(order.getOrderProductOriginalAvailable()==1){//오리지날
		 		%>		 		
		 		<p>오리지날 기반 처방레시피 </p>
		 		
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
					
					
					ArrayList<Recipe> Ilist = recipeDAO.getListByRecipe(order.getOrderProductOriginalRecipePrimeNum());
					
					double sum = order.getOrderProductOriginalNum() * order.getOrderProductOriginalGram();

					for(int i=0; i<Ilist.size(); i++){
						int ingredientPrimeNum = Ilist.get(i).getIngredientPrimeNum();
						Ingredient ingredient = ingredientDAO.getIngredient(ingredientPrimeNum);
						if(ingredient!=null){
							
						%>
						<tr>
							<td><%=ingredient.getRawIngredient()%></td>
							<td><%=ingredient.getLossRate()%></td>
							<td><%=Math.round(sum*Ilist.get(i).getMixRate()*100)/100.0%>g</td>
							<td><strong><%=Math.round(((sum*Ilist.get(i).getMixRate()) / ingredient.getLossRate()*100)/100.0) %>g</strong></td>
							<td><%=Math.round((ingredient.getIngredientPrice() * ((sum*Ilist.get(i).getMixRate()/1000.0) / ingredient.getLossRate())*100)/100.0)%>원</td>
						</tr>
						<%
						}
					}
			%>

				<tr>
					<td></td>
					<td></td>
					<td><%=sum %></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
<%-- 		<div style="margin-left:100px; display:inline-block;">
			<strong style="font-size:40pt; font-weight:bold;">비용 총합</strong><br>
			<strong style="font-size:40pt; font-weight:bold;"><%=sumPrice%>원</strong>
		</div> --%>
 		<%
 	}
			else if(order.getOrderProductSeniorAvailable()==1){ //시니어		 		
			%>
				<p>시니어 기반 처방레시피 </p>
			
		 		<table class="table table-bordered"rules="all">
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
					double sum = order.getOrderProductSeniorNum() * order.getOrderProductSeniorGram();

					
					ArrayList<Recipe> Ilist = recipeDAO.getListByRecipe(order.getOrderProductSeniorRecipePrimeNum());
					
					
					for(int i=0; i<Ilist.size(); i++){
						int ingredientPrimeNum = Ilist.get(i).getIngredientPrimeNum();
						Ingredient ingredient = ingredientDAO.getIngredient(ingredientPrimeNum);
						if(ingredient!=null){
							
						%>
						<tr>
							<td><%=ingredient.getRawIngredient()%></td>
							<td><%=ingredient.getLossRate()%></td>
							<td><%=Math.round(sum*Ilist.get(i).getMixRate()*100)/100.0%>g</td>
							<td><strong><%=Math.round(((sum*Ilist.get(i).getMixRate()) / ingredient.getLossRate()*100)/100.0) %>g</strong></td>
							<td><%=Math.round((ingredient.getIngredientPrice() * ((sum*Ilist.get(i).getMixRate()/1000.0) / ingredient.getLossRate())*100)/100.0)%>원</td>
						</tr>
						<%
						}
					}
			%>

				<tr>
					<td></td>
					<td></td>
					<td><%=sum %></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
<%-- 		<div style="margin-left:100px; display:inline-block;">
			<strong style="font-size:40pt; font-weight:bold;">비용 총합</strong><br>
			<strong style="font-size:40pt; font-weight:bold;"><%=sumPrice%>원</strong>
		</div> --%>
 		<%
 	}
			else if(order.getOrderProductFishAvailable()==1){//피시
		 		%>
		 		<p>피쉬 기반 처방레시피 </p>
		 		
		 		<table class="table table-bordered"rules="all">
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
					
					
					ArrayList<Recipe> Ilist = recipeDAO.getListByRecipe(order.getOrderProductFishRecipePrimeNum());
					double sum = order.getOrderProductFishNum() * order.getOrderProductFishGram();

					
					for(int i=0; i<Ilist.size(); i++){
						int ingredientPrimeNum = Ilist.get(i).getIngredientPrimeNum();
						Ingredient ingredient = ingredientDAO.getIngredient(ingredientPrimeNum);
						if(ingredient!=null){
							
						%>
						<tr>
							<td><%=ingredient.getRawIngredient()%></td>
							<td><%=ingredient.getLossRate()%></td>
							<td><%=Math.round(sum*Ilist.get(i).getMixRate()*100)/100.0%>g</td>
							<td><strong><%=Math.round(((sum*Ilist.get(i).getMixRate()) / ingredient.getLossRate()*100)/100.0) %>g</strong></td>
							<td><%=Math.round((ingredient.getIngredientPrice() * ((sum*Ilist.get(i).getMixRate()/1000.0) / ingredient.getLossRate())*100)/100.0)%>원</td>
						</tr>
						<%
						}
					}
			%>

				<tr>
					<td></td>
					<td></td>
					<td><%=sum %></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
<%-- 		<div style="margin-left:100px; display:inline-block;">
			<strong style="font-size:40pt; font-weight:bold;">비용 총합</strong><br>
			<strong style="font-size:40pt; font-weight:bold;"><%=sumPrice%>원</strong>
		</div> --%>
 		<%
 	}
			else if(order.getOrderProductPorkAvailable()==1){ // 포크
		 		%>
		 		<p>포크 기반 처방레시피 </p>
		 		
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
					
					
					ArrayList<Recipe> Ilist = recipeDAO.getListByRecipe(order.getOrderProductPorkRecipePrimeNum());
					
					double sum = order.getOrderProductPorkNum() * order.getOrderProductPorkGram();

					for(int i=0; i<Ilist.size(); i++){
						int ingredientPrimeNum = Ilist.get(i).getIngredientPrimeNum();
						Ingredient ingredient = ingredientDAO.getIngredient(ingredientPrimeNum);
						if(ingredient!=null){
							
						%>
						<tr>
							<td><%=ingredient.getRawIngredient()%></td>
							<td><%=ingredient.getLossRate()%></td>
							<td><%=Math.round(sum*Ilist.get(i).getMixRate()*100)/100.0%>g</td>
							<td><strong><%=Math.round(((sum*Ilist.get(i).getMixRate()) / ingredient.getLossRate()*100)/100.0) %>g</strong></td>
							<td><%=Math.round((ingredient.getIngredientPrice() * ((sum*Ilist.get(i).getMixRate()/1000.0) / ingredient.getLossRate())*100)/100.0)%>원</td>
						</tr>
						<%
						}
					}
			%>

				<tr>
					<td></td>
					<td></td>
					<td><%=sum %></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
<%-- 		<div style="margin-left:100px; display:inline-block;">
			<strong style="font-size:40pt; font-weight:bold;">비용 총합</strong><br>
			<strong style="font-size:40pt; font-weight:bold;"><%=sumPrice%>원</strong>
		</div> --%>
 		<%
 	}
			else if(order.getOrderProductKangarooAvailable()==1){
		 		%>
		 		<p>캥거루 기반 처방레시피 </p>
		 		
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
					
					
					ArrayList<Recipe> Ilist = recipeDAO.getListByRecipe(order.getOrderProductKangarooRecipePrimeNum());
					
					double sum = order.getOrderProductKangarooNum() * order.getOrderProductKangarooGram();

					for(int i=0; i<Ilist.size(); i++){
						int ingredientPrimeNum = Ilist.get(i).getIngredientPrimeNum();
						Ingredient ingredient = ingredientDAO.getIngredient(ingredientPrimeNum);
						if(ingredient!=null){
							
						%>
						<tr>
							<td><%=ingredient.getRawIngredient()%></td>
							<td><%=ingredient.getLossRate()%></td>
							<td><%=Math.round(sum*Ilist.get(i).getMixRate()*100)/100.0%>g</td>
							<td><strong><%=Math.round(((sum*Ilist.get(i).getMixRate()) / ingredient.getLossRate()*100)/100.0) %>g</strong></td>
							<td><%=Math.round((ingredient.getIngredientPrice() * ((sum*Ilist.get(i).getMixRate()/1000.0) / ingredient.getLossRate())*100)/100.0)%>원</td>
						</tr>
						<%
						}
					}
			%>

				<tr>
					<td></td>
					<td></td>
					<td><%=sum %></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
<%-- 		<div style="margin-left:100px; display:inline-block;">
			<strong style="font-size:40pt; font-weight:bold;">비용 총합</strong><br>
			<strong style="font-size:40pt; font-weight:bold;"><%=sumPrice%>원</strong>
		</div> --%>
 		<%
 	}
			else if(order.getOrderProductHorseAvailable()==1){
		 		%>
		 		<p>홀스 기반 처방레시피 </p>
		 		
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
					
					
					ArrayList<Recipe> Ilist = recipeDAO.getListByRecipe(order.getOrderProductHorseRecipePrimeNum());
					
					double sum = order.getOrderProductHorseNum() * order.getOrderProductHorseGram();

					for(int i=0; i<Ilist.size(); i++){
						int ingredientPrimeNum = Ilist.get(i).getIngredientPrimeNum();
						Ingredient ingredient = ingredientDAO.getIngredient(ingredientPrimeNum);
						if(ingredient!=null){
							
						%>
						<tr>
							<td><%=ingredient.getRawIngredient()%></td>
							<td><%=ingredient.getLossRate()%></td>
							<td><%=Math.round(sum*Ilist.get(i).getMixRate()*100)/100.0%>g</td>
							<td><strong><%=Math.round(((sum*Ilist.get(i).getMixRate()) / ingredient.getLossRate()*100)/100.0) %>g</strong></td>
							<td><%=Math.round((ingredient.getIngredientPrice() * ((sum*Ilist.get(i).getMixRate()/1000.0) / ingredient.getLossRate())*100)/100.0)%>원</td>
						</tr>
						<%
						}
					}
			%>

				<tr>
					<td></td>
					<td></td>
					<td><%=sum %></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
		
		
<%-- 		<div style="margin-left:100px; display:inline-block;">
			<strong style="font-size:40pt; font-weight:bold;">비용 총합</strong><br>
			<strong style="font-size:40pt; font-weight:bold;"><%=sumPrice%>원</strong>
		</div> --%>
 		<%
 		}
	%>
</div>
	
	<script type="text/javascript">
	var num;
	 function roundNum(num){
		return num.toPrecision(3);
	}
	</script>
</body>

</html>