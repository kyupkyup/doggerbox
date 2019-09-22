<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import = "ingredient.Ingredient" %>
    <%@page import = "ingredient.IngredientDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=" text/html; UTF-8" http-equiv="Content-type">
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
	
	int puppyPrimeNum = 0;
	if(request.getParameter("puppyPrimeNum")!=null){
		puppyPrimeNum = Integer.parseInt(request.getParameter("puppyPrimeNum"));
	}
	
	
	IngredientDAO ingredientDAO = new IngredientDAO();
%>
<button onclick="location.href='../main.jsp'">메인</button>
	<p><%=ingredientDAO.getRawIngredient(ingredientPrimeNum)%> 배합비 입력</p>
	
		<form action="puppyRecipeMixRateUpdateAction.jsp?puppyPrimeNum=<%=puppyPrimeNum%>&ingredientPrimeNum=<%=ingredientPrimeNum%>" method="post">

			<div>
				<p>배합비</p>
				<input type="text" class="form-control" placeholder="배합비" name="mixRate" maxlength="50"></input>
			</div>

			<input type ="submit" type="button" value ="등록">
		</form>
	
	<script src ="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	
</body>

</html> --%>