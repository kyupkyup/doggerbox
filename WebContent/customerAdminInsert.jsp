<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=" text/html; UTF-8" http-equiv="Content-type">
<title>Insert title here</title>
</head>
<body>
	<button onclick="location.href='main.jsp'">메인</button>

	<p>도거박스 회원 추가</p>
	
		<form action="customerAdminInsertAction.jsp" method="post">
			<div>
				<p>회원 이름</p>
				<input type="text" class="form-control" placeholder="회원이름" name="userName" maxlength="50"></input>
			</div>
			<div>
				<p>회원 주소(차후에 도로명api 따올 것)</p>
				<textarea rows="2px" cols="30px"></textarea>
			</div>
			<div>
				<p>핸드폰 번호</p>
				<input type="text" class="form-control" placeholder="회원 전화번호" name="userPhoneNum" maxlength="50"></input>
			</div>
			<div>
				<p>유입 경로</p>
				<input type="text" class="form-control" placeholder="유입경로" name="userIntroRoute" maxlength="50"></input>
			</div>
			<div >
				<label for="">배송 주기 :</label>
				<select  class="select-one radio-container" name="userRoutine">
					<option value="1">정기</option>
					<option value="2">단기</option>
					<option value="3">신규</option>
				</select>	
			</div>
			<div>
			
				<label for="">배송 텀 :</label>
				<select  class="select-one radio-container" name="userTerm">
					<option value="1">2주</option>
					<option value="2">한달</option>
				</select>
			</div>
			<input type ="submit" type="button" value ="등록">
		</form>
	
	<script src ="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	
</body>

</html>