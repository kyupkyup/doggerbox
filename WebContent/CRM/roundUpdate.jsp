<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "round.Round" %>
    <%@ page import = "round.RoundDAO" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset=" text/html; UTF-8" http-equiv="Content-type">
<title>Insert title here</title>
</head>
<body>
<button onclick="history.back()">이전 페이지</button>

	<button onclick="location.href='main.jsp'">메인</button>

	<p>도거박스 주문 추가</p>
	<%
		RoundDAO roundDAO = new RoundDAO();
		int roundPrimeNum = 0;
		if(request.getParameter("roundPrimeNum")!=null){
			roundPrimeNum = Integer.parseInt(request.getParameter("roundPrimeNum"));
		}
		
	%>
	
		<form action="roundUpdateAction.jsp?roundPrimeNum=<%=roundPrimeNum%>" method="post">
		
			<div>
				<p>차수 제목</p>
				<input type="text" class="form-control" placeholder="차수 제목" name="roundTitle" maxlength="100" value="<%=roundDAO.getRound(roundPrimeNum).getRoundTitle()%>"></input>
			</div>
			<div>
				<p>배송 날짜</p>
				<input type="text" class="form-control" placeholder="배송 날짜" name="roundDeliveryDate" maxlength="20" value="<%=roundDAO.getRound(roundPrimeNum).getRoundDeliveryDate()%>"></input>
			</div>
			<input type ="submit" type="button" value ="등록">
			
		</form>
	
		<script src ="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</body>


</html>