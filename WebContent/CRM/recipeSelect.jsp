<!DOCTYPE html>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="round.Round" %>
<%@ page import ="round.RoundDAO" %>
<%@ page import ="recipeList.RecipeList" %>
<%@ page import ="recipeList.RecipeListDAO" %>
<%@ page import ="java.util.ArrayList" %>


<html>
<head>

<meta charset=" text/html; UTF-8" http-equiv="Content-type">
<title>도거박스 관리자페이지</title>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.4.0.js"></script>

<%
/* 	int puppyPrimeNum =null;
	if(request.getParameter("puppyPrimeNum")!=null){
		puppyPrimeNum = request.getParameter("puppyPrimeNum");
	}
 */

	int puppyPrimeNum = 0;
	if(request.getParameter("puppyPrimeNum")!=null){
		puppyPrimeNum =Integer.parseInt(request.getParameter("puppyPrimeNum"));
	} 
	int productNum = 0;
	if(request.getParameter("productNum")!=null){
		productNum =Integer.parseInt(request.getParameter("productNum"));
	} 
%>
<button onclick="history.back()">이전 페이지</button>

	<button onclick="location.href='main.jsp'">메인</button>

		<p>레시피 선택</p>
		<table>

	<%
		RecipeListDAO recipeListDAO = new RecipeListDAO();
		ArrayList<RecipeList> list = recipeListDAO.getList(puppyPrimeNum, productNum);
		for(int i = 0; i< list.size(); i++){
	%>
			<tbody>
			<tr>
				<td><%=list.get(i).getRecipePrimeNum()%></td>
				<td><%=list.get(i).getProductName()%></td>
				<td><%=list.get(i).getRecipeDate()%></td>
				<td><input type="button" onClick="sender1('<%=list.get(i).getRecipePrimeNum()%>','<%=productNum%>')" value="선택"></td>
			</tbody>
		
	
	<%
	
		}
	%>
	<!--  자바스크립트 배우기-->

	</table>
<%-- 	<%
		if(request.getParameter("userPrimeNum")==null){
			%>
				<div>
					고객을 선택해주세요.
				</div>
					
			<%
		}
			
		else{
			
			%>
		<p>강아지 선택</p>
		<table>

		<%
		PuppyDAO puppyDAO = new PuppyDAO();
		ArrayList<Puppy> listPuppy = puppyDAO.getList(userPrimeNum);
		for(int i = 0; i< listPuppy.size(); i++){
	%>
		<tbody>
			<tr>
				<td><%=listPuppy.get(i).getPuppyPrimeNum()%></td>
				<td><%=listPuppy.get(i).getPuppyName()%></td>
				<td><%=listPuppy.get(i).getPuppySpecies()%></td>
				<td><%=listPuppy.get(i).getPuppyAge()%></td>

				<td><input type="button" onClick="sender1('<%=listPuppy.get(i).getPuppyName()%>','<%=userPrimeNum%>','<%=listPuppy.get(i).getPuppyPrimeNum()%>')" value="선택"></td>
			</tr>
		</tbody>
		
	
	
	<%
		}
	}
	%>
		</table> --%>

<script type="text/javascript">

function sender1(recipePrimeNum, productNum){
	if(productNum==1){
		window.opener.document.getElementById('puppyRecipePrimeNum').value=recipePrimeNum;

	}
	else if(productNum==2){
		window.opener.document.getElementById('originalRecipePrimeNum').value=recipePrimeNum;
	}
	else if(productNum==3){
		window.opener.document.getElementById('seniorRecipePrimeNum').value=recipePrimeNum;
	}
	else if(productNum==4){
		window.opener.document.getElementById('fishRecipePrimeNum').value=recipePrimeNum;
	}
	else if(productNum==5){
		window.opener.document.getElementById('porkRecipePrimeNum').value=recipePrimeNum;
	}
	else if(productNum==6){
		window.opener.document.getElementById('kangarooRecipePrimeNum').value=recipePrimeNum;
	}
	else if(productNum==7){
		window.opener.document.getElementById('horseRecipePrimeNum').value=recipePrimeNum;
	}

	window.close();
}
</script>


</body>



</html>