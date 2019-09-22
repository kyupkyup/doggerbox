<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=" text/html; UTF-8" http-equiv="Content-type">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
var newWindow;
function openNewWindow(){
/*     var data = document.querySelector('#OrderInsertUserName').value;
 */    window.open("productRecipeCheck.jsp", "newWindow", "width=600, height=600, scrollbar=yes");
}

</script>

<%
	int puppyPrimeNum=0;
	if(request.getParameter("puppyPrimeNum")!=null){
		puppyPrimeNum = Integer.parseInt(request.getParameter("puppyPrimeNum"));
	}
	int recipePrimeNum=0;
	if(request.getParameter("recipePrimeNum")!=null){
		recipePrimeNum = Integer.parseInt(request.getParameter("recipePrimeNum"));
	}
%>

	<p>도거박스 재료 추가</p>
		<div>
			<input type="button" id="btn_submit" value="재료 찾기" onclick="openNewWindow()">
		</div>
		
		<form action="puppyRecipeAdminInsertAction.jsp?puppyPrimeNum=<%=puppyPrimeNum%>&recipePrimeNum=<%=recipePrimeNum%>" method="post">
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

			<input type ="submit" type="button" value ="등록">
		</form>
	
	<script src ="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	
</body>

</html>