<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="ingredient.Ingredient" %>
    <%@page import="ingredient.IngredientDAO" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset=" text/html; UTF-8" http-equiv="Content-type">
<title>Insert title here</title>
</head>
<body>
<button onclick="location.href='/doggerbox/main.jsp'">메인</button>
	<p>도거박스 재료 추가</p>
	<%
		int ingredientPrimeNum =0;
		if(request.getParameter("ingredientPrimeNum")!=null){
			ingredientPrimeNum = Integer.parseInt(request.getParameter("ingredientPrimeNum"));
		}
		
		IngredientDAO ingredientDAO = new IngredientDAO();
	%>
	
		<form action="totalRecipeUpdateAction.jsp?ingredientPrimeNum=<%=ingredientPrimeNum%>" method="post">
			<div>
				<p>원재료</p>
				<input type="text" class="form-control" placeholder="원재료" name="rawIngredient" maxlength="50" value="<%=ingredientDAO.getRawIngredient(ingredientPrimeNum)%>"></input>
			</div>
			<div>
				<p>손실율(loss rate %제외한 100나눈 값으로 )</p>
				<input type="text" class="form-control" placeholder="손실율" name="lossRate" maxlength="50" value="<%=ingredientDAO.getIngredientLossRate(ingredientPrimeNum)%>"></input>
			</div>
			<div>
				<p>원가(kg당)</p>
				<input type="text" class="form-control" placeholder="원가" name="ingredientPrice" maxlength="50" value="<%=ingredientDAO.getIngredientPrice(ingredientPrimeNum)%>"></input>
			</div>

			<input type ="submit" type="button" value ="등록">
		</form>
	
	<script src ="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	
</body>

</html>