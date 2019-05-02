<!DOCTYPE html>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="round.Round" %>
<%@ page import ="round.RoundDAO" %>
<%@ page import ="java.util.ArrayList" %>


<html>
<head>

<meta charset=" text/html; UTF-8" http-equiv="Content-type">
<title>도거박스 관리자페이지</title>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.4.0.js"></script>

<%
/* 	int puppyPrimeNum =null;
	if(request.getParameter("puppyPrimeNum")!=null){
		puppyPrimeNum = request.getParameter("puppyPrimeNum");
	}
 */
/* 		
	int puppyPrimeNum = 0;
	if(request.getParameter("puppyPrimeNum")!=null){
		puppyPrimeNum =Integer.parseInt(request.getParameter("puppyPrimeNum"));
	}  */
%>
		<p>차수 확인</p>
		<table>

	<%
		RoundDAO roundDAO = new RoundDAO();
		ArrayList<Round> list = roundDAO.getList();
		for(int i = 0; i< list.size(); i++){
	%>
			<tbody>
			<tr>
				<td><%=list.get(i).getRoundTitle()%></td>
				<td><%=list.get(i).getRoundPrimeNum()%></td>
				<td><%=list.get(i).getRoundDeliveryDate()%></td>
				<td><input type="button" onClick="sender1('<%=list.get(i).getRoundTitle()%>','<%=list.get(i).getRoundPrimeNum()%>','<%=list.get(i).getRoundDeliveryDate()%>')" value="선택"></td>
			</tbody>
		
	
	<%
	
		}
	%>
	<!--  자바스크립트 배우기-->

	</table>
<%-- 	<%
		if(request.getParameter("userPrimeNum")==null){
			%>
				<div>
					고객을 선택해주세요.
				</div>
					
			<%
		}
			
		else{
			
			%>
		<p>강아지 선택</p>
		<table>

		<%
		PuppyDAO puppyDAO = new PuppyDAO();
		ArrayList<Puppy> listPuppy = puppyDAO.getList(userPrimeNum);
		for(int i = 0; i< listPuppy.size(); i++){
	%>
		<tbody>
			<tr>
				<td><%=listPuppy.get(i).getPuppyPrimeNum()%></td>
				<td><%=listPuppy.get(i).getPuppyName()%></td>
				<td><%=listPuppy.get(i).getPuppySpecies()%></td>
				<td><%=listPuppy.get(i).getPuppyAge()%></td>

				<td><input type="button" onClick="sender1('<%=listPuppy.get(i).getPuppyName()%>','<%=userPrimeNum%>','<%=listPuppy.get(i).getPuppyPrimeNum()%>')" value="선택"></td>
			</tr>
		</tbody>
		
	
	
	<%
		}
	}
	%>
		</table> --%>

<script type="text/javascript">

function sender1(roundTitle,roundPrimeNum,roundDeliveryDate){
	window.opener.document.getElementById('OrderRoundTitle').value=roundTitle;
	window.opener.document.getElementById('OrderRoundPrimeNum').value=roundPrimeNum;
	window.opener.document.getElementById('OrderRoundDeliveryDate').value=roundDeliveryDate;

	window.close();
}
</script>


</body>



</html>