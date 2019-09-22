<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="puppy.Puppy" %>
    <%@page import="puppy.PuppyDAO" %>
    <%@page import="doggerboxuser.DoggerboxUser" %>
    <%@page import="doggerboxuser.DoggerboxUserDAO" %>  
    <%@page import = "java.util.ArrayList" %>
     
<!DOCTYPE html>
<html>
<head>

<script src ="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" charset="utf-8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
	
<meta charset=" text/html; UTF-8" http-equiv="Content-type">

<link href="../css/customer_admin_puppy_style.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">

<title>Insert title here</title>
</head>
<body>

<%
	DoggerboxUserDAO userDAO = new DoggerboxUserDAO();
	PuppyDAO puppyDAO = new PuppyDAO();
	
	String puppyNeutralization=null;
	String puppyGender=null;
	String puppyActivity=null;

	int userPrimeNum = 0;
	if(request.getParameter("userPrimeNum")!=null){
		userPrimeNum = Integer.parseInt(request.getParameter("userPrimeNum"));
	}
%>
<button onclick="history.back()">이전 페이지</button>

<button onclick="location.href='main.jsp'">메인</button>

 	<p><%=userDAO.getUser(userPrimeNum).getUserName()%> 님의 강아지 정보</p>
 	
 	
		<table id="customerAdminPuppy" border="1" class="cell-border">
		<thead>
			<tr class="table-head">
				<th>강아지 번호</th>
				<th>강아지 이름</th>
				<th>품종</th>
				<th>나이</th>
				<th>성별</th>
				<th>중성화 유무</th>
				<th>체중</th>
				<th>활동량</th>
				<th>권장 급여량</th>
				<th>참고사항</th>
				<th>제한사항</th>
				<th>주문 등록</th>
				<th>수정</th>
				<th>삭제</th>	
			</tr>
		</thead>
		<tbody>	
					<%
					ArrayList<Puppy> list = puppyDAO.getList(userPrimeNum);
			for(int i = 0; i< list.size(); i++){
				if(list.get(i).getPuppyGender()==1){
					puppyGender = "수컷";
				}
				else if(list.get(i).getPuppyGender()==2){
					puppyGender = "암컷";
				}
				 if(list.get(i).getPuppyNeutralization()==1){
					 puppyNeutralization = "중성화";
				}
				 else if(list.get(i).getPuppyNeutralization()==2){
					 puppyNeutralization = "비중성화";
				}
				if(list.get(i).getPuppyActivity()==1){
					puppyActivity = "거의 안 움직임";
				}
				else if(list.get(i).getPuppyActivity()==2){
					puppyActivity = "걸어다님";
				}
				else if(list.get(i).getPuppyActivity()==3){
					puppyActivity = "뛰어다님";
				}
				else if(list.get(i).getPuppyActivity()==4){
					puppyActivity = "날라다님";
				}
		%>
			<tr class="table-body">
				<td class="puppyPrimeNum"><%=list.get(i).getPuppyPrimeNum()%></td>
				<td class="puppyName"><%=list.get(i).getPuppyName()%></td>
				<td class="puppySpecies"><%=list.get(i).getPuppySpecies()%></td>
				<td class="puppyAge"><%=list.get(i).getPuppyAge()%></td>
				<td class="puppyGender"><%=puppyGender%></td>
				<td class="puppyNeutralization"><%=puppyNeutralization%></td>
				<td class="puppyWeight"><%=list.get(i).getPuppyWeight()%></td>
				<td class="puppyActivity"><%=puppyActivity%></td>
				<td class="puppyRecommendQuantity"><%=list.get(i).getRecommendQuantity()%>g</td>
				<td class="puppyETC"><%=list.get(i).getPuppyETC()%></td>
				<td class="puppyRestrict"><%=list.get(i).getPuppyRestrict()%></td>
				
				<td><button onclick="location.href='customerAdminPuppyOrder.jsp?puppyPrimeNum=<%=list.get(i).getPuppyPrimeNum()%>&userPrimeNum=<%=userPrimeNum%>'">주문 관리</button></td>
				<td><button onclick="location.href='recipe/puppyRecipeAdministration.jsp?puppyPrimeNum=<%=list.get(i).getPuppyPrimeNum()%>'">개별 레시피 관리</button></td>
				<td><button onclick="location.href='customerAdminUpdatePuppy.jsp?puppyPrimeNum=<%=list.get(i).getPuppyPrimeNum()%>'">수정</button></td>
				<td><button onclick="location.href='customerAdminDeletePuppyAction.jsp?puppyPrimeNum=<%=list.get(i).getPuppyPrimeNum()%>&userPrimeNum=<%=userPrimeNum%>'">삭제</button></td>
				
				
			</tr>
			<%
			}
			%>
			</tbody>
		</table>
		
	<button onclick="location.href='customerAdminInsertPuppy.jsp?userPrimeNum=<%=userPrimeNum%>'">강아지 입력</button>

<script type="text/javascript">
$(document).ready( function () {
    $('#customerAdminPuppy').dataTable({
    	"ordering": false
    });
} );
</script>
</body>

</html>