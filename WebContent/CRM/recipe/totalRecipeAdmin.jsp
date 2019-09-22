<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
<button class="btn btn-default"onclick="location.href='totalRecipeInsert.jsp'">재료 추가</button>


	<table id="order_list" border="1" rules="all" class="table table-bordered">
		
		<thead>
			<tr>
				<th>재료 번호</th>
				<th>원재료</th>
				<th>손실율</th>
				<th>원가</th>
				<th>수정</th>
				<th>삭제	</th>
				
				


				
			</tr>
			</thead>
			<tbody>
			<%
				IngredientDAO ingredientDAO = new IngredientDAO();
				ArrayList<Ingredient> list = ingredientDAO.getList();
				for(int i = 0; i< list.size(); i++){
			%>
			
			
			<tr>
				<td><%=list.get(i).getIngredientPrimeNum()%></td>
				<td><%=list.get(i).getRawIngredient()%></td>
				<td><%=list.get(i).getLossRate()%></td>
				<td><%=list.get(i).getIngredientPrice()%></td>
				<td><button class="btn btn-default"onclick="location.href='totalRecipeUpdate.jsp?ingredientPrimeNum=<%=list.get(i).getIngredientPrimeNum()%>'">수정</button></td>
				<td><button class="btn btn-default"onclick="location.href='totalRecipeDeleteAction.jsp?ingredientPrimeNum=<%=list.get(i).getIngredientPrimeNum()%>'">삭제</button></td>
				

			</tr>
			
			
			<%
			}
			%>
			</tbody>
		</table>
</div>		

		<script src ="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	

</body>

</html>