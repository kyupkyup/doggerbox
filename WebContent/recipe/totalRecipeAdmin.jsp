<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import = "ingredient.Ingredient" %>
<%@page import = "ingredient.IngredientDAO" %>
<%@page import = "java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<meta charset=" text/html; euc-kr" http-equiv="Content-type" content="application/vns.cs-excel;">

<title>Insert title here</title>
</head>

<body>



<button onclick="location.href='/doggerbox/main.jsp'">메인</button>
	<p>도거박스 주문 관리</p>
<button onclick="location.href='totalRecipeInsert.jsp'">재료 추가</button>

	<p></p>
	<table id="order_list" border="1" rules="all">
		
		<thead>
			<tr>
				<th>재료 번호</th>
				<th>원재료</th>
				<th>손실율</th>
				<th>원가</th>
				<th>수정</th>
				<th>삭제	</th>
				
				


				
			</tr>
			</thead>
			<tbody>
			<%
				IngredientDAO ingredientDAO = new IngredientDAO();
				ArrayList<Ingredient> list = ingredientDAO.getList();
				for(int i = 0; i< list.size(); i++){
			%>
			
			
			<tr>
				<td><%=list.get(i).getIngredientPrimeNum()%></td>
				<td><%=list.get(i).getRawIngredient()%></td>
				<td><%=list.get(i).getLossRate()%></td>
				<td><%=list.get(i).getIngredientPrice()%></td>
				<td><button onclick="location.href='totalRecipeUpdate.jsp?ingredientPrimeNum=<%=list.get(i).getIngredientPrimeNum()%>'">수정</button></td>
				<td><button onclick="location.href='totalRecipeDeleteAction.jsp?ingredientPrimeNum=<%=list.get(i).getIngredientPrimeNum()%>'">삭제</button></td>
				

			</tr>
			
			
			<%
			}
			%>
			</tbody>
		</table>
		

		<script src ="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	

</body>

</html>