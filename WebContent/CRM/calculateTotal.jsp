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

 	int roundPrimeNum = 0;
 	if(request.getParameter("roundPrimeNum")!=null){
 		roundPrimeNum = Integer.parseInt(request.getParameter("roundPrimeNum"));
	} 
 	
 	int sumPuppy = 0;
 	int sumOriginal = 0;
 	int sumSenior = 0;
 	int sumFish = 0;
 	int sumPork = 0;
 	int sumKangaroo = 0;
 	int sumHorse = 0;

	OrderDAO orderDAO = new OrderDAO();
	RecipeDAO recipeDAO = new RecipeDAO();
	IngredientDAO ingredientDAO = new IngredientDAO();
	
	ArrayList<Order> list = orderDAO.getList(roundPrimeNum);
	
	for(int i = 0; i<list.size(); i++){
		Order order = orderDAO.getOrder(list.get(i).getOrderPrimeNum());
		
		if(order.getOrderProductPuppyAvailable()==0){
			sumPuppy += order.getOrderProductPuppyGram() * order.getOrderProductPuppyNum();

		}
		if(order.getOrderProductOriginalAvailable()==0){
			sumOriginal += order.getOrderProductOriginalGram() * order.getOrderProductOriginalNum();

		}
		if(order.getOrderProductSeniorAvailable()==0){
			sumSenior += order.getOrderProductSeniorGram() * order.getOrderProductSeniorNum();

		}
		if(order.getOrderProductFishAvailable()==0){
			sumFish += order.getOrderProductFishGram() * order.getOrderProductFishNum();

		}
		if(order.getOrderProductPorkAvailable()==0){
			sumPork += order.getOrderProductPorkGram() * order.getOrderProductPorkNum();

		}
		if(order.getOrderProductKangarooAvailable()==0){
			sumKangaroo += order.getOrderProductKangarooGram() * order.getOrderProductKangarooNum();

		}
		if(order.getOrderProductHorseAvailable()==0){
			sumHorse += order.getOrderProductHorseGram() * order.getOrderProductHorseNum();

		}

		
	}
	int sum = 0;

	for(int i =1; i<8; i++){
		String recipe = null;
		if(i==1){
			recipe="퍼피";
			sum = sumPuppy;
		}
		else if(i==2){
			recipe="오리지널";
			sum = sumOriginal;

		}
		else if(i==3){
			recipe="시니어";
			sum = sumSenior;

		}
		else if(i==4){
			recipe="피쉬";
			sum = sumFish;

		}
		else if(i==5){
			recipe="포크";
			sum = sumPork;

		}
		else if(i==6){
			recipe="캥거루";
			sum = sumKangaroo;

		}
		else if(i==7){
			recipe="홀스";
			sum = sumHorse;

		}
		%>
		

		 		<p><%=recipe%> 제조량<%=sum %> </p>
		 		
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
					
					
					ArrayList<Recipe> Ilist = recipeDAO.getListByProductNum(i);
				
					for(int j=0; j<Ilist.size(); j++){
						int ingredientPrimeNum = Ilist.get(j).getIngredientPrimeNum();
						Ingredient ingredient = ingredientDAO.getIngredient(ingredientPrimeNum);
						if(ingredient!=null){
							
						%>
						<tr>
							<td><%=ingredient.getRawIngredient()%></td>
							<td><%=ingredient.getLossRate()%></td>
							<td><%=Math.round(sum*Ilist.get(j).getMixRate()*100)/100.0%>g</td>
							<td><strong><%=Math.round(((sum*Ilist.get(j).getMixRate()) / ingredient.getLossRate()*100)/100.0) %>g</strong></td>
							<td><%=Math.round((ingredient.getIngredientPrice() * ((sum*Ilist.get(j).getMixRate()/1000.0) / ingredient.getLossRate())*100)/100.0)%>원</td>
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