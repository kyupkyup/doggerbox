<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="recipe.Recipe" %>
<%@ page import ="recipe.RecipeDAO" %>
<%@ page import ="ingredient.Ingredient" %>
<%@ page import ="ingredient.IngredientDAO" %>
<%@page import = "java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<meta charset=" text/html; UTF-8" http-equiv="Content-type">
<title>도거박스 관리자페이지</title>
</head>
<body>

	<p>도거박스 관리자페이지</p>
	<%
		int sumPuppy = 0;
		if(request.getParameter("sumPuppy")!=null){
			sumPuppy = Integer.parseInt(request.getParameter("sumPuppy"));
		}
		int sumOriginal = 0;
		if(request.getParameter("sumOriginal")!=null){
			sumOriginal = Integer.parseInt(request.getParameter("sumOriginal"));
		}
		int sumSenior = 0;
		if(request.getParameter("sumSenior")!=null){
			sumSenior = Integer.parseInt(request.getParameter("sumSenior"));
		}
		int sumFish = 0;
		if(request.getParameter("sumFish")!=null){
			sumFish = Integer.parseInt(request.getParameter("sumFish"));
		}
		int sumPork = 0;
		if(request.getParameter("sumPork")!=null){
			sumPork = Integer.parseInt(request.getParameter("sumPork"));
		}
		int sumKangaroo = 0;
		if(request.getParameter("sumKangaroo")!=null){
			sumKangaroo = Integer.parseInt(request.getParameter("sumKangaroo"));
		}
		
		RecipeDAO recipeDAO = new RecipeDAO();
		IngredientDAO ingredientDAO = new IngredientDAO();
		ArrayList<Ingredient> Ilist = ingredientDAO.getList();

		for(int i = 1; i<7; i++){
			ArrayList<Recipe> list = recipeDAO.getList(i);

			for(int j=0; j<list.size(); j++)
			// 레시피에서 재료 한줄 씩
			{
				for(int k=0; k<Ilist.size(); k++){
					//재료 테이블에서 한줄씩 비교
					if(list.get(j).getIngredientPrimeNum()==Ilist.get(k).getIngredientPrimeNum()){
						if(i==1){
							Ilist.get(k).setSum(Ilist.get(k).getSum()+list.get(j).getMixRate()*sumPuppy);
						}
						else if(i==2){
							Ilist.get(k).setSum(Ilist.get(k).getSum()+list.get(j).getMixRate()*sumOriginal);

						}else if(i==3){
							Ilist.get(k).setSum(Ilist.get(k).getSum()+list.get(j).getMixRate()*sumSenior);

						}else if(i==4){
							Ilist.get(k).setSum(Ilist.get(k).getSum()+list.get(j).getMixRate()*sumFish);

						}else if(i==5){
							Ilist.get(k).setSum(Ilist.get(k).getSum()+list.get(j).getMixRate()*sumPork);

						}else if(i==6){
							Ilist.get(k).setSum(Ilist.get(k).getSum()+list.get(j).getMixRate()*sumKangaroo);

						}
					}
					
				}
			}
		}
	%>
		<table style="display:inline" rules="all">
			<thead>
				<tr>
					<th>재료명</th>
					<th>손실율</th>
					<th>만들어지는 양</th>		
					<th>구입해야 하는 양</th>
					<th>가격</th>		
				</tr>
			</thead>
			
			
			<tbody>
			<%
			int sumPrice=0;
			for(int i=0; i<Ilist.size(); i++){
				sumPrice+=(Ilist.get(i).getIngredientPrice() * ((Ilist.get(i).getSum()/1000) / Ilist.get(i).getLossRate()));
				%>
				<tr>
					<td><%=Ilist.get(i).getRawIngredient()%></td>
					<td><%=Ilist.get(i).getLossRate()%></td>
					<td><%=Math.round(Ilist.get(i).getSum()*100)/100.0%>g</td>
					<td><strong><%=Math.round((Ilist.get(i).getSum() / Ilist.get(i).getLossRate())*100)/100.0 %>g</strong></td>
					<td><%=Math.round((Ilist.get(i).getIngredientPrice() * ((Ilist.get(i).getSum()/1000.0) / Ilist.get(i).getLossRate()))*100)/100.0%>원</td>
				</tr>
				<%
			}
			%>
<!-- 				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					
				</tr> -->
			</tbody>
			
		</table>
		
		<div style="margin-left:100px; display:inline-block;">
			<strong style="font-size:40pt; font-weight:bold;">비용 총합</strong><br>
			<strong style="font-size:40pt; font-weight:bold;"><%=sumPrice%>원</strong>
		</div>
	
		<script src ="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
	var num;
	 function roundNum(num){
		return num.toPrecision(3);
	}
	</script>
</body>

</html>