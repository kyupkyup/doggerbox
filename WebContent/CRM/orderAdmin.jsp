<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "order.Order" %>
<%@ page import= "order.OrderDAO" %>
<%@ page import= "recipe.Recipe" %>
<%@ page import= "recipe.RecipeDAO" %>
<%@page import = "doggerboxuser.DoggerboxUser" %>
<%@page import = "doggerboxuser.DoggerboxUserDAO" %>
<%@page import = "puppy.Puppy" %>
<%@page import = "puppy.PuppyDAO" %>
<%@page import = "java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>

<script src ="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" charset="utf-8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>

<link href="../css/order_admin_style.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">

<meta charset=" text/html; euc-kr" http-equiv="Content-type" content="application/vns.cs-excel;">


<title>Insert title here</title>
</head>

<body>


<%
	int roundPrimeNum =0;
	if(request.getParameter("roundPrimeNum")!=null){
		roundPrimeNum = Integer.parseInt(request.getParameter("roundPrimeNum"));
	}
%>

<button onclick="history.back()">이전 페이지</button>

<button onclick="location.href='main.jsp'">메인</button>
	<p>도거박스 주문 관리</p>
<%-- 	<button onclick="location.href='orderInsert.jsp?roundPrimeNum=<%=roundPrimeNum%>'">주문 입력</button>
 --%>		<form name="excel_form" id = "excel_form" action="../excelDownload/excel_download.jsp" method="post" target="_blank">
			<input type="hidden" name="excel_table" id="excel_table" />
			<input type="hidden" name="file_name" id="file_name" />
		</form>
	<input type="button" value="엑셀 다운" id="excelDown">
	
	<table id="order_list" border="1" rules="all" class="cell-border">
		
		<thead>
			<tr  class="table-head">
				<th>고객 번호</th>
				<th>고객 이름</th>
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
				<th>제조량 보기</th> 
				<th>가격</th>
				<th>한 끼 권장 급여량</th>
				<th>참고사항</th>
				<th>알러지 있는 재료</th>
				<th>팩</th>
