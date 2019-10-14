<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import = "ingredient.Ingredient" %>
    <%@page import = "ingredient.IngredientDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=" text/html; UTF-8" http-equiv="Content-type">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
<script src ="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<script type="text/javascript">

</script>
<body>

<%
	int ingredientPrimeNum=0;
	if(request.getParameter("ingredientPrimeNum")!=null){
		ingredientPrimeNum = Integer.parseInt(request.getParameter("ingredientPrimeNum"));
	}
	
	int productPrimeNum = 0;
	if(request.getParameter("productPrimeNum")!=null){
		productPrimeNum = Integer.parseInt(request.getParameter("productPrimeNum"));
	}
	
	
	IngredientDAO ingredientDAO = new IngredientDAO();
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
	<p><%=ingredientDAO.getRawIngredient(ingredientPrimeNum)%> 배합비 입력</p>
	
		<form action="productRecipeMixRateUpdateAction.jsp?productPrimeNum=<%=productPrimeNum%>&ingredientPrimeNum=<%=ingredientPrimeNum%>" method="post">

			<div>
				<p>배합비</p>
				<input type="text" class="form-control" placeholder="배합비(소수 형식 ex. 0.2)" name="mixRate" maxlength="50"></input>
			</div>

			<input class="btn btn-default"type ="submit" type="button" value ="등록">
		</form>
</div>
	<script src ="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	
</body>

</html>