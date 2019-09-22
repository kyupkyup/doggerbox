<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import = "puppy.PuppyDAO" %>
    <%@page import = "puppy.Puppy" %>
    <%@page import = "doggerboxuser.DoggerboxUserDAO" %>
    <%@page import = "doggerboxuser.DoggerboxUser" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content = "text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>
<%
	DoggerboxUserDAO userDAO = new DoggerboxUserDAO();
	int userPrimeNum = 0;
	if(request.getParameter("userPrimeNum")!=null){
		userPrimeNum = Integer.parseInt(request.getParameter("userPrimeNum"));
	}
%>	
<button onclick="history.back()">이전 페이지</button>
	<button onclick="location.href='main.jsp'">메인</button>


	<p><%=userDAO.getUser(userPrimeNum).getUserName()%>의 강아지 추가</p>
	
		<form action="customerAdminInsertPuppyAction.jsp?userPrimeNum=<%=userPrimeNum%>" method="post">
			<div>
				<p>강아지 이름</p>
				<input type="text" class="form-control" placeholder="강아지 이름" name="puppyName" maxlength="50"></input>
			</div>
			<div>
				<p>품종</p>
				<input type="text" class="form-control" placeholder="강아지 품종" name="puppySpecies" maxlength="50"></input>
			</div>
			<div>
				<p>나이</p>
				<input type="number" class="form-control" placeholder="강아지 나이" name="puppyAge" maxlength="50"></input>
			</div>
			<div>
				<label for="">성별</label>

				
				<select  class="select-one radio-container" name="puppyGender">
					<option value="1">수컷</option>
					<option value="2">암컷</option>
				</select>	
			</div>
			<div>
				<label for="">중성화 여부</label>
				<select  class="select-one radio-container" name="puppyNeutralization">
					<option value="1">중성화 함</option>
					<option value="2">중성화 안함</option>
				</select>
			</div>
			<div>
				<p>체중</p>
				<input type="text" class="form-control" placeholder="강아지 무게" name="puppyWeight" maxlength="50"></input>
			</div>
			<div>
				<p>활동량</p>

				<select  class="select-one radio-container" name="puppyActivity">
					<option value="1">거의 안 움직임</option>
					<option value="2">걸어다님</option>
					<option value="3">뛰어다님</option>
					<option value="4">날라다님</option>
				</select>
			</div>
			<div>
				<p>한 끼 권장 급여량</p>
				<input type="text" class="form-control" placeholder="권장 급여량" name="recommendQuantity" maxlength="50"></input>
			</div>
			<div>
				<p>참고사항</p>
				<input type="text" class="form-control" placeholder="참고사항" name="puppyETC" maxlength="200"></input>
			</div>
			<div>
				<p>알러지 있는 재료</p>
				<input type="text" class="form-control" placeholder="제한사항" name="puppyRestrict" maxlength="200"></input>
			</div>	
			<input type ="submit" type="button" value ="등록">
					
		</form>
	<script src ="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		
</body>

</html>