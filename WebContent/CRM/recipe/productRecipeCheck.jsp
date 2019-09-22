<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="ingredient.Ingredient" %>
<%@ page import ="ingredient.IngredientDAO" %>
<%@ page import ="java.util.ArrayList" %>


<html>
<head>

<meta charset=" text/html; UTF-8" http-equiv="Content-type">
<title>도거박스 관리자페이지</title>
</head>
<body style="overflow-y:auto;">
<script src="https://code.jquery.com/jquery-3.4.0.js"></script>

<%
%>

		<p>재료 선택</p>
		<table>

		<%
		IngredientDAO ingredientDAO = new IngredientDAO();
		ArrayList<Ingredient> list = ingredientDAO.getList();
		for(int i = 0; i< list.size(); i++){
	%>
		<tbody>
			<tr>
				<td><%=list.get(i).getIngredientPrimeNum()%></td>
				<td><%=list.get(i).getRawIngredient()%></td>
				<td><%=list.get(i).getLossRate()%></td>
				<td><%=list.get(i).getIngredientPrice()%></td>

				<td><input class="btn btn-default" type="button" onClick="sender1('<%=list.get(i).getIngredientPrimeNum()%>','<%=list.get(i).getRawIngredient()%>')" value="선택"></td>
			</tr>
		</tbody>
		
	
	
	<%
		}
	
	%>
		</table>

<script type="text/javascript">

function sender1(ingredientPrimeNum,rawIngredient){
	window.opener.document.getElementById('rawIngredient').value=rawIngredient;
	window.opener.document.getElementById('ingredientPrimeNum').value=ingredientPrimeNum;

	window.close();
}
</script>


</body>



</html>