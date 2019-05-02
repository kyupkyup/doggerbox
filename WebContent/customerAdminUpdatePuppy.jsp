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
	PuppyDAO puppyDAO = new PuppyDAO();
	int puppyPrimeNum = 0;
	if(request.getParameter("puppyPrimeNum")!=null){
		puppyPrimeNum = Integer.parseInt(request.getParameter("puppyPrimeNum"));
	}
%>

	<p><%=puppyDAO.getPuppy(puppyPrimeNum).getPuppyName()%> 정보 수정</p>
	
		<form action="customerAdminUpdatePuppyAction.jsp?puppyPrimeNum=<%=puppyPrimeNum%>" method="post">
			<div>
				<p>강아지 이름</p>
				<input type="text" class="form-control" placeholder="강아지 이름" name="puppyName" maxlength="50" value="<%=puppyDAO.getPuppy(puppyPrimeNum).getPuppyName()%>"></input>
			</div>
			<div>
				<p>품종</p>
				<input type="text" class="form-control" placeholder="강아지 품종" name="puppySpecies" maxlength="50" value="<%=puppyDAO.getPuppy(puppyPrimeNum).getPuppySpecies()%>"></input>
			</div>
			<div>
				<p>나이</p>
				<input type="number" class="form-control" placeholder="강아지 나이" name="puppyAge" maxlength="50" value="<%=puppyDAO.getPuppy(puppyPrimeNum).getPuppyAge()%>"></input>
			</div>
			<div>
				<label for="">성별</label>
			<%
				if(puppyDAO.getPuppy(puppyPrimeNum).getPuppyGender()==1){
					%>
				<select  class="select-one radio-container" name="puppyGender">
					<option value="1" selected>수컷</option>
					<option value="2">암컷</option>
				</select>
					<%
				}			
				else if(puppyDAO.getPuppy(puppyPrimeNum).getPuppyGender()==2){

			%>

				<select  class="select-one radio-container" name="puppyGender">
					<option value="1">수컷</option>
					<option value="2"selected>암컷</option>
				</select>
					<%
				}
			%>
			</div>
			<div>
			
						<%
				if(puppyDAO.getPuppy(puppyPrimeNum).getPuppyNeutralization()==1){
					%>
				<label for="">중성화 여부</label>
				<select  class="select-one radio-container" name="puppyNeutralization">
					<option value="1"selected>중성화 함</option>
					<option value="2">중성화 안함</option>
				</select>
					<%
				}			
				else if(puppyDAO.getPuppy(puppyPrimeNum).getPuppyNeutralization()==2){

			%>

				<label for="">중성화 여부</label>
				<select  class="select-one radio-container" name="puppyNeutralization">
					<option value="1">중성화 함</option>
					<option value="2" selected>중성화 안함</option>
				</select>
					<%
				}
			%>
			
			</div>


			<div>
				<p>체중</p>
				<input type="text" class="form-control" placeholder="강아지 무게" name="puppyWeight" maxlength="50" value="<%=puppyDAO.getPuppy(puppyPrimeNum).getPuppyWeight()%>"></input>
			</div>
			
			<div>					
			<%
				if(puppyDAO.getPuppy(puppyPrimeNum).getPuppyActivity()==1){
					%>
				<p>활동량</p>

				<select  class="select-one radio-container" name="puppyActivity">
					<option value="1" selected>거의 안 움직임</option>
					<option value="2">걸어다님</option>
					<option value="3">뛰어다님</option>
					<option value="4">날라다님</option>
				</select>
					<%
				}			
				else if(puppyDAO.getPuppy(puppyPrimeNum).getPuppyActivity()==2){

			%>
				<p>활동량</p>

				<select  class="select-one radio-container" name="puppyActivity">
					<option value="1">거의 안 움직임</option>
					<option value="2" selected>걸어다님</option>
					<option value="3">뛰어다님</option>
					<option value="4">날라다님</option>
				</select>
					<%
				}
			%>
						<%
				if(puppyDAO.getPuppy(puppyPrimeNum).getPuppyActivity()==3){
					%>
				<p>활동량</p>

				<select  class="select-one radio-container" name="puppyActivity">
					<option value="1">거의 안 움직임</option>
					<option value="2" >걸어다님</option>
					<option value="3" selected>뛰어다님</option>
					<option value="4">날라다님</option>
				</select>
					<%
				}			
				else if(puppyDAO.getPuppy(puppyPrimeNum).getPuppyActivity()==4){

			%>
				<p>활동량</p>

				<select  class="select-one radio-container" name="puppyActivity">
					<option value="1">거의 안 움직임</option>
					<option value="2">걸어다님</option>
					<option value="3">뛰어다님</option>
					<option value="4" selected>날라다님</option>
				</select>
					<%
				}
			%>

			</div>
			<div>
				<p>한 끼 권장 급여량</p>
				<input type="text" class="form-control" placeholder="권장 급여량" name="recommendQuantity" maxlength="50" value="<%=puppyDAO.getPuppy(puppyPrimeNum).getRecommendQuantity()%>"></input>
			</div>
			<div>
				<p>참고사항</p>
				<input type="text" class="form-control" placeholder="참고사항" name="puppyETC" maxlength="200" value="<%=puppyDAO.getPuppy(puppyPrimeNum).getPuppyETC()%>"></input>
			</div>
			<div>
				<p>제한사항</p>
				<input type="text" class="form-control" placeholder="알러지 있는 재료" name="puppyRestrict" maxlength="200" value="<%=puppyDAO.getPuppy(puppyPrimeNum).getPuppyRestrict()%>"></input>
			</div>	
			<input type ="submit" type="button" value ="등록">
					
		</form>
	<script src ="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		
</body>

</html>