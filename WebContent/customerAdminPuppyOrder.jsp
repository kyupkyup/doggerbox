<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "order.Order" %>
<%@ page import= "order.OrderDAO" %>
<%@page import = "doggerboxuser.DoggerboxUser" %>
<%@page import = "doggerboxuser.DoggerboxUserDAO" %>
<%@page import = "puppy.Puppy" %>
<%@page import = "puppy.PuppyDAO" %>
<%@ page import= "recipe.Recipe" %>
<%@ page import= "recipe.RecipeDAO" %>
<%@page import = "round.Round" %>
<%@page import = "round.RoundDAO" %>
<%@page import = "java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<link href="css/order_admin_style.css" rel="stylesheet">

<meta charset=" text/html; euc-kr" http-equiv="Content-type" content="application/vns.cs-excel;">


<title>Insert title here</title>
</head>

<body>


<%
	int puppyPrimeNum =0;
	if(request.getParameter("puppyPrimeNum")!=null){
		puppyPrimeNum = Integer.parseInt(request.getParameter("puppyPrimeNum"));
	}
	int userPrimeNum =0;
	if(request.getParameter("userPrimeNum")!=null){
		userPrimeNum = Integer.parseInt(request.getParameter("userPrimeNum"));
	}
%>


<button onclick="location.href='main.jsp'">메인</button>
	<p>도거박스 주문 관리</p>
	<button onclick="location.href='orderInsert.jsp?puppyPrimeNum=<%=puppyPrimeNum%>&userPrimeNum=<%=userPrimeNum%>'">주문 입력</button>

	
	<table id="order_list" border="1" rules="all">
		
		<thead>
			<tr>
				<th>차수 제목</th>
				<th>배송 날짜</th>
				<th>강아지 이름</th>
				<th>퍼피(g)</th>
				<th>퍼피(개수)</th>
				<th>오리지널(g)</th>
				<th>오리지널(개수)</th>
				<th>시니어(g)</th>
				<th>시니어(개수)</th>
				<th>피쉬(g)</th>
				<th>피쉬(개수)</th>
				<th>포크(g)</th>
				<th>포크(개수)</th>
				<th>캥거루(g)</th>
				<th>캥거루(개수)</th>
				<th>홀스(g)</th>
				<th>홀스(개수)</th>
				<th>특별레시피(g)</th>
				<th>특별레시피(개수)</th>
<!-- 				<th>주문량</th>
 -->				<th>가격</th>
				<th>한 끼 권장 급여량</th>
				<th>알러지 있는 재료</th>
				<th>참고사항</th>

				<th>팩</th>
