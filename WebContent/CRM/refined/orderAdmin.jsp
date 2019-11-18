<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import= "round.Round"  %>
    <%@ page import= "round.RoundDAO2"  %>
    
<!DOCTYPE html>
<html>
<head>

<meta charset=" text/html; UTF-8" http-equiv="Content-type">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../../css/userList.css">
<script src ="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 
<script type="text/javascript">
	function autoClosingAlert(selector,delay){
		var alert = $(selector).alert();
		alert.show();
		window.setTimeout(function() {alert.hide()},delay);
	}
	$(function() {
	    $( "#testDatepicker2" ).datepicker({
	        showButtonPanel: true, 
	        currentText: '오늘 날짜', 
	        closeText: '닫기', 
	        dateFormat: "yymmdd"
	    });
	});
	
	function registerRound(){
		var roundTitle = $('#roundTitle').val();
		var roundDeliveryDate = $('#testDatepicker2').val();
		if(roundTitle =="" || roundDeliveryDate ==""){
			alert("빈칸 입니다.");
		}
		$.ajax({
			type:"POST",
			url:"/RoundRegisterServlet",
			data:{
				roundTitle:encodeURIComponent(roundTitle),
				roundDeliveryDate:encodeURIComponent(roundDeliveryDate),

			},
			
			success: function(result){
/* 				if(result==1){
					autoClosingAlert('#successMessage', 3000);
					console.log(result);
				}

				else{
					autoClosingAlert('#warningMessage', 3000);
					console.log(result);
				}
				 */
				 location.reload();
			},
			error:function(request,status,error){
				  alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				  console.log("실패");
				  
			}
			
		});
		
		
		$('#roundTitle').val("");
		$('#testDatepicker2').val("");
		
	}	
	function orderList(roundPrimeNum){
		
		console.log(roundPrimeNum+"번");
		$('#orderList').empty();
		$.ajax({
			type:"POST",
			url:"/OrderTotalListServlet",
			data : {
				roundPrimeNum:roundPrimeNum
			},
			success: function(data){


				if(data=="") return;
				
				var parsed = JSON.parse(data);
				var result = parsed.result;
				for(var i=0; i<result.length; i++){
					addOrder(result[i][0].value, result[i][1].value,result[i][2].value, result[i][3].value,result[i][4].value, 
							result[i][5].value,result[i][6].value, result[i][7].value,
							result[i][8].value, result[i][9].value,result[i][10].value, result[i][11].value, 
							result[i][12].value,result[i][13].value, result[i][14].value,
							result[i][15].value, result[i][16].value,result[i][17].value, result[i][18].value,result[i][19].value, 
							result[i][20].value, result[i][21].value,result[i][22].value, result[i][23].value,result[i][24].value, 
							result[i][25].value,result[i][26].value, result[i][27].value,
							result[i][28].value, result[i][29].value,result[i][30].value, result[i][31].value,result[i][32].value, 
							result[i][33].value,result[i][34].value, result[i][35].value,
							result[i][36].value,result[i][37].value, result[i][38].value,result[i][39].value,result[i][40].value,
							result[i][41].value);
							
				}
			},
			error:function(request,status,error){
				  alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			}
		});
	}
	
	function addOrder( roundPrimeNum          
	, orderPrimeNum        
	, userPrimeNum             
	, puppyPrimeNum         
	, orderBoxNum              
	, orderProductPuppyGram  
	, orderProductPuppyNum     
	, orderProductOriginalGram 
	, orderProductOriginalNum 
	, orderProductSeniorGram   
	, orderProductSeniorNum   
	, orderProductFishGram     
	, orderProductFishNum    
	, orderProductPorkGram    
	, orderProductPorkNum      
	, orderProductKangarooGram 
	, orderProductKangarooNum  
	, orderProductHorseGram 
	, orderProductHorseNum  
	, orderProductPuppyAvailable
	, orderProductOriginalAvailable
	, orderProductSeniorAvailable
	, orderProductFishAvailable
	, orderProductPorkAvailable
	, orderProductKangarooAvailable
	, orderProductHorseAvailable
	, orderProductPuppyRecipePrimeNum
	, orderProductOriginalRecipePrimeNum
	, orderProductSeniorRecipePrimeNum
	, orderProductFishRecipePrimeNum
	, orderProductPorkRecipePrimeNum
	, orderProductKangarooRecipePrimeNum
	, orderProductHorseRecipePrimeNum
	, orderTotalQuantity       
	, orderTotalPrice         
	, orderETC               
	, orderPack
	,dueDate
	,puppyName
	,userName
	, roundTitle
	, orderTitle
	){
		$('#roundPrimeNum').val(roundPrimeNum);
		$('#orderList').append(
					'<tr>'+
						'<td class="text-center">'+
							'<p class="user-link" onclick="" style="" >'+userName+"-"+orderTitle+'</p>'+
						'</td>'+
						'<td class="text-center">'+puppyName+'</td>'+
						(orderProductPuppyAvailable != 1 ? 
								(orderProductPuppyAvailable == 2 ? 
										'<td class="text-center" style="background-color:green;">'+orderProductPuppyGram +'</td>'+
										'<td class="text-center" style="background-color:green;">'+orderProductPuppyNum +'</td>'	
										:							
										'<td class="text-center">'+orderProductPuppyGram +'</td>'+
										'<td class="text-center">'+orderProductPuppyNum +'</td>'
								)
							:
							'<td class="text-center" style="background-color:pink;">'+orderProductPuppyGram +'</td>'+
							'<td class="text-center" style="background-color:pink;">'+orderProductPuppyNum +'</td>'	
						)+
						(orderProductOriginalAvailable != 1 ? 
								(orderProductOriginalAvailable == 2 ? 
										'<td class="text-center" style="background-color:green;">'+orderProductOriginalGram +'</td>'+
										'<td class="text-center" style="background-color:green;">'+orderProductOriginalNum +'</td>'	
										:							
										'<td class="text-center">'+orderProductOriginalGram +'</td>'+
										'<td class="text-center">'+orderProductOriginalNum +'</td>'
								)
								:
							'<td class="text-center" style="background-color:pink;">'+orderProductOriginalGram +'</td>'+
							'<td class="text-center" style="background-color:pink;">'+orderProductOriginalNum +'</td>'
						

						)+
						(orderProductSeniorAvailable != 1 ? 
								(orderProductSeniorAvailable == 2 ? 
										'<td class="text-center" style="background-color:green;">'+orderProductSeniorGram +'</td>'+
										'<td class="text-center" style="background-color:green;">'+orderProductSeniorNum +'</td>'	
										:							
										'<td class="text-center">'+orderProductSeniorGram +'</td>'+
										'<td class="text-center">'+orderProductSeniorNum +'</td>'
								)
								:
								'<td class="text-center" style="background-color:pink;">'+orderProductSeniorGram +'</td>'+
								'<td class="text-center" style="background-color:pink;">'+orderProductSeniorNum +'</td>'
							
							)+
						
						(orderProductFishAvailable != 1 ? 
								(orderProductFishAvailable == 2 ? 
										'<td class="text-center" style="background-color:green;">'+orderProductFishGram +'</td>'+
										'<td class="text-center" style="background-color:green;">'+orderProductFishNum +'</td>'	
										:							
										'<td class="text-center">'+orderProductFishGram +'</td>'+
										'<td class="text-center">'+orderProductFishNum +'</td>'
								):
								'<td class="text-center" style="background-color:pink;">'+orderProductFishGram +'</td>'+
								'<td class="text-center" style="background-color:pink;">'+orderProductFishNum +'</td>'
						

						)+
						(orderProductPorkAvailable != 1 ? 
								(orderProductPorkAvailable == 2 ? 
										'<td class="text-center" style="background-color:green;">'+orderProductPorkGram +'</td>'+
										'<td class="text-center" style="background-color:green;">'+orderProductPorkNum +'</td>'	
										:							
										'<td class="text-center">'+orderProductPorkGram +'</td>'+
										'<td class="text-center">'+orderProductPorkNum +'</td>'
								):
								'<td class="text-center" style="background-color:pink;">'+orderProductPorkGram +'</td>'+
								'<td class="text-center" style="background-color:pink;">'+orderProductPorkNum +'</td>'
						

						)+
						(orderProductKangarooAvailable != 1 ? 
								(orderProductKangarooAvailable == 2 ? 
										'<td class="text-center" style="background-color:green;">'+orderProductKangarooGram +'</td>'+
										'<td class="text-center" style="background-color:green;">'+orderProductKangarooNum +'</td>'	
										:							
										'<td class="text-center">'+orderProductKangarooGram +'</td>'+
										'<td class="text-center">'+orderProductKangarooNum +'</td>'
								)	:
								'<td class="text-center" style="background-color:pink;">'+orderProductKangarooGram +'</td>'+
								'<td class="text-center" style="background-color:pink;">'+orderProductKangarooNum +'</td>'
					
	
							)+
						(orderProductHorseAvailable != 1 ? 
								(orderProductHorseAvailable == 2 ? 
										'<td class="text-center" style="background-color:green;">'+orderProductHorseGram +'</td>'+
										'<td class="text-center" style="background-color:green;">'+orderProductHorseNum +'</td>'	
										:							
										'<td class="text-center">'+orderProductHorseGram +'</td>'+
										'<td class="text-center">'+orderProductHorseNum +'</td>'
								)	:
								'<td class="text-center" style="background-color:pink;">'+orderProductHorseGram +'</td>'+
								'<td class="text-center" style="background-color:pink;">'+orderProductHorseNum +'</td>'
					

						)+
						'<td class="text-center">'+orderTotalQuantity+'</td>'+
						'<td class="text-center">'+orderTotalPrice+'</td>'+
						'<td class="text-center">'+orderETC +'</td>'+
						(orderPack==1?
								'<td class="text-center">'+"풀팩" +'</td>'
								:
								'<td class="text-center">'+"하프팩" +'</td>'

						)+
						(orderProductPuppyAvailable == 1 || orderProductOriginalAvailable==1 || orderProductSeniorAvailable==1 
								|| orderProductFishAvailable==1 || orderProductPorkAvailable==1 || orderProductKangarooAvailable==1
								|| orderProductHorseAvailable==1 ? 
								'<td class="text-center"><button class="btn btn-default" onclick="calculateIndividual('+orderPrimeNum+');">개별 레시피</button></td>'
								:
								'<td class="text-center"><button class="btn btn-default" disabled >개별 레시피</button></td>'
							)+
			        '</tr>'
		);
		
	}
	function updateRound(roundPrimeNum, roundTitle, roundDeliveryDate){
		$('#roundPrimeNum').val(roundPrimeNum);
		$('#roundTitle').val(roundTitle);
		$('#dueDate').val(roundDeliveryDate);
		$('#registerRoundButton').hide();
		$('#updateRoundButton').show();

	}
	
	function updateRoundFunction(){
		var roundPrimeNum = $('#roundPrimeNum').val();
		var roundTitle = $('#roundTitle').val();
		var roundDeliveryDate = $('#roundDeliveryDate').val();
		
		$.ajax({
			type:"POST",
			url:"/RoundUpdateServlet",
			data:{
				roundPrimeNum:roundPrimeNum,
				roundTitle:encodeURIComponent(roundTitle),
				roundDeliveryDate:encodeURIComponent(roundDeliveryDate)
				

			},
			success: function(result){
				if(result==1){
					$('#roundPrimeNum').val("");
					$('#roundTitle').val("");
					$('#roundDeliveryDate').val("");
					$('#updateRoundButton').hide();
					$('#registerRoundButton').show();
					alert("수정 성공");
				}
				else if(result==0){
					alert("빈칸이 있다.");
				}
				else{
					alert("데이터베이스 오류가 있다.");
				}
			},
			error:function(request,status,error){
				  alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			}
			
		});
	}
	
	function deleteRound(roundPrimeNum){
		msg = "진짜 삭제하시겠습니까?";
		if(confirm(msg)!=0){
			$.ajax({
				type:"POST",
				url:"/RoundDeleteServlet",
				data:{
					roundPrimeNum:roundPrimeNum,
				},
				success: function(result){
					if(result==1){
						alert("삭제 성공");
						 location.reload();
					}
					else{
						alert("데이터베이스 오류가 있다.");
					}
				},
				error:function(request,status,error){
					  alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				}
				
			});
		}else{
			return;
		}
	}
	
	
	function calculateTotal(){
		var roundPrimeNum = $('#roundPrimeNum').val();
		if(roundPrimeNum == null|| roundPrimeNum ==""){
			alert("차수를 선택해주세요.");
		}
		else{
			location.href="../calculateTotal.jsp?roundPrimeNum="+roundPrimeNum;

		}
	}
	
	function calculateIngredient(){
		var roundPrimeNum = $('#roundPrimeNum').val();
		if(roundPrimeNum == null || roundPrimeNum ==""){
			alert("차수를 선택해주세요.");
		}
		else{
			location.href="calculateIngredients.jsp?roundPrimeNum="+roundPrimeNum;

		}
		
	}
	
	function calculateIndividual(orderPrimeNum){
		location.href="calculateIndividual.jsp?orderPrimeNum="+orderPrimeNum;

	}
	
	function calculateLowProtein(){
		var roundPrimeNum = $('#roundPrimeNum').val();
		if(roundPrimeNum == null|| roundPrimeNum ==""){
			alert("치수를 선택해주세요.");
		}
		else{
			location.href="calculateLowProtein.jsp?roundPrimeNum="+roundPrimeNum;

		}
	}
