<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="doggerboxuser.DoggerboxUser" %>
<%@ page import ="doggerboxuser.DoggerboxUserDAO" %>
<%@ page import ="puppy.Puppy" %>
<%@ page import ="puppy.PuppyDAO" %>
<%@ page import ="order.Order" %>
<%@ page import ="order.OrderDAO" %>

<html>
<head>
<meta charset=" text/html; UTF-8" http-equiv="Content-type">
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript">
var newWindow;
function openNewWindow(){
/*     var data = document.querySelector('#OrderInsertUserName').value;
 */    window.open("orderRoundCheck.jsp" , "newWindow", "width=300, height=400, scrollbar=no");
}

</script>
<%
int orderPrimeNum =0;
if(request.getParameter("orderPrimeNum")!=null){
	orderPrimeNum = Integer.parseInt(request.getParameter("orderPrimeNum"));
}
int userPrimeNum =0;
if(request.getParameter("userPrimeNum")!=null){
	userPrimeNum = Integer.parseInt(request.getParameter("userPrimeNum"));
}
	PuppyDAO puppyDAO = new PuppyDAO();
	OrderDAO orderDAO = new OrderDAO();
	DoggerboxUserDAO userDAO = new DoggerboxUserDAO();
		
%>
	<button onclick="location.href='main.jsp'">메인</button>

	<p>도거박스 주문 추가</p>
	
		<div>
			<input type="button" id="btn_submit" value="차수 찾기" onclick="openNewWindow()">
		</div>
	
		<form action="orderUpdateAction.jsp?orderPrimeNum=<%=orderPrimeNum%>" method="post">
			<div>
			<p>차수 고유번호</p>
				<input type="number"  class="form-control" name="roundPrimeNum" id="OrderRoundPrimeNum" ></input>
			</div>
			<div>
			<p>차수 제목</p>
				<input type="text" disabled class="form-control" name="roundTitle" id="OrderRoundTitle"></input>
			
			</div>
			<div>
			<p>차수 배송날짜</p>
				<input type="text" disabled class="form-control" name="roundDeliveryDate" id="OrderRoundDeliveryDate"></input>
			
			</div>
			<div>
				<input type="number" class="form-control" placeholder="퍼피(gram)" name="orderProductPuppyGram" maxlength="50" value="<%=orderDAO.getOrder(orderPrimeNum).getOrderProductPuppyGram()%>"></input>
			</div>
			<div>
				<input type="number" class="form-control" placeholder="퍼피(개수)" name="orderProductPuppyNum" maxlength="50" value="<%=orderDAO.getOrder(orderPrimeNum).getOrderProductPuppyNum()%>"></input>
			</div>
			<div>
				<input type="number" class="form-control" placeholder="오리지널(gram)" name="orderProductOriginalGram" maxlength="50" value="<%=orderDAO.getOrder(orderPrimeNum).getOrderProductOriginalGram()%>"></input>
			</div>
			<div>
				<input type="number" class="form-control" placeholder="오리지널(개수)" name="orderProductOriginalNum" maxlength="50" value="<%=orderDAO.getOrder(orderPrimeNum).getOrderProductOriginalNum()%>"></input>
			</div>
			<div>
				<input type="number" class="form-control" placeholder="시니어(gram)" name="orderProductSeniorGram" maxlength="50" value="<%=orderDAO.getOrder(orderPrimeNum).getOrderProductSeniorGram()%>"></input>
			</div>
			<div>
				<input type="number" class="form-control" placeholder="시니어(개수)" name="orderProductSeniorNum" maxlength="50" value="<%=orderDAO.getOrder(orderPrimeNum).getOrderProductSeniorNum()%>"></input>
			</div>
			<div>
				<input type="number" class="form-control" placeholder="피쉬(gram)" name="orderProductFishGram" maxlength="50" value="<%=orderDAO.getOrder(orderPrimeNum).getOrderProductFishGram()%>"></input>
			</div>
			<div>
				<input type="number" class="form-control" placeholder="피쉬(개수)" name="orderProductFishNum" maxlength="50" value="<%=orderDAO.getOrder(orderPrimeNum).getOrderProductFishNum()%>"></input>
			</div>
			<div>
				<input type="number" class="form-control" placeholder="포크(gram)" name="orderProductPorkGram" maxlength="50" value="<%=orderDAO.getOrder(orderPrimeNum).getOrderProductPorkGram()%>"></input>
			</div>
			<div>
				<input type="number" class="form-control" placeholder="포크(개수)" name="orderProductPorkNum" maxlength="50" value="<%=orderDAO.getOrder(orderPrimeNum).getOrderProductPorkNum()%>"></input>
			</div>
			<div>
				<input type="number" class="form-control" placeholder="캥거루(gram)" name="orderProductKangarooGram" maxlength="50" value="<%=orderDAO.getOrder(orderPrimeNum).getOrderProductKangarooGram()%>"></input>
			</div>
			<div>
				<input type="number" class="form-control" placeholder="캥거루(개수)" name="orderProductKangarooNum" maxlength="50" value="<%=orderDAO.getOrder(orderPrimeNum).getOrderProductKangarooNum()%>"></input>
			</div>
			<div>
				<input type="number" class="form-control" placeholder="홀스(gram)" name="orderProductHorseGram" maxlength="50" value="<%=orderDAO.getOrder(orderPrimeNum).getOrderProductHorseGram()%>"></input>
			</div>
			<div>
				<input type="number" class="form-control" placeholder="홀스(개수)" name="orderProductHorseNum" maxlength="50" value="<%=orderDAO.getOrder(orderPrimeNum).getOrderProductHorseNum()%>"></input>
			</div>		
			<div>
				<p>총 주문량 :</p>
				<p>XX g(자동 산출)</p>
			</div>
			
			<div>
				<p>가격 :</p>
				<p>XX 원(자동 산출)</p>
			
			</div>
			<div>
				<input type="text" class="form-control" placeholder="참고사항" name="orderETC" maxlength="50" value="<%=orderDAO.getOrder(orderPrimeNum).getOrderETC()%>"></input>
				
			</div>
			<div>
			
		<%
			if(orderDAO.getOrder(orderPrimeNum).getOrderPack()==1){
				
			
		%>
				<label for="">팩 :</label>
				<select  class="select-one radio-container" name="orderPack">
					<option value="1" selected>풀팩</option>
					<option value="2">하프팩</option>
				</select>
				
				<%
			}else if(orderDAO.getOrder(orderPrimeNum).getOrderPack()==2){
				%>
				<label for="">팩 :</label>
				<select  class="select-one radio-container" name="orderPack">
					<option value="1">풀팩</option>
					<option value="2"selected>하프팩</option>
				</select>
				<%
			}
				%>
				
			</div>
						<input type ="submit" type="button" value ="등록">
			
		</form>
	
	
		<script src ="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	
</body>

</html>