<!-- 				<th>수정</th>
				<th>삭제</th>	 -->
				
			</tr>
			</thead>
			<tbody>
			<%
				int price=0;	
				PuppyDAO puppyDAO = new PuppyDAO();
				RecipeDAO recipeDAO = new RecipeDAO();

				DoggerboxUserDAO userDAO = new DoggerboxUserDAO();
				OrderDAO orderDAO = new OrderDAO();
				RoundDAO roundDAO = new RoundDAO();

				ArrayList<Order> list = orderDAO.getListByPuppy(puppyPrimeNum);
				for(int i = 0; i< list.size(); i++){
					price=list.get(i).getOrderProductPuppyGram()*list.get(i).getOrderProductPuppyNum()*3200+
					list.get(i).getOrderProductOriginalGram()*list.get(i).getOrderProductOriginalNum()*3100+
					list.get(i).getOrderProductSeniorGram()*list.get(i).getOrderProductSeniorNum()*3200+
					list.get(i).getOrderProductFishGram()*list.get(i).getOrderProductFishNum()*3400+
					list.get(i).getOrderProductPorkGram()*list.get(i).getOrderProductPorkNum()*3400+
					list.get(i).getOrderProductKangarooGram()*list.get(i).getOrderProductKangarooNum()*3500+
					list.get(i).getOrderProductHorseGram()*list.get(i).getOrderProductHorseNum()*3500;
					
					if(recipeDAO.getProductPrimeNum(list.get(i).getPuppyPrimeNum())==101){
					price += list.get(i).getOrderProductIndividualGram()*list.get(i).getOrderProductIndividualNum()*3200;
					}
					else if(recipeDAO.getProductPrimeNum(list.get(i).getPuppyPrimeNum())==102){

						price += list.get(i).getOrderProductIndividualGram()*list.get(i).getOrderProductIndividualNum()*3100;
					}
					else if(recipeDAO.getProductPrimeNum(list.get(i).getPuppyPrimeNum())==103){

						price += list.get(i).getOrderProductIndividualGram()*list.get(i).getOrderProductIndividualNum()*3200;
					}
					else if(recipeDAO.getProductPrimeNum(list.get(i).getPuppyPrimeNum())==104){

						price += list.get(i).getOrderProductIndividualGram()*list.get(i).getOrderProductIndividualNum()*3400;
					}
					else if(recipeDAO.getProductPrimeNum(list.get(i).getPuppyPrimeNum())==105){

						price += list.get(i).getOrderProductIndividualGram()*list.get(i).getOrderProductIndividualNum()*3400;
					}
					else if(recipeDAO.getProductPrimeNum(list.get(i).getPuppyPrimeNum())==106){

						price += list.get(i).getOrderProductIndividualGram()*list.get(i).getOrderProductIndividualNum()*3400;
					}
					else if(recipeDAO.getProductPrimeNum(list.get(i).getPuppyPrimeNum())==107){

						price += list.get(i).getOrderProductIndividualGram()*list.get(i).getOrderProductIndividualNum()*3500;
					}
					if(userDAO.getUserRoutine(list.get(i).getUserPrimeNum())==1){
						price *= 0.3;
					}
				
			%>
			
			
			<tr>
				<td class="roundTitle"><%=roundDAO.getRoundTitle(list.get(i).getRoundPrimeNum())%></td>
				<td class="roundDeliveryDate"><%=roundDAO.getRoundDeliveryDate(list.get(i).getRoundPrimeNum())%></td>
				<td class="puppyName"><%=puppyDAO.getPuppyName(list.get(i).getPuppyPrimeNum())%></td>
				<td class="OrderProductPuppyGram"><%=list.get(i).getOrderProductPuppyGram()%></td>
				<td class="OrderProductPuppyNum"><%=list.get(i).getOrderProductPuppyNum()%></td>
				<td class="OrderProductOriginalGram"><%=list.get(i).getOrderProductOriginalGram()%></td>
				<td class="OrderProductOriginalNum"><%=list.get(i).getOrderProductOriginalNum()%></td>
				<td class="OrderProductSeniorGram"><%=list.get(i).getOrderProductSeniorGram()%></td>
				<td class="OrderProductSeniorNum"><%=list.get(i).getOrderProductSeniorNum()%></td>
				<td class="OrderProductFishGram"><%=list.get(i).getOrderProductFishGram()%></td>
				<td class="OrderProductFishNum"><%=list.get(i).getOrderProductFishNum()%></td>
				<td class="OrderProductPorkGram"><%=list.get(i).getOrderProductPorkGram()%></td>
				<td class="OrderProductPorkNum"><%=list.get(i).getOrderProductPorkNum()%></td>
				<td class="OrderProductKangarooGram"><%=list.get(i).getOrderProductKangarooGram()%></td>
				<td class="OrderProductKangarooNum"><%=list.get(i).getOrderProductKangarooNum()%></td>
				<td class="OrderProductHorseGram"><%=list.get(i).getOrderProductHorseGram()%></td>
				<td class="OrderProductHorseNum"><%=list.get(i).getOrderProductHorseNum()%></td>
				<td class="OrderProductIndividualGram"><%=list.get(i).getOrderProductIndividualGram()%></td>
				<td class="OrderProductIndividualNum"><%=list.get(i).getOrderProductIndividualNum()%></td>
<%-- 				<td class="OrderTotalQuantity"><%=list.get(i).getOrderTotalQuantity()%></td>
 --%>			<td class="OrderTotalPrice"><%=price/100%>원</td>				
 				<td class="recommendQuantity"><%=puppyDAO.getRecommendQuantity(list.get(i).getPuppyPrimeNum())%>g</td>
				<td class="puppyRestrict"><%=puppyDAO.getPuppyRestrict(list.get(i).getPuppyPrimeNum())%></td>
				<td class="OrderETC"><%=list.get(i).getOrderETC()%></td>
				<td class="OrderPack"><%=list.get(i).getOrderPack()%></td>
				<td><button onclick="location.href='recipe/orderRecipeIndividual.jsp?orderPrimeNum=<%=list.get(i).getOrderPrimeNum()%>&puppyPrimeNum=<%=list.get(i).getPuppyPrimeNum()%>'">제조량 산출</button></td>
	 			<td><button onclick="location.href='orderUpdate.jsp?orderPrimeNum=<%=list.get(i).getOrderPrimeNum()%>&puppyPrimeNm=<%=list.get(i).getPuppyPrimeNum()%>'">수정</button></td>
				<td><button onclick="location.href='orderDeleteAction.jsp?orderPrimeNum=<%=list.get(i).getOrderPrimeNum()%>'">삭제</button></td>
								
				
				
				
			</tr>
			
			
			<%
			}
			%>
			</tbody>
		</table>
		

		<script src ="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	
<script type="text/javascript">
$('#excelDown').click(function(){
	$("#excel_table").val($("#order_list").html());
	$("#excel_form").submit();
});



</script>
</body>

</html>