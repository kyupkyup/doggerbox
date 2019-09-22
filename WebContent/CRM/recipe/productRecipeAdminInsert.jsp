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
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
var newWindow;
function openNewWindow(){
/*     var data = document.querySelector('#OrderInsertUserName').value;
 */    window.open("productRecipeCheck.jsp", "newWindow", "width=600, height=600, scrollbars=yes");
}

</script>

<%
	int productPrimeNum=0;
	if(request.getParameter("productPrimeNum")!=null){
		productPrimeNum = Integer.parseInt(request.getParameter("productPrimeNum"));
	}
	int recipePrimeNum = 0;
	if(request.getParameter("recipePrimeNum")!=null){
		recipePrimeNum = Integer.parseInt(request.getParameter("recipePrimeNum"));
	}
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
		<div>
			<input type="button" class="btn btn-default" id="btn_submit" value="재료 찾기" onclick="openNewWindow()">
		</div>
		
		<form action="productRecipeAdminInsertAction.jsp?productPrimeNum=<%=productPrimeNum%>&recipePrimeNum=<%=recipePrimeNum %>" method="post">
						<div>
				<p>재료 번호</p>
				<input type="text" class="form-control" placeholder="재료번호" name="ingredientPrimeNum" id="ingredientPrimeNum" maxlength="50" value=""></input>
			</div>
			
			<div>
				<p>원재료</p>
				<input type="text" class="form-control" placeholder="원재료" name="rawIngredient" id ="rawIngredient"maxlength="50" value=""></input>
				
			</div>


			<div>
				<p>배합비</p>
				<input type="text" class="form-control" placeholder="배합비(소수)" name="mixRate" maxlength="50"></input>
			</div>

			<input type ="submit" type="button"class="btn btn-primary" value ="등록">
		</form>
</div>	
	<script src ="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	
</body>

</html>