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
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 
<title>도거박스 관리자페이지</title>
</head>
<body>

	<%
	int puppyPrimeNum =0;
	if(request.getParameter("puppyPrimeNum")!=null){
		puppyPrimeNum = Integer.parseInt(request.getParameter("puppyPrimeNum"));
	}
	String a = "퍼피";
	String b = "오리지널";
	String c = "시니어";
	String d = "피시";
	String e = "포크";
	String f = "캥거루";
	String g = "홀스";
	String h = "한끼자연식,치킨";
	String i = "한끼자연식,피쉬";
	String j = "한끼자연식,포크";
	
	%>
	<p>적용 레시피</p>
	<button class="btn btn-default" onclick="location.href='puppyRecipeAdminBridgeAction.jsp?puppyPrimeNum=<%=puppyPrimeNum%>&productPrimeNum=1&recipePrimeNum=1'">퍼피</button>
	<Button class="btn btn-default" onclick="location.href='puppyRecipeAdminBridgeAction.jsp?puppyPrimeNum=<%=puppyPrimeNum%>&productPrimeNum=2&recipePrimeNum=2'">오리지널</Button>
	<button class="btn btn-default" onclick="location.href='puppyRecipeAdminBridgeAction.jsp?puppyPrimeNum=<%=puppyPrimeNum%>&productPrimeNum=3&recipePrimeNum=3'">시니어</button>
	<Button class="btn btn-default" onclick="location.href='puppyRecipeAdminBridgeAction.jsp?puppyPrimeNum=<%=puppyPrimeNum%>&productPrimeNum=4&recipePrimeNum=4'">피쉬</Button>	
	<button class="btn btn-default" onclick="location.href='puppyRecipeAdminBridgeAction.jsp?puppyPrimeNum=<%=puppyPrimeNum%>&productPrimeNum=5&recipePrimeNum=5'">포크</button>
	<Button class="btn btn-default" onclick="location.href='puppyRecipeAdminBridgeAction.jsp?puppyPrimeNum=<%=puppyPrimeNum%>&productPrimeNum=6&recipePrimeNum=6'">캥거루</Button>
	<Button class="btn btn-default" onclick="location.href='puppyRecipeAdminBridgeAction.jsp?puppyPrimeNum=<%=puppyPrimeNum%>&productPrimeNum=7&recipePrimeNum=7'">홀스</Button>
	<Button class="btn btn-default" onclick="location.href='puppyRecipeAdminBridgeAction.jsp?puppyPrimeNum=<%=puppyPrimeNum%>&productPrimeNum=8&recipePrimeNum=8'">한끼,치킨</Button>	
	<Button class="btn btn-default" onclick="location.href='puppyRecipeAdminBridgeAction.jsp?puppyPrimeNum=<%=puppyPrimeNum%>&productPrimeNum=9&recipePrimeNum=9'">한끼,피쉬</Button>	
	<Button class="btn btn-default" onclick="location.href='puppyRecipeAdminBridgeAction.jsp?puppyPrimeNum=<%=puppyPrimeNum%>&productPrimeNum=10&recipePrimeNum=10'">한끼,포크</Button>	
		
	<Button class="btn btn-default" onclick="location.href='puppyRecipeAdminBridgeAction.jsp?puppyPrimeNum=<%=puppyPrimeNum%>&productPrimeNum=11&recipePrimeNum=11'">저단백 기본</Button>	
	<Button class="btn btn-default" onclick="location.href='puppyRecipeAdminBridgeAction.jsp?puppyPrimeNum=<%=puppyPrimeNum%>&productPrimeNum=12&recipePrimeNum=12'">저단백 피쉬</Button>	
	<Button class="btn btn-default" onclick="location.href='puppyRecipeAdminBridgeAction.jsp?puppyPrimeNum=<%=puppyPrimeNum%>&productPrimeNum=13&recipePrimeNum=13'">저단백 포크</Button>	
	<Button class="btn btn-default" onclick="location.href='puppyRecipeAdminBridgeAction.jsp?puppyPrimeNum=<%=puppyPrimeNum%>&productPrimeNum=14&recipePrimeNum=14'">저단백 홀스</Button>	
	<Button class="btn btn-default" onclick="location.href='puppyRecipeAdminBridgeAction.jsp?puppyPrimeNum=<%=puppyPrimeNum%>&productPrimeNum=15&recipePrimeNum=15'">저단백 캥거루</Button>	
	
		<script src ="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	
</body>

</html>