<!-- 				<th>수정</th>
				<th>삭제</th>	 -->
				
			</tr>
			</thead>
			<tbody>
			<%
				int price=0;
				PuppyDAO puppyDAO = new PuppyDAO();
				DoggerboxUserDAO userDAO = new DoggerboxUserDAO();
				OrderDAO orderDAO = new OrderDAO();
				RecipeDAO recipeDAO = new RecipeDAO();
				ArrayList<Order> list = orderDAO.getList(roundPrimeNum);
				for(int i = 0; i< list.size(); i++){
					price=list.get(i).getOrderProductPuppyGram()*list.get(i).getOrderProductPuppyNum()*3200+
					list.get(i).getOrderProductOriginalGram()*list.get(i).getOrderProductOriginalNum()*3100+
					list.get(i).getOrderProductSeniorGram()*list.get(i).getOrderProductSeniorNum()*3200+
					list.get(i).getOrderProductFishGram()*list.get(i).getOrderProductFishNum()*3400+
					list.get(i).getOrderProductPorkGram()*list.get(i).getOrderProductPorkNum()*3400+
					list.get(i).getOrderProductKangarooGram()*list.get(i).getOrderProductKangarooNum()*3500+
					list.get(i).getOrderProductHorseGram()*list.get(i).getOrderProductHorseNum()*3500;
					
				
			%>
			
			
			<tr  class="table-body">
				<td class="userPrimeNum"><%=list.get(i).getUserPrimeNum()%></td>
				<td class="userName"><%=userDAO.getUserName(list.get(i).getUserPrimeNum())%></td>
				<td class="puppyName"><%=puppyDAO.getPuppyName(list.get(i).getPuppyPrimeNum())%></td>
				<%
					if(list.get(i).getOrderProductPuppyAvailable()==1){
						%>
				<td class="OrderProductPuppyGram" style="background-color:pink;"><%=list.get(i).getOrderProductPuppyGram()%></td>
				<td class="OrderProductPuppyNum" style="background-color:pink;"><%=list.get(i).getOrderProductPuppyNum()%></td>		
						<%
					}
					else if(list.get(i).getOrderProductPuppyAvailable()==0){
						%>
				<td class="OrderProductPuppyGram"><%=list.get(i).getOrderProductPuppyGram()%></td>
				<td class="OrderProductPuppyNum"><%=list.get(i).getOrderProductPuppyNum()%></td>						
						<%
					}
				%>
				
								<%
					if(list.get(i).getOrderProductOriginalAvailable()==1){
						%>
				<td class="OrderProductOriginalGram" style="background-color:pink;"><%=list.get(i).getOrderProductOriginalGram()%></td>
				<td class="OrderProductOriginalNum" style="background-color:pink;"><%=list.get(i).getOrderProductOriginalNum()%></td>				
						<%
					}
					else if(list.get(i).getOrderProductOriginalAvailable()==0){
						%>
				<td class="OrderProductOriginalGram"><%=list.get(i).getOrderProductOriginalGram()%></td>
				<td class="OrderProductOriginalNum"><%=list.get(i).getOrderProductOriginalNum()%></td>						
						<%
					}
				%>

						<%
					if(list.get(i).getOrderProductSeniorAvailable()==1){
						%>
				<td class="OrderProductSeniorGram" style="background-color:pink;"><%=list.get(i).getOrderProductSeniorGram()%></td>
				<td class="OrderProductSeniorNum" style="background-color:pink;"><%=list.get(i).getOrderProductSeniorNum()%></td>				
						<%
					}
					else if(list.get(i).getOrderProductSeniorAvailable()==0){
						%>
				<td class="OrderProductSeniorGram"><%=list.get(i).getOrderProductSeniorGram()%></td>
				<td class="OrderProductSeniorNum"><%=list.get(i).getOrderProductSeniorNum()%></td>						
						<%
					}
				%>
				
				<%
					if(list.get(i).getOrderProductFishAvailable()==1){
						%>
				<td class="OrderProductFishGram" style="background-color:pink;"><%=list.get(i).getOrderProductFishGram()%></td>
				<td class="OrderProductFishNum" style="background-color:pink;"><%=list.get(i).getOrderProductFishNum()%></td>				
						<%
					}
					else if(list.get(i).getOrderProductFishAvailable()==0){
						%>
				<td class="OrderProductFishGram"><%=list.get(i).getOrderProductFishGram()%></td>
				<td class="OrderProductFishNum"><%=list.get(i).getOrderProductFishNum()%></td>						
						<%
					}
				%>

				<%
					if(list.get(i).getOrderProductPorkAvailable()==1){
						%>
				<td class="OrderProductPorkGram" style="background-color:pink;"><%=list.get(i).getOrderProductPorkGram()%></td>
				<td class="OrderProductPorkNum" style="background-color:pink;"><%=list.get(i).getOrderProductPorkNum()%></td>				
						<%
					}
					else if(list.get(i).getOrderProductPorkAvailable()==0){
						%>
				<td class="OrderProductPorkGram"><%=list.get(i).getOrderProductPorkGram()%></td>
				<td class="OrderProductPorkNum"><%=list.get(i).getOrderProductPorkNum()%></td>						
						<%
					}
				%>

								<%
					if(list.get(i).getOrderProductKangarooAvailable()==1){
						%>
				<td class="OrderProductKangarooGram" style="background-color:pink;"><%=list.get(i).getOrderProductKangarooGram()%></td>
				<td class="OrderProductKangarooNum" style="background-color:pink;"><%=list.get(i).getOrderProductKangarooNum()%></td>				
						<%
					}
					else if(list.get(i).getOrderProductKangarooAvailable()==0){
						%>
				<td class="OrderProductKangarooGram"><%=list.get(i).getOrderProductKangarooGram()%></td>
				<td class="OrderProductKangarooNum"><%=list.get(i).getOrderProductKangarooNum()%></td>						
						<%
					}
				%>

				<%
					if(list.get(i).getOrderProductHorseAvailable()==1){
						%>
				<td class="OrderProductHorseGram" style="background-color:pink;"><%=list.get(i).getOrderProductHorseGram()%></td>
				<td class="OrderProductHorseNum" style="background-color:pink;"><%=list.get(i).getOrderProductHorseNum()%></td>				
						<%
					}
					else if(list.get(i).getOrderProductHorseAvailable()==0){
						%>
				<td class="OrderProductHorseGram"><%=list.get(i).getOrderProductHorseGram()%></td>
				<td class="OrderProductHorseNum"><%=list.get(i).getOrderProductHorseNum()%></td>						
						<%
					}
				%> 	
	 			<td class="OrderTotalQuantity"><a href="calculateIndividual.jsp?orderPrimeNum=<%=list.get(i).getOrderPrimeNum()%>">제조량</a></td>
	 			<td class="OrderTotalPrice"><%=price/100%>원</td>
				<td class="recommendQuantity"><%=puppyDAO.getRecommendQuantity(list.get(i).getPuppyPrimeNum())%>g</td>
				<td class="puppyRestrict"><%=puppyDAO.getPuppyRestrict(list.get(i).getPuppyPrimeNum())%></td>
				<td class="OrderETC"><%=list.get(i).getOrderETC()%></td>
				<td class="OrderPack"><%=list.get(i).getOrderPack()%></td>
<%-- 			<td><button onclick="location.href='orderUpdate.jsp?orderPrimeNum=<%=list.get(i).getOrderPrimeNum()%>'">수정</button></td>
				<td><button onclick="location.href='orderDeleteAction.jsp?orderPrimeNum=<%=list.get(i).getOrderPrimeNum()%>&roundPrimeNum=<%=roundPrimeNum%>'">삭제</button></td>
		 --%>						
				
				
				
			</tr>
			
			
			<%
			}
			%>
			</tbody>
		</table>
		<a href="calculateTotal.jsp?roundPrimeNum=<%=roundPrimeNum%>"><button>비처방 레시피 제조량</button></a>
			
<script type="text/javascript">
$('#excelDown').click(function(){
	$("#excel_table").val($("#order_list").html());
	$("#excel_form").submit();
});
</script>
<script type="text/javascript">
$(document).ready( function () {
    $('#order_list').dataTable({
    	"ordering": false
    });
} );

</script>
</body>

</html>