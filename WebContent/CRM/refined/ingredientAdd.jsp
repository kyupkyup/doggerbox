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
<script type="text/javascript">
function addAction(recipePrimeNum, ingredientPrimeNum, rawIngredient, puppyPrimeNum){
	var url ="ingredientAddAction.jsp?recipePrimeNum="+recipePrimeNum+"&ingredientPrimeNum="+ingredientPrimeNum+"&rawIngredient="+rawIngredient+"&puppyPrimeNum="+puppyPrimeNum;
	location.href = encodeURI(url);
}

</script>
<%
	int recipePrimeNum = 0;
	if(request.getParameter("recipePrimeNum") != null){
		recipePrimeNum = Integer.parseInt(request.getParameter("recipePrimeNum"));

	}
	int puppyPrimeNum = 0;
	if(request.getParameter("puppyPrimeNum") != null){
		puppyPrimeNum = Integer.parseInt(request.getParameter("puppyPrimeNum"));

	}

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

<%-- 				<td><a type="button" href=encodeURI('ingredientAddAction.jsp?recipePrimeNum=<%=recipePrimeNum %>&ingredientPrimeNum=<%=list.get(i).getIngredientPrimeNum()%>
				&rawIngredient=<%=list.get(i).getRawIngredient()%>&puppyPrimeNum=<%=puppyPrimeNum%>')
				>선택</a></td> --%>
				
				<td><button onclick="addAction(<%=recipePrimeNum%>,<%=list.get(i).getIngredientPrimeNum()%>,'+<%=list.get(i).getRawIngredient()%>+',<%=puppyPrimeNum%>);">선택</button></td>
			</tr>
		</tbody>
		
	
	<%
		}
	
	%>
		</table>



</body>



</html>