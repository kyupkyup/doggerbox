<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "order.Order" %>
<%@ page import= "order.OrderDAO" %>
<%@ page import= "java.io.PrintWriter" %>

<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id ="order" class="order.Order" scope="page"/>
<jsp:setProperty name ="order" property="userPrimeNum" />
<jsp:setProperty name ="order" property="puppyPrimeNum" />
<jsp:setProperty name ="order" property="orderBoxNum" />
<jsp:setProperty name ="order" property="orderProductPuppyGram" />
<jsp:setProperty name ="order" property="orderProductPuppyNum" />
<jsp:setProperty name ="order" property="orderProductOriginalGram" />
<jsp:setProperty name ="order" property="orderProductOriginalNum" />
<jsp:setProperty name ="order" property="orderProductSeniorGram" />
<jsp:setProperty name ="order" property="orderProductSeniorNum" />
<jsp:setProperty name ="order" property="orderProductFishGram" />
<jsp:setProperty name ="order" property="orderProductFishNum" />
<jsp:setProperty name ="order" property="orderProductPorkGram" />
<jsp:setProperty name ="order" property="orderProductPorkNum" />
<jsp:setProperty name ="order" property="orderProductKangarooGram" />
<jsp:setProperty name ="order" property="orderProductKangarooNum" />
<jsp:setProperty name ="order" property="orderProductHorseGram" />
<jsp:setProperty name ="order" property="orderProductHorseNum" />
<jsp:setProperty name ="order" property="orderProductIndividualGram" />
<jsp:setProperty name ="order" property="orderProductIndividualNum" />
<jsp:setProperty name ="order" property="orderTotalQuantity" />
<jsp:setProperty name ="order" property="orderTotalPrice" />
<jsp:setProperty name ="order" property="orderETC" />
<jsp:setProperty name ="order" property="orderPack" />




<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content = "text/html; charset=UTF-8">

<title>luppyworld_write_action_page</title>

</head>
<body>
	
	<!-- 글쓰기 부분 -->
	<%
 		
	 int orderPrimeNum = 0;
	if(!request.getParameter("orderPrimeNum").equals("")||request.getParameter("orderPrimeNum")!=null){
		orderPrimeNum = Integer.parseInt(request.getParameter("orderPrimeNum"));
	}   
