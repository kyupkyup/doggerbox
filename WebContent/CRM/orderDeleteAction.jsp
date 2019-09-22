<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "order.Order" %>
<%@ page import= "order.OrderDAO" %>
<%@ page import= "java.io.PrintWriter" %>

<% request.setCharacterEncoding("UTF-8");%>


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
 	if(request.getParameter("orderPrimeNum")!=null){
 		orderPrimeNum = Integer.parseInt(request.getParameter("orderPrimeNum"));
	} 

			
			
				OrderDAO orderDAO = new OrderDAO();
				int result = orderDAO.deleteOrder(orderPrimeNum);
				
				if(result == -1 ){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('주문 삭제에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");

				}
				
				else{
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('주문 삭제 성공')");
					script.println("location.href = 'customerAdmin.jsp'");
					script.println("</script>");
				}

	
	
			
		
		
	%>

	<script src ="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	
</body>

</html>