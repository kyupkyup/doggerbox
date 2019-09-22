<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "round.Round" %>
<%@ page import = "round.RoundDAO" %>
<%@ page import = "order.Order" %>
<%@ page import = "order.OrderDAO" %>
<%@page import = "java.util.ArrayList" %>


<html>
<head>
<meta charset=" text/html; UTF-8" http-equiv="Content-type">

<script src ="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" charset="utf-8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>


<link href="../css/round_admin_style.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">

<title>Insert title here</title>
</head>
<body>

<%



%>
<button onclick="history.back()">이전 페이지</button>

<button onclick="location.href='main.jsp'">메인</button>
	<p>도거박스 제조 관리</p>
			
	<button onclick="location.href='roundInsert.jsp'">차수 추가</button>
		<table border="1" rules="all" id="production-admin" class="cell-border">
		<thead>
			<tr class="table-head">
				<th>차수</th>
				<th>배송날짜</th>
				<th>퍼피 총 무게</th>
				<th>오리지널 총 무게</th>
				<th>시니어 총 무게</th>
				<th>피쉬 총 무게</th>
				<th>포크 총 무게</th>
				<th>캥거루 총 무게</th>
				<th>홀스 총 무게</th>
				<th>세부 주문 내역</th>
				<th>개별 재료</th>	
				<th>수정</th>
				<th>삭제</th>				
			</tr>
		</thead>
		
		<tbody>
		<%
			OrderDAO orderDAO = new OrderDAO();

			RoundDAO roundDAO = new RoundDAO();
			ArrayList<Round> list = roundDAO.getList();
			for(int i = 0; i< list.size(); i++){
				ArrayList<Order> listOrder = orderDAO.getList(list.get(i).getRoundPrimeNum());
				int sumPuppy =0;
				int sumOriginal =0;
				int sumSenior =0;
				int sumFish =0;
				int sumPork =0;
				int sumKangaroo =0;
				int sumHorse =0;

				for(int j=0; j<listOrder.size(); j++){
					
					
					sumPuppy += (listOrder.get(j).getOrderProductPuppyGram() * listOrder.get(j).getOrderProductPuppyNum());
					sumOriginal += (listOrder.get(j).getOrderProductOriginalGram() * listOrder.get(j).getOrderProductOriginalNum());
					sumSenior += (listOrder.get(j).getOrderProductSeniorGram() * listOrder.get(j).getOrderProductSeniorNum());
					sumFish += (listOrder.get(j).getOrderProductFishGram() * listOrder.get(j).getOrderProductFishNum());
					sumPork += (listOrder.get(j).getOrderProductPorkGram() * listOrder.get(j).getOrderProductPorkNum());
					sumKangaroo += (listOrder.get(j).getOrderProductKangarooGram() * listOrder.get(j).getOrderProductKangarooNum());
					sumHorse += (listOrder.get(j).getOrderProductHorseGram() * listOrder.get(j).getOrderProductHorseNum());

				}
				
		%>
			<tr class="table-body">
				<td class="roundTitle"><%=list.get(i).getRoundTitle() %></td>
				<td class="getRoundDeliveryDate"><%=list.get(i).getRoundDeliveryDate() %></td>
				<td class="sumPuppy"><%=sumPuppy %>g</td>
				<td class="sumOriginal"><%=sumOriginal %>g</td>
				<td class="sumSenior"><%=sumSenior %>g</td>
				<td class="sumFish"><%=sumFish %>g</td>
				<td class="sumPork"><%=sumPork %>g</td>
				<td class="sumKangaroo"><%=sumKangaroo %>g</td>
				<td class="sumKanHorse"><%=sumHorse %>g</td>
				
				
				<td><a href="orderAdmin.jsp?roundPrimeNum=<%=list.get(i).getRoundPrimeNum()%>" type="button">개별 주문 관리</a></td>
				<td><button onclick="location.href='calculateIngredients.jsp?sumPuppy=<%=sumPuppy%>&sumOriginal=<%=sumOriginal%>&sumSenior=<%=sumSenior%>&sumFish=<%=sumFish%>&sumPork=<%=sumPork%>&sumKangaroo=<%=sumKangaroo%>&sumHorse=<%=sumHorse%>&roundPrimeNum=<%=list.get(i).getRoundPrimeNum()%>'">개별 재료량 산출</button></td>
				<td><button onclick="location.href='roundUpdate.jsp?roundPrimeNum=<%=list.get(i).getRoundPrimeNum()%>'">수정</button></td>
				<td><button onclick="location.href='roundDeleteAction.jsp?roundPrimeNum=<%=list.get(i).getRoundPrimeNum()%>'">삭제</button></td>
				
				
				
			</tr>
			<%
			}
			%>
			</tbody>
		</table>


	
</body>
<script type="text/javascript">
$(document).ready( function () {
    $('#production-admin').dataTable({
    	"ordering": false
    });
} );
</script>
</html>