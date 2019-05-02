<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import = "doggerboxuser.DoggerboxUser" %>
    <%@page import = "doggerboxuser.DoggerboxUserDAO" %>
    <%@page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<link href="css/customer_admin_style.css" rel="stylesheet">

<meta http-equiv="Content-Type" content = "text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String userRoutine = null;
	String userTerm = null;

%>

	<p>도거박스 회원 관리</p>
	<button onclick="location.href='main.jsp'">메인</button>
	<button onclick="location.href='customerAdminInsert.jsp'">회원 입력</button>
	
	
		<table class="customer_admin_table" border="1" rules="all">

			<tr>	
				<th>고객번호</th>
				<th>고객명</th>
				<th>기본주소</th>
				<th>핸드폰주소</th>
				<th>유입경로</th>
				<th>구매 주기</th>
				<th>구매 텀</th>
				<th>강아지 설정</th>
				<th>수정 </th>
				<th>삭제</th>	
			</tr>
			
		<%
						DoggerboxUserDAO userDAO = new DoggerboxUserDAO();
						
									ArrayList<DoggerboxUser> list = userDAO.getList();
									for(int i = 0; i< list.size(); i++){
										if(list.get(i).getUserRoutine()==1){
											userRoutine = "정기";
										}
										else if(list.get(i).getUserRoutine()==2){
											userRoutine = "단기";
										}
										else if(list.get(i).getUserRoutine()==3){
											userRoutine = "신규";
										}
										if(list.get(i).getUserTerm()==1){
											userTerm = "2주";
										}
										else if(list.get(i).getUserTerm()==2){
											userTerm = "한 달";
										}
									
										
										
					%>
			<tr>
				<td class="userPrimeNum"><%=list.get(i).getUserPrimeNum()%></td>
				<td class="userName"><%=list.get(i).getUserName()%></td>
				<td class="userAddress"><%=list.get(i).getUserAddress()%></td>
				<td class="userPhoneNum"><%=list.get(i).getUserPhoneNum()%></td>
				<td class="userIntroRoute"><%=list.get(i).getUserIntroRoute()%></td>
				<td class="userRoutine"><%=userRoutine%></td>
				<td class="userTerm"><%=userTerm%></td>
				<td><button onclick="window.open('customerAdminPuppy.jsp?userPrimeNum=<%=list.get(i).getUserPrimeNum()%>','puppyAdmin','width=900', 'height=500', 'left=20', 'top=20',
						'scrollbar=yes');">강아지 설정</button></td>
				<td><button onclick="location.href='customerAdminUpdate.jsp?userPrimeNum=<%=list.get(i).getUserPrimeNum()%>'">수정</button></td>
				<td><button onclick="location.href='customerAdminDeleteAction.jsp?userPrimeNum=<%=list.get(i).getUserPrimeNum()%>'">삭제</button></td>
			</tr>
			<%
				}
			%>
		</table>

		<script src ="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	
</body>
</html>