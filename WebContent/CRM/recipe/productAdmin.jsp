<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=" text/html; UTF-8" http-equiv="Content-type">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
<script src ="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<title>도거박스 관리자페이지</title>
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
	
	<button class="btn btn-default"onclick="location.href='productRecipeAdmin.jsp?productPrimeNum=1&recipePrimeNum=1'">퍼피</button>
	<Button class="btn btn-default"onclick="location.href='productRecipeAdmin.jsp?productPrimeNum=2&recipePrimeNum=2'">오리지널</Button>
	<button class="btn btn-default"onclick="location.href='productRecipeAdmin.jsp?productPrimeNum=3&recipePrimeNum=3'">시니어</button>
	<Button class="btn btn-default"onclick="location.href='productRecipeAdmin.jsp?productPrimeNum=4&recipePrimeNum=4'">피쉬</Button>	
	<button class="btn btn-default"onclick="location.href='productRecipeAdmin.jsp?productPrimeNum=5&recipePrimeNum=5'">포크</button>
	<Button class="btn btn-default"onclick="location.href='productRecipeAdmin.jsp?productPrimeNum=6&recipePrimeNum=6'">캥거루</Button>
	<Button class="btn btn-default"onclick="location.href='productRecipeAdmin.jsp?productPrimeNum=7&recipePrimeNum=7'">홀스</Button>
	<Button class="btn btn-default" onclick="location.href='productRecipeAdmin.jsp?productPrimeNum=8&recipePrimeNum=8'">한끼,치킨</Button>	
	<Button class="btn btn-default"onclick="location.href='productRecipeAdmin.jsp?productPrimeNum=9&recipePrimeNum=9'">한끼,피쉬</Button>	
	<Button class="btn btn-default"onclick="location.href='productRecipeAdmin.jsp?productPrimeNum=10&recipePrimeNum=10'">한끼,포크</Button>
	<br>
	<Button class="btn btn-default"onclick="location.href='productRecipeAdmin.jsp?productPrimeNum=10&recipePrimeNum=11'">저단백 기본</Button>	
	<Button class="btn btn-default"onclick="location.href='productRecipeAdmin.jsp?productPrimeNum=10&recipePrimeNum=12'">저단백 피쉬</Button>	
	<Button class="btn btn-default"onclick="location.href='productRecipeAdmin.jsp?productPrimeNum=10&recipePrimeNum=13'">저단백 포크</Button>	
	<Button class="btn btn-default"onclick="location.href='productRecipeAdmin.jsp?productPrimeNum=10&recipePrimeNum=14'">저단백 홀스</Button>	
	<Button class="btn btn-default"onclick="location.href='productRecipeAdmin.jsp?productPrimeNum=10&recipePrimeNum=15'">저단백 캥거루</Button>	
	
		
		</div>
	
		<script src ="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	
</body>

</html>