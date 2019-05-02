<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="doggerboxuser.DoggerboxUser" %>
<%@ page import ="doggerboxuser.DoggerboxUserDAO" %>
<%@ page import ="puppy.Puppy" %>
<%@ page import ="puppy.PuppyDAO" %>


<html>
<head>
<meta charset=" text/html; UTF-8" http-equiv="Content-type">
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript">
var newWindow;
function openNewWindow(){
/*     var data = document.querySelector('#OrderInsertUserName').value;
 */    window.open("orderRoundCheck.jsp" , "newWindow", "width=300, height=400, scrollbar=no");
}

function sumQuantity(){

	if(document.getElementById("puGram").value&&document.getElementById("oGram").value&&
			document.getElementById("sGram").value&&document.getElementById("fGram").value&&
			document.getElementById("pGram").value&&document.getElementById("kGram").value&&
			document.getElementById("hGram").value&&
			document.getElementById("puNum").value&&document.getElementById("oNum").value&&
			document.getElementById("sNum").value&&document.getElementById("fNum").value&&
			document.getElementById("pNum").value&&document.getElementById("kNum").value&&
			document.getElementById("hNum").value){
		document.getElementById("totalPrice").value = 
			parseInt(document.getElementById("puGram").value) * parseInt(document.getElementById("puNum").value) +
			parseInt( document.getElementById("oGram").value)* parseInt(document.getElementById("oNum").value) + 
			parseInt(document.getElementById("sGram").value)* parseInt(document.getElementById("sNum").value)  + 
			parseInt(document.getElementById("fGram").value) * parseInt(document.getElementById("fNum").value) + 
			parseInt(document.getElementById("pGram").value) * parseInt(document.getElementById("pNum").value) + 
			parseInt(document.getElementById("kGram").value) * parseInt(document.getElementById("kNum").value) + 
			parseInt(document.getElementById("hGram").value) * parseInt(document.getElementById("hNum").value) ;	
	}
	
	if(document.getElementById("puGram").value&&document.getElementById("oGram").value&&
			document.getElementById("sGram").value&&document.getElementById("fGram").value&&
			document.getElementById("pGram").value&&document.getElementById("kGram").value&&
			document.getElementById("hGram").value&&
			document.getElementById("puNum").value&&document.getElementById("oNum").value&&
			document.getElementById("sNum").value&&document.getElementById("fNum").value&&
			document.getElementById("pNum").value&&document.getElementById("kNum").value&&
			document.getElementById("hNum").value){
		document.getElementById("totalPrice").value = 
			parseInt(document.getElementById("puGram").value) * parseInt(document.getElementById("puNum").value) *3200+
			parseInt( document.getElementById("oGram").value)* parseInt(document.getElementById("oNum").value) *3100+ 
			parseInt(document.getElementById("sGram").value)* parseInt(document.getElementById("sNum").value) * 3200+ 
			parseInt(document.getElementById("fGram").value) * parseInt(document.getElementById("fNum").value) * 3400+ 
			parseInt(document.getElementById("pGram").value) * parseInt(document.getElementById("pNum").value)* 3400 + 
			parseInt(document.getElementById("kGram").value) * parseInt(document.getElementById("kNum").value)* 3500+ 
			parseInt(document.getElementById("hGram").value) * parseInt(document.getElementById("hNum").value);	
	}
	
}
</script>
<%
	int puppyPrimeNum =0;
	if(request.getParameter("puppyPrimeNum")!=null){
		puppyPrimeNum = Integer.parseInt(request.getParameter("puppyPrimeNum"));
	}
	int userPrimeNum =0;
	if(request.getParameter("userPrimeNum")!=null){
		userPrimeNum = Integer.parseInt(request.getParameter("userPrimeNum"));
	}
	
	PuppyDAO puppyDAO = new PuppyDAO();
	DoggerboxUserDAO doggerboxUserDAO= new DoggerboxUserDAO();
		
