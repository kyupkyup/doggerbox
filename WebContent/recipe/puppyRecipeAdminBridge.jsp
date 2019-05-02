<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=" text/html; UTF-8" http-equiv="Content-type">
<title>도거박스 관리자페이지</title>
</head>
<body>
<button onclick="location.href='/doggerbox/main.jsp'">메인</button>
	<p>도거박스 관리자페이지</p>
	<%
	int puppyPrimeNum =0;
	if(request.getParameter("puppyPrimeNum")!=null){
		puppyPrimeNum = Integer.parseInt(request.getParameter("puppyPrimeNum"));
	}
	%>
	<p>적용 레시피</p>
	<button onclick="location.href='puppyRecipeAdminBridgeAction.jsp?productPrimeNum=1&puppyPrimeNum=<%=puppyPrimeNum%>'">퍼피</button>
	<Button onclick="location.href='puppyRecipeAdminBridgeAction.jsp?productPrimeNum=2&puppyPrimeNum=<%=puppyPrimeNum%>'">오리지널</Button>
	<button onclick="location.href='puppyRecipeAdminBridgeAction.jsp?productPrimeNum=3&puppyPrimeNum=<%=puppyPrimeNum%>'">시니어</button>
	<Button onclick="location.href='puppyRecipeAdminBridgeAction.jsp?productPrimeNum=4&puppyPrimeNum=<%=puppyPrimeNum%>'">피쉬</Button>	
	<button onclick="location.href='puppyRecipeAdminBridgeAction.jsp?productPrimeNum=5&puppyPrimeNum=<%=puppyPrimeNum%>'">포크</button>
	<Button onclick="location.href='puppyRecipeAdminBridgeAction.jsp?productPrimeNum=6&puppyPrimeNum=<%=puppyPrimeNum%>'">캥거루</Button>
	<Button onclick="location.href='puppyRecipeAdminBridgeAction.jsp?productPrimeNum=10&puppyPrimeNum=<%=puppyPrimeNum%>'">홀스</Button>
	<Button onclick="location.href='puppyRecipeAdminBridgeAction.jsp?productPrimeNum=7&puppyPrimeNum=<%=puppyPrimeNum%>'">한끼,치킨</Button>	
	<Button onclick="location.href='puppyRecipeAdminBridgeAction.jsp?productPrimeNum=8&puppyPrimeNum=<%=puppyPrimeNum%>'">한끼,피쉬</Button>	
	<Button onclick="location.href='puppyRecipeAdminBridgeAction.jsp?productPrimeNum=9&puppyPrimeNum=<%=puppyPrimeNum%>'">한끼,포크</Button>	
		

	
		<script src ="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	
</body>

</html>