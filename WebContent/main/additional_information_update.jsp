<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="doggerboxuser.DoggerboxUser" %>
<%@ page import="doggerboxuser.DoggerboxUserDAO" %>

<!DOCTYPE html>
<html>
<head>
<script src ="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="css/main_style.css">
<link rel="stylesheet" href="css/mypage/additional_information_style.css">

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale=1>
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
<style type="text/css">
 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: black; text-decoration: none;}
</style>
<title>도거박스:&nbsp;건강한 변화를 선물합니다. </title>
</head>
<body>
<%
	String userID=null;

	if(request.getParameter("userID")!=null){
		userID = request.getParameter("userID");
	}
	DoggerboxUserDAO userDAO = new DoggerboxUserDAO();
	DoggerboxUser user = userDAO.getUser(userID);
	
%>
	<div class="container"> 
		
			<div class="header">
				<a href="main.jsp"><img src="img/logo.png" width="150px" height="50px" class="logo"></a>
				<a href="main.jsp"><img src="img/logo.png" width="100px" height="40px" class="logo_mobile"></a>
				<div class="link-container">
					<a href="myPage.jsp"  class="my-page">마이 페이지</a>				
					<a href="bulletin/bulletin_intro.jsp"  class="bulletin">게시판</a>
					<a href="product/basic_lineup.jsp"  class="product-introduce">제품 소개</a>
					<a href="company_introduce.jsp"  class="company-introduce">회사소개</a>
				</div>
				
			</div>
		
		<div class="main-container1">
			<form action="additional_informationAction.jsp?userID=<%=userID%>" method="post">
				<input type="text" name="userName" placeholder="이름" class="userName" value="<%=user.getUserName()%>">
				<div class="address-holder">
						<input  type="button" onClick="goPopup();" value="주소찾기" class="address-button">
								<div id="list"></div>
								<div id="callBackDiv">
		
							<input type="hidden" id="userAddressNum"  value = "" name="userAddressNum" placeholder="우편번호" class=" address-num-holder"/>
							<input type="text" id="userAddress" value="<%=user.getUserAddress()%>"  name="userAddress" placeholder="주소" class="address-full-holder"/>
							
						</div>
				</div>
				<input type="text" name="userPhoneNum" placeholder="핸드폰 번호" class="userPhoneNum" value="<%=user.getUserPhoneNum()%>"/>
				<input type="text" name="userEmail" placeholder="이메일"class="userEmail" value="<%=user.getUserEmail()%>"/>
				<input type = "submit" class ="submit-button" value = "입력 완료">
				
			</form>
		</div>
			
 
<!-- 		<div class="footer"></div>
 -->	</div>
	


</body>


</html>