/*
	int userPrimeNum = 0;
	if(!request.getParameter("userPrimeNum").equals("")||request.getParameter("userPrimeNum")!=null){
		userPrimeNum = Integer.parseInt(request.getParameter("userPrimeNum"));
	}
	int puppyPrimeNum = 0;
	if(!request.getParameter("puppyPrimeNum").equals("")||request.getParameter("puppyPrimeNum")!=null){
		puppyPrimeNum = Integer.parseInt(request.getParameter("puppyPrimeNum"));
	}
	
	int orderBoxNum = 0;
	if(!request.getParameter("orderBoxNum").equals("")||request.getParameter("orderBoxNum")!=null){
		orderBoxNum = Integer.parseInt(request.getParameter("orderBoxNum"));
	}
	int orderProductPuppyGram = 0;
	if(!request.getParameter("orderProductPuppyGram").equals("")||request.getParameter("orderProductPuppyGram")!=null){
		orderProductPuppyGram = Integer.parseInt(request.getParameter("orderProductPuppyGram"));
	}
	int orderProductPuppyNum = 0;
	if(!request.getParameter("orderProductPuppyNum").equals("")||request.getParameter("orderProductPuppyNum")!=null){
		orderProductPuppyNum = Integer.parseInt(request.getParameter("orderProductPuppyNum"));
	}
	int orderProductOriginalGram = 0;
	if(!request.getParameter("orderProductOriginalGram").equals("")||request.getParameter("orderProductOriginalGram")!=null){
		orderProductOriginalGram = Integer.parseInt(request.getParameter("orderProductOriginalGram"));
	}
	int orderProductOriginalNum = 0;
	if(!request.getParameter("orderProductOriginalNum").equals("")||request.getParameter("orderProductOriginalNum")!=null){
		orderProductOriginalNum = Integer.parseInt(request.getParameter("orderProductOriginalNum"));
	}
	int orderProductSeniorGram = 0;
	if(!request.getParameter("orderProductSeniorGram").equals("")||request.getParameter("orderProductSeniorGram")!=null){
		orderProductSeniorGram = Integer.parseInt(request.getParameter("orderProductSeniorGram"));
	}
	
	int orderProductSeniorNum = 0;
	if(!request.getParameter("orderProductSeniorNum").equals("")||request.getParameter("orderProductSeniorNum")!=null){
		orderProductSeniorNum	 = Integer.parseInt(request.getParameter("orderProductSeniorNum"));
	}
	int orderProductFishGram = 0;
	if(!request.getParameter("orderProductFishGram").equals("")||request.getParameter("orderProductFishGram")!=null){
		orderProductFishGram = Integer.parseInt(request.getParameter("orderProductFishGram"));
	}
	int orderProductFishNum = 0;
	if(!request.getParameter("orderProductFishNum").equals("")||request.getParameter("orderProductFishNum")!=null){
		puppyPrimeNum = Integer.parseInt(request.getParameter("orderProductFishNum"));
	}	
	int orderProductPorkGram = 0;
	if(!request.getParameter("orderProductPorkGram").equals("")||request.getParameter("orderProductPorkGram")!=null){
		orderProductPorkGram = Integer.parseInt(request.getParameter("orderProductPorkGram"));
	}	
	int orderProductPorkNum = 0;
	if(!request.getParameter("orderProductPorkNum").equals("")||request.getParameter("orderProductPorkNum")!=null){
		orderProductPorkNum = Integer.parseInt(request.getParameter("orderProductPorkNum"));
	}
	int orderProductKangarooGram = 0;
	if(!request.getParameter("orderProductKangarooGram").equals("")||request.getParameter("orderProductKangarooGram")!=null){
		orderProductKangarooGram = Integer.parseInt(request.getParameter("orderProductKangarooGram"));
	}
	int orderProductKangarooNum = 0;
	if(!request.getParameter("orderProductKangarooNum").equals("")||request.getParameter("orderProductKangarooNum")!=null){
		orderProductKangarooNum = Integer.parseInt(request.getParameter("orderProductKangarooNum"));
	}
	int orderTotalQuantity = 0;
	if(!request.getParameter("orderTotalQuantity").equals("")||request.getParameter("orderTotalQuantity")!=null){
		orderTotalQuantity = Integer.parseInt(request.getParameter("orderTotalQuantity"));
	}
	int orderTotalPrice = 0;
	if(!request.getParameter("orderTotalPrice").equals("")||request.getParameter("orderTotalPrice")!=null){
		orderTotalPrice = Integer.parseInt(request.getParameter("orderTotalPrice"));
	}
	String orderETC = null;
	if(!request.getParameter("orderETC").equals("")||request.getParameter("orderETC")!=null){
		orderETC = request.getParameter("orderETC");
	}
	int orderPack = 0;
	if(!request.getParameter("orderPack").equals("")||request.getParameter("orderPack")!=null){
		orderPack = Integer.parseInt(request.getParameter("orderPack"));
	}
	 */

	
			
/* 			if(request.getParameter("userName")==null ||request.getParameter("userPrimeNum")==null ||
					request.getParameter("puppyPrimeNum")==null ||request.getParameter("userName")==null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('고객 정보는 반드시 입력해야 합니다.')");
				script.println("history.back()");
				script.println("</script>");
				
				
			} */
			
			
				OrderDAO orderDAO = new OrderDAO();
				int result = orderDAO.orderUpdate(order.getUserPrimeNum(),  order.getOrderBoxNum(),  order.getOrderProductPuppyGram(), 
						order.getOrderProductPuppyNum(),  order.getOrderProductOriginalGram(),
						order.getOrderProductOriginalNum(),  order.getOrderProductSeniorGram(),
						order.getOrderProductSeniorNum(),
						order.getOrderProductFishGram(),  order.getOrderProductFishNum(),  order.getOrderProductPorkGram(), 
						order.getOrderProductPorkNum(),  order.getOrderProductKangarooGram(), order.getOrderProductKangarooNum(), 
						 order.getOrderProductHorseGram(), order.getOrderProductHorseNum(), 
						 order.getOrderProductIndividualGram(), order.getOrderProductIndividualNum(), 
						 order.getOrderTotalQuantity(),  order.getOrderTotalPrice(), order.getOrderETC(), order.getOrderPack(),orderPrimeNum);
				
				if(result == -1 ){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('주문 수정에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");

				}
				
				else{
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('주문 수정 성공')");
					script.println("location.href = 'customerAdminPuppyOrder.jsp?puppyPrimeNum="+order.getPuppyPrimeNum()+"&userPrimeNum="+order.getUserPrimeNum()+"'");
					script.println("</script>");
				}

	
				
			
			
		
		
	%>

		<script src ="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	
</body>
</html>