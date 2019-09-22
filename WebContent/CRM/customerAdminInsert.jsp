<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=" text/html; UTF-8" http-equiv="Content-type">
<title>Insert title here</title>
<script language="javascript">

function goPopup(){
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	var pop = window.open("jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}


function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	document.form.userAddress.value = roadFullAddr;
	document.form.userAddressNum.value = zipNo;
/* 	document.form.admCd.value = admCd;
	document.form.rnMgtSn.value = rnMgtSn;
	document.form.bdMgtSn.value = bdMgtSn;
	document.form.detBdNmList.value = detBdNmList;
	/** 2017년 2월 추가제공 **/
/* 	document.form.bdNm.value = bdNm;
	document.form.bdKdcd.value = bdKdcd;
	document.form.siNm.value = siNm;
	document.form.sggNm.value = sggNm;
	document.form.emdNm.value = emdNm;
	document.form.liNm.value = liNm;
	document.form.rn.value = rn;
	document.form.udrtYn.value = udrtYn;
	document.form.buldMnnm.value = buldMnnm;
	document.form.buldSlno.value = buldSlno;
	document.form.mtYn.value = mtYn;
	document.form.lnbrMnnm.value = lnbrMnnm;
	document.form.lnbrSlno.value = lnbrSlno; */
 	/** 2017년 3월 추가제공 **/
	/* document.form.emdNo.value = emdNo;  */
	
		
}
</script>
</head>

<body>
	<button onclick="history.back()">이전 페이지</button>

	<button onclick="location.href='main.jsp'">메인</button>

	<p>도거박스 회원 추가</p>
	
		<form action="customerAdminInsertAction.jsp" method="post">
			<div>
				<p>회원 이름</p>
				<input type="text" class="form-control" placeholder="회원이름" name="userName" maxlength="50"></input>
			</div>
			<div>
				
				<input  type="button" onClick="goPopup();" value="주소찾기" class="btn btn-primary form-control address-button">
						<div id="list"></div>
						<div id="callBackDiv">
						
				<table>
					<tr><td><input type="text" id="userAddressNum"  value = "" name="userAddressNum" placeholder="우편번호" class="address-num-holder"/></td></tr>
					<tr><td><input type="text" id="userAddress" value=""  name="userAddress" placeholder="주소"  class="address-full-holder"/></td></tr>
					
				</table>
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