%>
	<button onclick="location.href='main.jsp'">메인</button>

	<p>도거박스 주문 추가</p>
	
		
		<div>
			<input type="button" id="btn_submit" value="차수 찾기" onclick="openNewWindow()">
		</div>
	
		<form action="orderInsertAction.jsp" method="post">
			<div>
			<p>차수 고유번호</p>
				<input type="number"  class="form-control" name="roundPrimeNum" id="OrderRoundPrimeNum" ></input>
			</div>
			<div>
			<p>차수 제목</p>
				<input type="text" disabled class="form-control" name="roundTitle" id="OrderRoundTitle"></input>
			
			</div>
			<div>
			<p>차수 배송날짜</p>
				<input type="text" disabled class="form-control" name="roundDeliveryDate" id="OrderRoundDeliveryDate"></input>
			
			</div>
			<div>
			<p>유저 고유번호</p>
				<input type="number"  class="form-control" name="userPrimeNum" value="<%=userPrimeNum%>"></input>
			</div>
			<div>
			<p>유저 이름</p>
				<input type="text" disabled class="form-control" name="userName" value="<%=doggerboxUserDAO.getUserName(userPrimeNum)%>"></input>
			
			</div>
			
			<div>
			<p>강아지 고유번호</p>
				<input type="number"  class="form-control" name="puppyPrimeNum" value="<%=puppyPrimeNum%>"></input>
			</div>
			<div>
			<p>강아지 이름</p>
				<input type="text" disabled class="form-control" name="puppyName" value="<%=puppyDAO.getPuppyName(puppyPrimeNum)%>"></input>
			
			</div>
			<div>
				<p>박스번호</p>
				<p>박스번호 산출</p>
			</div>
			<div>
				<input type="number" onkeyup="sumQuantity()" class="form-control" placeholder="퍼피(gram)" name="orderProductPuppyGram" maxlength="50" id="puGram" value="" ></input>
			</div>
			<div>
				<input type="number" onkeyup="sumQuantity()" class="form-control" placeholder="퍼피(개수)" name="orderProductPuppyNum" maxlength="50" id="puNum" value=""></input>
			</div>
			<div>
				<input type="number" onkeyup="sumQuantity()" class="form-control" placeholder="오리지널(gram)" name="orderProductOriginalGram" maxlength="50" id="oGram" value=""></input>
			</div>
			<div>
				<input type="number" onkeyup="sumQuantity()" class="form-control" placeholder="오리지널(개수)" name="orderProductOriginalNum" maxlength="50" id="oNum" value=""></input>
			</div>
			<div>
				<input type="number" onkeyup="sumQuantity()" class="form-control" placeholder="시니어(gram)" name="orderProductSeniorGram" maxlength="50" id="sGram" value=""></input>
			</div>
			<div>
				<input type="number" onkeyup="sumQuantity()" class="form-control" placeholder="시니어(개수)" name="orderProductSeniorNum" maxlength="50" id="sNum" value=""></input>
			</div>
			<div>
				<input type="number" onkeyup="sumQuantity()" class="form-control" placeholder="피쉬(gram)" name="orderProductFishGram" maxlength="50" id="fGram" value=""></input>
			</div>
			<div>
				<input type="number" onkeyup="sumQuantity()" class="form-control" placeholder="피쉬(개수)" name="orderProductFishNum" maxlength="50" id="fNum" value=""></input>
			</div>
			<div>
				<input type="number" onkeyup="sumQuantity()" class="form-control" placeholder="포크(gram)" name="orderProductPorkGram" maxlength="50" id="pGram" value=""></input>
			</div>
			<div>
				<input type="number" onkeyup="sumQuantity()" class="form-control" placeholder="포크(개수)" name="orderProductPorkNum" maxlength="50" id="pNum" value=""></input>
			</div>
			<div>
				<input type="number" onkeyup="sumQuantity()" class="form-control" placeholder="캥거루(gram)" name="orderProductKangarooGram" maxlength="50" id="kGram" value=""></input>
			</div>
			<div>
				<input type="number" onkeyup="sumQuantity()" class="form-control" placeholder="캥거루(개수)" name="orderProductKangarooNum" maxlength="50" id="kNum" value=""></input>
			</div>
			<div>
				<input type="number" onkeyup="sumQuantity()" class="form-control" placeholder="홀스(gram)" name="orderProductHorseGram" maxlength="50" id="hGram" value=""></input>
			</div>
			<div>
				<input type="number" onkeyup="sumQuantity()" class="form-control" placeholder="홀스(개수)" name="orderProductHorseNum" maxlength="50" id="hNum" value=""></input>
			</div>
			<div>
				<input type="number" onkeyup="sumQuantity()" class="form-control" placeholder="특별(gram)" name="orderProductIndividualGram" maxlength="50" id="IGram" value=""></input>
			</div>
			<div>
				<input type="number" onkeyup="sumQuantity()" class="form-control" placeholder="특별(개수)" name="orderProductIndividualNum" maxlength="50" id="INum" value=""></input>
			</div>
			<div>
				<p>총 주문량 :</p>
				<input type="number" class="form-control" placeholder="" name="orderTotalQuantity" maxlength="50" id="totalQuantity"value=""></input>

			</div>
			
			<div>
				<p>가격 :</p>
				<input type="number" class="form-control" placeholder="" name="orderTotalPrice" id="totalPrice "maxlength="50" value=""></input>
			
			</div>
			<div>
				<input type="text" class="form-control" placeholder="참고사항" name="orderETC" maxlength="50"></input>
				
			</div>
			<div>
			
				<label for="">팩 :</label>
				<select  class="select-one radio-container" name="orderPack">
					<option value="1">풀팩</option>
					<option value="2">하프팩</option>
				</select>
				
			</div>
						<input type ="submit" type="button" value ="등록">
			
		</form>
	
	
		<script src ="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	
</body>

</html>