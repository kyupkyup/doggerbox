 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "recipeList.RecipeList" %>
<%@ page import= "recipeList.RecipeListDAO" %>
    
<%@ page import= "order.Order" %>
<%@ page import= "order.OrderDAO" %>
<%@ page import= "java.io.PrintWriter" %>

<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id ="order" class="order.Order" scope="page"/>
<jsp:setProperty name ="order" property="roundPrimeNum" />
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

<jsp:setProperty name ="order" property="orderProductPuppyAvailable" />
<jsp:setProperty name ="order" property="orderProductOriginalAvailable" />
<jsp:setProperty name ="order" property="orderProductSeniorAvailable" />
<jsp:setProperty name ="order" property="orderProductFishAvailable" />
<jsp:setProperty name ="order" property="orderProductPorkAvailable" />
<jsp:setProperty name ="order" property="orderProductKangarooAvailable" />
<jsp:setProperty name ="order" property="orderProductHorseAvailable" />
<jsp:setProperty name ="order" property="orderProductPuppyRecipePrimeNum" />
<jsp:setProperty name ="order" property="orderProductOriginalRecipePrimeNum" />
<jsp:setProperty name ="order" property="orderProductSeniorRecipePrimeNum" />
<jsp:setProperty name ="order" property="orderProductFishRecipePrimeNum" />
<jsp:setProperty name ="order" property="orderProductPorkRecipePrimeNum" />
<jsp:setProperty name ="order" property="orderProductKangarooRecipePrimeNum" />
<jsp:setProperty name ="order" property="orderProductHorseRecipePrimeNum" />
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
	
	int orderProductPuppyRecipePrimeNum =0;
	int orderProductOriginalRecipePrimeNum =0;
	int orderProductSeniorRecipePrimeNum =0;
	int orderProductFishRecipePrimeNum =0;
	int orderProductPorkRecipePrimeNum =0;
	int orderProductKangarooRecipePrimeNum =0;
	int orderProductHorseRecipePrimeNum =0;
	
	RecipeListDAO recipeListDAO = new RecipeListDAO();
	
/* 		if(order.getOrderProductPuppyAvailable()==1){
			orderProductPuppyRecipePrimeNum = recipeListDAO.getRecipePrimeNum(1, order.getPuppyPrimeNum());
			if(orderProductPuppyRecipePrimeNum==-1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('처방레시피가 등록되어있지 않습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
		}
		else{
			orderProductPuppyRecipePrimeNum = 1;
		}
			
		if(order.getOrderProductOriginalAvailable()==1){
			orderProductOriginalRecipePrimeNum = recipeListDAO.getRecipePrimeNum(2, order.getPuppyPrimeNum());
			if(orderProductOriginalRecipePrimeNum==-1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('처방레시피가 등록되어있지 않습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
		}
		else{
			orderProductOriginalRecipePrimeNum = 2;
		}
		if(order.getOrderProductSeniorAvailable()==1){
			orderProductSeniorRecipePrimeNum = recipeListDAO.getRecipePrimeNum(3, order.getPuppyPrimeNum());
			if(orderProductSeniorRecipePrimeNum==-1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('처방레시피가 등록되어있지 않습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
		}
		else{
			orderProductSeniorRecipePrimeNum = 3;
		}
		if(order.getOrderProductFishAvailable()==1){
			orderProductFishRecipePrimeNum = recipeListDAO.getRecipePrimeNum(4, order.getPuppyPrimeNum());
			if(orderProductFishRecipePrimeNum==-1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('처방레시피가 등록되어있지 않습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
		}
		else{
			orderProductFishRecipePrimeNum = 4;
		}
		if(order.getOrderProductPorkAvailable()==1){
			orderProductPorkRecipePrimeNum = recipeListDAO.getRecipePrimeNum(5, order.getPuppyPrimeNum());
			if(orderProductPorkRecipePrimeNum==-1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('처방레시피가 등록되어있지 않습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
		}
		else{
			orderProductPorkRecipePrimeNum = 5;
		}
		if(order.getOrderProductKangarooAvailable()==1){
			orderProductKangarooRecipePrimeNum = recipeListDAO.getRecipePrimeNum(6, order.getPuppyPrimeNum());
			if(orderProductKangarooRecipePrimeNum==-1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('처방레시피가 등록되어있지 않습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
		}
		else{
			orderProductKangarooRecipePrimeNum = 6;
		}
		if(order.getOrderProductHorseAvailable()==1){
			orderProductHorseRecipePrimeNum = recipeListDAO.getRecipePrimeNum(7, order.getPuppyPrimeNum());
			if(orderProductHorseRecipePrimeNum==-1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('처방레시피가 등록되어있지 않습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
		}
		else{
			orderProductHorseRecipePrimeNum = 7;
		} */
		
				OrderDAO orderDAO = new OrderDAO();
				int result = orderDAO.orderAdd(order.getRoundPrimeNum(), order.getUserPrimeNum(), 
						order.getPuppyPrimeNum(),  order.getOrderBoxNum(),  order.getOrderProductPuppyGram(), 
						order.getOrderProductPuppyNum(),  order.getOrderProductOriginalGram(),
						order.getOrderProductOriginalNum(),  order.getOrderProductSeniorGram(),
						order.getOrderProductSeniorNum(),
						order.getOrderProductFishGram(),  order.getOrderProductFishNum(),  order.getOrderProductPorkGram(), 
						order.getOrderProductPorkNum(),  order.getOrderProductKangarooGram(), order.getOrderProductKangarooNum(), 
						order.getOrderProductHorseGram(), order.getOrderProductHorseNum(), 
						order.getOrderProductPuppyAvailable(),order.getOrderProductOriginalAvailable(),order.getOrderProductSeniorAvailable(),order.getOrderProductFishAvailable(),order.getOrderProductPorkAvailable(),
						order.getOrderProductKangarooAvailable(),order.getOrderProductHorseAvailable(),

						 order.getOrderProductPuppyRecipePrimeNum(), 
						 order.getOrderProductOriginalRecipePrimeNum(), 
						 order.getOrderProductSeniorRecipePrimeNum(), 
						 order.getOrderProductFishRecipePrimeNum(), 
						 order.getOrderProductPorkRecipePrimeNum(), 
						 order.getOrderProductKangarooRecipePrimeNum(), 
						 order.getOrderProductHorseRecipePrimeNum(), 
						order.getOrderTotalQuantity(),  order.getOrderTotalPrice(), order.getOrderETC(), order.getOrderPack());
				
				if(result == -1 ){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('주문 추가에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");

				}
				
				else{
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('주문 추가 성공')");
					script.println("location.href = 'customerAdminPuppyOrder.jsp?puppyPrimeNum="+order.getPuppyPrimeNum()+"&userPrimeNum="+order.getUserPrimeNum()+"'");
					script.println("</script>");
				}

	
				
			
			
		
		
	%>

		<script src ="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	
</body>
</html>