</script>
<title>도거박스 관리자페이지</title>
</head>
<body>

<nav class="navbar navbar-default">
	<div class="navbar-header">
		<a class="navbar-brand">도거박스 시스템관리 프로그램</a>
	</div>
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav">
			<li class=""><a href="realMain.jsp">메인</a>
		</ul>
		<ul class="nav navbar-nav">
			<li class=""><a href="main.jsp">주문 입력</a>
		</ul>
		<ul class="nav navbar-nav">
			<li class="active"><a href="orderAdmin.jsp">주문 관리</a>
		</ul>
		<ul class="nav navbar-nav">
			<li class=""><a href="../recipe/recipeAdmin.jsp">베이스레시피/재료 관리</a>
		</ul>
	</div>
</nav>

<div class="container bootstrap snippet" style="width:1400px; height:auto;display:inline-block; margin:0 auto; "> 
	<div class="round-container" style="width:450px; display:inline-block; ">
		<h4 style=""><i class="fa fa-circle text-green"></i>차수 관리</h4>
			<input type="hidden" id="roundPrimeNum" />
		
			<input type="text" class="form-control" id="roundTitle" placeholder="차수 제목" style="width:150px; display:inline-block;"/>
			<input type="text"id="testDatepicker2" name="dueDate" style="display:inline-block;">
			<button type="button" id="registerRoundButton" class="btn btn-primary" onclick="registerRound();" style="width:100px; display:inline-block;">차수 추가</button>
			<button type="button" id="updateRoundButton"class="btn btn-primary" onclick="updateRoundFunction();" style="width:100px; display:none;">차수 수정</button>
			
		<div class="" style="overflow-y:auto; display:inline-block;">
			<table class="table table-bordered" style="width:440px;">
			<tr>
				<th>제목</th>
				<th colspan="2">배송일자</th>
			</tr>
			<%		
				RoundDAO2 roundDAO = new RoundDAO2();
				ArrayList<Round> list = new ArrayList<>();
				list = roundDAO.getList();
				for(int i = 0; i<list.size(); i++){
					%>
					<tr>
						<td onclick="orderList(<%=list.get(i).getRoundPrimeNum()%>);"><%=list.get(i).getRoundTitle()%></td>
						<td><%=list.get(i).getRoundDeliveryDate()%></td>
						<td style="width:20%;">
		                    <a href="#" class="table-link" onclick="updateRound(<%=list.get(i).getRoundPrimeNum()%>, <%=list.get(i).getRoundTitle()%>,<%=list.get(i).getRoundDeliveryDate()%>);">
						        <span class="fa-stack">
						            <i class="fa fa-square fa-stack-2x"></i>
						            <i class="fa fa-pencil fa-stack-1x fa-inverse"></i>
						      </span>
							</a>
		                    <a href="#" class="table-link  danger" onclick="deleteRound(<%=list.get(i).getRoundPrimeNum()%>);">
						        <span class="fa-stack">
						            <i class="fa fa-square fa-stack-2x"></i>
						            <i class="fa fa-trash-o  fa-stack-1x fa-inverse"></i>
						       </span>
							</a>
		                </td>
					</tr>
					
					<%
				}
			%>
			</table>
					<div class="alert alert-success" id="successMessage" style="display:none;">
						<strong>주문 등록에 성공했습니다.</strong>
					</div>
					<div class="alert alert-warning" id="warningMessage" style="display:none;">
						<strong>데이터베이스 오류가 발생했습니다.</strong>
					</div>
		</div>
	</div>
	
	<div style="width:900px; display:inline-block; ">
		<table class="table table-bordered" >
			<thead>
				<tr>
					<th>고객</th>
					<th>강아지</th>
					<th colspan='2'>퍼피</th>
					<th colspan='2'>오리지널</th>
					<th colspan='2'>시니어</th>
					<th colspan='2'>피쉬</th>
					<th colspan='2'>포크</th>
					<th colspan='2'>캥거루</th>
					<th colspan='2'>홀스</th>
					<th>총량</th>
					<th>총 가격</th>
					<th>특이사항</th>
					<th>팩</th>
					<th>레시피</th>
					
					
				</tr>
			</thead>
			
			<tbody  id="orderList">
				
			
			</tbody>
			
		</table>
		<input type="hidden" id="roundPrimeNum">
		<button onclick="calculateIngredient();" type="button" class="btn btn-primary">재료량 보기</button>
		<button onclick="calculateTotal();" type="button" class="btn btn-primary">전체 제조량 보기</button>
		<button onclick="calculateLowProtein();" type="button" class="btn btn-primary">저단백 제조량 보기</button>
		
	</div>

</div>

        
	 


</body>

</html>