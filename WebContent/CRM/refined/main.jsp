<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

	function addUserFunction(){
		var userName = $('#userName').val();
		var userAddress = $('#userAddress').val();
		var userPhoneNum = $('#userPhoneNum').val();
		var userIntroRoute = $('#userIntroRoute').val();
		var userRoutine = $('#userRoutine').val();
		var userTerm = $('#userTerm').val();
		var introduceWho = $('#introduceWho').val();
		
		
		$.ajax({
			type:"POST",
			url:"/UserRegisterServlet",
			data:{
				userName:encodeURIComponent(userName),
				userAddress:encodeURIComponent(userAddress),
				userPhoneNum:encodeURIComponent(userPhoneNum),
				userIntroRoute:encodeURIComponent(userIntroRoute),
				userRoutine:encodeURIComponent(userRoutine),
				userTerm:encodeURIComponent(userTerm),
				introduceWho:encodeURIComponent(introduceWho)

			},
			
			success: function(result){
				if(result==1){
					alert("등록 완료");	
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
		$('#userName').val("");
		$('#userAddress').val("");
		$('#userPhoneNum').val("");
		$('#userIntroRoute').val("");
		$('#userRoutine').val(1);
		$('#userTerm').val(1);
		$('#introduceWho').val("");

	}

	function searchUser(){
		var searchUserName = $('#searchUserName').val();
		if(searchUserName==""){
 			alert("빈칸 입니다.");
		}
		$('#userList').empty();
		$.ajax({
			type:"POST",
			url:"/UserListServlet",
			data : {
				userName:encodeURIComponent(searchUserName)
			},
			success: function(data){

				if(data=="") return;
				
				var parsed = JSON.parse(data);
				var result = parsed.result;
				for(var i=0; i<result.length; i++){
					addUser(result[i][0].value, result[i][1].value,result[i][2].value, result[i][3].value,result[i][4].value, result[i][5].value,result[i][6].value, result[i][7].value, result[i][8].value);
							
				}
			},
			error:function(request,status,error){
				  alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			}
		});
	}
	
	function addUser(userPrimeNum, userName, userAddress, userPhoneNum, userIntroRoute, userRoutine, userTerm, addDate, introduceWho){
		$('#userList').append('<table class="table user-list">' +
				'<tbody>' +
					'<tr>'+
						'<td>'+
							'<p onclick="searchPuppy('+userPrimeNum+')" style="" >'+userPrimeNum+'</p>'+
						'</td>'+
						'<td><p class="user-link" onclick="searchPuppy('+userPrimeNum+')">'+userName+'</p></td>'+
						'<td class="text-center">'+
							'<p>'+userPhoneNum + '</p>'+
						'</td>'+
						'<td style="width:20%;">'+
		                    '<a href="#" class="table-link">'+
						        '<span class="fa-stack" onclick="updateUser('+userPrimeNum+',\''+userName+'\',\''+userAddress+'\',\''+userPhoneNum+'\',\''+userIntroRoute+'\','+userRoutine+','+userTerm+',\''+introduceWho+'\');">'+
						            '<i class="fa fa-square fa-stack-2x"></i>'+
						            '<i class="fa fa-pencil fa-stack-1x fa-inverse"></i>'+
						       '</span>'+
							'</a>'+
		                    '<a href="#" class="table-link  danger">'+
						        '<span class="fa-stack" onclick="deleteUser('+userPrimeNum+');">'+
						            '<i class="fa fa-square fa-stack-2x"></i>'+
						            '<i class="fa fa-trash-o  fa-stack-1x fa-inverse"></i>'+
						       '</span>'+
							'</a>'+
		                '</td>'+
			        '</tr>'+
			    '</tbody>'+
			'</table>'
		);
	}
	function updateUser(userPrimeNum, userName, userAddress, userPhoneNum, userIntroRoute, userRoutine, userTerm, introduceWho){
		$('#userName').val(userName);
		$('#userAddress').val(userAddress);
		$('#userPhoneNum').val(userPhoneNum);
		$('#userIntroRoute').val(userIntroRoute);
		$('#userRoutine').val(userRoutine);
		$('#userTerm').val(userTerm);
		$('#introduceWho').val(introduceWho);
		$('#userUserPrimeNum').val(userPrimeNum);
		$('#userUpdateButton').show();
		$('#userRegisterButton').hide();
	}
	
	function updateUserFunction(){
		var userName = $('#userName').val();
		var userAddress =$('userAddress').val();
		var userPhoneNum = $('#userPhoneNum').val();
		var userIntroRoute = $('#userIntroRoute').val();
		var userRoutine = $('#userRoutine').val();
		var introduceWho  = $('#introduceWho').val();
		var userTerm  = $('#userTerm').val();

		var userPrimeNum = $('#userUserPrimeNum').val();
		
		$.ajax({
			type:"POST",
			url:"/UserUpdateServlet",
			data:{
				userPrimeNum:userPrimeNum,
				userName:encodeURIComponent(userName),
				userAddress:encodeURIComponent(userAddress),
				userPhoneNum:encodeURIComponent(userPhoneNum),
				userIntroRoute:encodeURIComponent(userIntroRoute),
				userRoutine:encodeURIComponent(userRoutine),
				userTerm:encodeURIComponent(userTerm)
			},
			success: function(result){
				if(result==1){
					$('#userPrimeNum').val("");
					$('#userName').val("");
					$('#userAddress').val("");
					$('#userPhoneNum').val("");
					$('#userIntroRoute').val("");
					$('#userRoutine').val(1);
					$('#userTerm').val(1);
					$('#introduceWho').val("");

					$('#userUpdateButton').hide();
					$('#userRegisterButton').show();
					
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
	function deleteUser(userPrimeNum){
		msg = "진짜 삭제하시겠습니까?";
		if(confirm(msg)!=0){
			$.ajax({
				type:"POST",
				url:"/UserDeleteServlet",
				data:{
					userPrimeNum:userPrimeNum,
				},
				success: function(result){
					if(result==1){
						alert("삭제 성공")
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
	
	function addPuppyFunction()
	{			
		var userPrimeNum = $('#puppyUserPrimeNum').val();
		if(userPrimeNum == "" || userPrimeNum == null){
			alert("유저를 선택해주세요.");
		}
		var puppyName = $('#puppyName').val();
		var puppySpecies = $('#puppySpecies').val();
		var puppyAge = $('#puppyAge').val();
		var puppyAgeETC = $('#puppyAgeETC').val();
		var puppyAgeMonth = $('#puppyAgeMonth').val();
		var puppyGender = $('#puppyGender').val();
		var puppyNeutralization = $('#puppyNeutralization').val();
		var puppyWeight = $('#puppyWeight').val();
		var puppyWeightETC = $('#puppyWeightETC').val();
		var puppyActivity = $('#puppyActivity').val();
		var puppyETC = $('#puppyETC').val();
		var puppyRestrict = $('#puppyRestrict').val();
		var recommendedQuantity = $('#recommendedQuantity').val();
		var paymentDate = $('#testDatepicker2').val();
		var weightControl = $('#weightControl').val();
		var foodSpecies = $('#foodSpecies').val();

		$.ajax({
			type:"POST",
			url:"/PuppyRegisterServlet",
			data:{
				puppyName:encodeURIComponent(puppyName),
				puppySpecies:encodeURIComponent(puppySpecies),
				puppyRestrict:encodeURIComponent(puppyRestrict),
				userPrimeNum:userPrimeNum,
				puppyAge:puppyAge,
				puppyAgeMonth:encodeURIComponent(puppyAgeMonth),
				puppyAgeETC:puppyAgeETC,
				puppyGender:puppyGender,
				puppyNeutralization:puppyNeutralization,
				puppyWeight:puppyWeight,
				puppyWeightETC:encodeURIComponent(puppyWeightETC),
				puppyActivity:puppyActivity,
				puppyETC:encodeURIComponent(puppyETC),
				recommendedQuantity:recommendedQuantity,
				paymentDate:paymentDate,
				weightControl:weightControl,
				foodSpecies:foodSpecies
			},
			
			success: function(result){
				if(result==1){
					searchPuppy(userPrimeNum);

					/*autoClosingAlert('#successPuppyMessage', 3000);*/
				}
				else if(result==0){
					alert("강아지 이름은 반드시 입력해야합니다.");
				}
				else if(result==-2){
					alert("어떤 유저인지 클릭해주세요.");
				}
				else if(result==-10){
					alert("숫자만 넣어야 하는 곳에 문자열이 입력되었습니다.");
				}
				else{
					alert("데이터베이스 오류가 있다.");
				}
				
			},
			error:function(request,status,error){
				  alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			}
			
		});
	
		$('#puppyName').val("");
		$('#puppySpecies').val("");
		$('#puppyAge').val("");
		$('#puppyAgeMonth').val("");
		$('#puppyWeight').val("");
		$('#puppyWeightETC').val("");
		$('#puppyActivity').val(1);
		$('#puppyAge').val("");
		$('#recommendedQuantity').val("");
		$('#puppyAgeMonth').val("");
		$('#puppyAgeETC').val("");
		$('#puppyGender').val(1);
		$('#puppyNeutralization').val(1);
		$('#puppyETC').val("");
		$('#puppyRestrict').val("");
		$('#testDatepicker2').val("");
		$('#weightControl').val(1);
		$('#foodSpecies').val(1);


	}
	
	function searchPuppy(userPrimeNum){
		
		$('#puppyList').empty();
		$('#puppyUserPrimeNum').val("");
		$('#puppyUserPrimeNum').val(userPrimeNum);

		$.ajax({
			type:"POST",
			url:"/PuppyListServlet",
			data : {
				userPrimeNum:userPrimeNum
			},
			success: function(data){
				if(data=="") {
					nullPuppy();
					}
				else{
				var parsed = JSON.parse(data);
				var result = parsed.result;
				for(var i=0; i<result.length; i++){
					addPuppy(result[i][0].value, result[i][1].value,result[i][2].value, result[i][3].value,result[i][4].value, result[i][5].value,result[i][6].value, result[i][7].value, result[i][8].value,result[i][9].value, result[i][10].value, result[i][11].value, result[i][12].value, result[i][13].value, result[i][14].value, result[i][15].value, result[i][16].value, result[i][17].value);	
					
					}
				
				}
			},
			error:function(request,status,error){
				  alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			}
		});
	}
	function nullPuppy(){
		$('#puppyList').append('<p>강아지 정보가 없습니다.</p>');
	}
	function addPuppy(userPrimeNum, puppyPrimeNum, puppyName, puppySpecies, puppyAge, puppyAgeMonth,puppyAgeETC, puppyGender, puppyNeutralization, puppyWeight, puppyWeightETC, puppyActivity,recommendedQuantity, puppyETC, puppyRestrict, paymentDate,weightControl, foodSpecies){
		$('#recipePuppyPrimeNum').val(puppyPrimeNum);
		$('#puppyList').append('<table class="table user-list">' +
				'<tbody>' +
					'<tr>'+
						'<td>'+
							'<p class="user-link" >'+puppyName+'</p>'+
						'</td>'+
						'<td>'+
							'<button type="button" class="btn btn-default" style="width:80px;" onclick="recipeListFunction('+puppyPrimeNum+');">레시피</button>'+
						'</td>'+
						'<td>'+
							'<button type="button" class="btn btn-primary" style="width:80px;" onclick="orderFunction('+puppyPrimeNum+');">주문</button>'+
						'</td>'+
						
						'<td style="width:20%;">'+

		                    '<a href="#" class="table-link">'+
						        '<span class="fa-stack" onclick="updatePuppy('+puppyPrimeNum+',\''+puppyName+'\',\''+puppySpecies+'\','+puppyAge+','+puppyAgeMonth+',\''+puppyAgeETC+'\','+puppyGender+','+puppyNeutralization+','+puppyWeight+',\''+puppyWeightETC+'\','+puppyActivity+','+recommendedQuantity+',\''+puppyETC+'\',\''+puppyRestrict+'\',\''+paymentDate+'\','+weightControl+','+foodSpecies+');">'+
						            '<i class="fa fa-square fa-stack-2x"></i>'+
						            '<i class="fa fa-pencil fa-stack-1x fa-inverse"></i>'+
						       '</span>'+
							'</a>'+
		                    '<a href="#" class="table-link danger">'+
						        '<span class="fa-stack" onclick="deletePuppy('+puppyPrimeNum+','+userPrimeNum+');">'+
						            '<i class="fa fa-square fa-stack-2x"></i>'+
						            '<i class="fa fa-trash-o  fa-stack-1x fa-inverse"></i>'+
						       '</span>'+
							'</a>'+
		                '</td>'+
			        '</tr>'+
			    '</tbody>'+
			'</table>'
		);



	}
	
	function updatePuppy(puppyPrimeNum, puppyName, puppySpecies, puppyAge, puppyAgeMonth, puppyAgeETC, puppyGender, puppyNeutralization, puppyWeight, puppyWeightETC
			, puppyActivity, recommendedQuantity, puppyETC, puppyRestrict, paymentDate,weightControl, foodSpecies){
		
		$('#puppyPuppyPrimeNum').val(puppyPrimeNum);
		$('#puppyName').val(puppyName);
		$('#puppySpecies').val(puppySpecies);
		$('#puppyAge').val(puppyAge);
		$('#puppyAgeMonth').val(puppyAgeMonth);
		$('#puppyAgeETC').val(puppyAgeETC);
		$('#puppyGender').val(puppyGender);
		$('#puppyNeutralization').val(puppyNeutralization);
		$('#puppyWeight').val(puppyWeight);
		$('#puppyWeightETC').val(puppyWeightETC);
		$('#puppyActivity').val(puppyActivity);
		$('#recommendedQuantity').val(recommendedQuantity); 
		$('#puppyETC').val(puppyETC);
		$('#puppyRestrict').val(puppyRestrict);
		$('#testDatepicker2').val(paymentDate);
		$('#weightControl').val(weightControl);
		$('#foodSpecies').val(foodSpecies);

		
		$('#puppyUpdateButton').show();
		$('#puppyRegisterButton').hide();
	}
	
	function updatePuppyFunction(){
		var puppyPrimeNum = $('#puppyPuppyPrimeNum').val();
		var puppyName = $('#puppyName').val();
		var puppySpecies = $('#puppySpecies').val();
		var puppyAge = $('#puppyAge').val();
		var puppyAgeMonth = $('#puppyAgeMonth').val();
		var puppyAgeETC = $('#puppyAgeETC').val();
		var puppyGender = $('#puppyGender').val();
		var puppyNeutralization = $('#puppyNeutralization').val();
		var puppyWeight = $('#puppyWeight').val();
		var puppyWeightETC = $('#puppyWeightETC').val();
		var puppyActivity = $('#puppyActivity').val();
		var puppyETC = $('#puppyETC').val();
		var puppyRestrict = $('#puppyRestrict').val();
		var recommendedQuantity = $('#recommendedQuantity').val();
		var paymentDate = $('#testDatepicker2').val();
		var weightControl = $('#weightControl').val();
		var foodSpecies = $('#foodSpecies').val();

		$.ajax({
			type:"POST",
			url:"/PuppyUpdateServlet",
			data:{
				puppyPrimeNum:puppyPrimeNum,
				puppyName:encodeURIComponent(puppyName),
				puppySpecies:encodeURIComponent(puppySpecies),
				puppyAge:puppyAge,
				puppyAgeMonth:puppyAgeMonth,
				puppyAgeETC:encodeURIComponent(puppyAgeETC),
				puppyGender:puppyGender,
				puppyNeutralization:puppyNeutralization,
				puppyWeight:puppyWeight,
				puppyWeightETC:encodeURIComponent(puppyWeightETC),
				puppyActivity:puppyActivity,
				recommendedQuantity:recommendedQuantity,
				puppyETC:encodeURIComponent(puppyETC),
				puppyRestrict:encodeURIComponent(puppyRestrict),
				paymentDate:paymentDate,
				weightControl:weightControl,
				foodSpecies:foodSpecies
			},
			success: function(result){
				if(result==1){
					$('#puppyName').val("");
					$('#puppySpecies').val("");
					$('#puppyAge').val("");
					$('#puppyAgeMonth').val("");
					$('#puppyWeight').val("");
					$('#puppyWeightETC').val("");
					$('#puppyActivity').val(1);
					$('#puppyAge').val("");
					$('#recommendedQuantity').val("");
					$('#puppyAgeMonth').val("");
					$('#puppyAgeETC').val("");
					$('#puppyGender').val(1);
					$('#puppyNeutralization').val(1);
					$('#puppyETC').val("");
					$('#puppyRestrict').val("");
					$('#testDatepicker2').val("");
					$('#weightControl').val(1);
					$('#foodSpecies').val(1);

					$('#puppyUpdateButton').hide();
					$('#puppyRegisterButton').show();
					alert("수정 성공");
				}
				else if(result==0){
					alert("빈칸이 있다.");
				}
				else if(result==-10){
					alert("숫자만 넣어야 하는 곳에 문자열이 입력되었습니다.");
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
	function deletePuppy(puppyPrimeNum , userPrimeNum){
		msg = "진짜 삭제하시겠습니까?";
		if(confirm(msg)!=0){
			$.ajax({
				type:"POST",
				url:"/PuppyDeleteServlet",
				data:{
					puppyPrimeNum:puppyPrimeNum,
				},
				success: function(result){
					if(result==1){
						alert("삭제 성공");
						searchPuppy(userPrimeNum);
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
	
/* 	function recipeRegister(){
		
	} */
 	function orderFunction(puppyPrimeNum){
		
		$('#orderAdmin').css('display','inline-block');
		$('#recipeAdmin').css('display','none');
		$('#orderList').empty();
		
		$('#orderPuppyPrimeNum').val("");
		$('#orderPuppyPrimeNum').val(puppyPrimeNum);
		$('#puppyRecipePrimeNum').val(0);
		$('#originalRecipePrimeNum').val(0);
		$('#seniorRecipePrimeNum').val(0);
		$('#fishRecipePrimeNum').val(0);
		$('#porkRecipePrimeNum').val(0);
		$('#kangarooRecipePrimeNum').val(0);
		$('#horseRecipePrimeNum').val(0);
		document.getElementsByName("orderProductPuppyGram")[0].value = "";
		document.getElementsByName("orderProductPuppyNum")[0].value = "";
		document.getElementsByName("orderProductOriginalGram")[0].value = "" ;
		document.getElementsByName("orderProductOriginalNum")[0].value = "";
		document.getElementsByName("orderProductSeniorGram")[0].value = "";
		document.getElementsByName("orderProductSeniorNum")[0].value = "";
		document.getElementsByName("orderProductFishGram")[0].value = "";
		document.getElementsByName("orderProductFishNum")[0].value = "";
		document.getElementsByName("orderProductPorkGram")[0].value = "";
		document.getElementsByName("orderProductPorkNum")[0].value = "";
		document.getElementsByName("orderProductKangarooGram")[0].value = "";
		document.getElementsByName("orderProductKangarooNum")[0].value = "";
		document.getElementsByName("orderProductHorseGram")[0].value = "";
		document.getElementsByName("orderProductHorseNum")[0].value = "";
		$('#totalQuantity').val("");
		$('#totalPrice').val("");
		$('#orderETC').val("");
		$('#testDatepicker').val("");
		$('#orderPack').val(1);
		$('#orderRoundTitle').val("");
		$('#orderTitle').val("");
		 
		$('#puppyRecipePrimeNum').next().remove();
		$('#puppyRecipePrimeNum').after(
				'<input type="button" class="btn btn-primary" value="레시피 선택" onclick="openRecipeSelect('+puppyPrimeNum+',1)">'
		);
		$('#originalRecipePrimeNum').next().remove();
		$('#originalRecipePrimeNum').after(
				'<input type="button" class="btn btn-primary" value="레시피 선택" onclick="openRecipeSelect('+puppyPrimeNum+',2)">'
		);
		$('#seniorRecipePrimeNum').next().remove();
		$('#seniorRecipePrimeNum').after(
				'<input type="button" class="btn btn-primary"value="레시피 선택" onclick="openRecipeSelect('+puppyPrimeNum+',3)">'
		);
		$('#fishRecipePrimeNum').next().remove();
		$('#fishRecipePrimeNum').after(
				'<input type="button" class="btn btn-primary" value="레시피 선택" onclick="openRecipeSelect('+puppyPrimeNum+',4)">'
		);

		$('#porkRecipePrimeNum').next().remove();
		$('#porkRecipePrimeNum').after(
				'<input type="button" class="btn btn-primary" value="레시피 선택" onclick="openRecipeSelect('+puppyPrimeNum+',5)">'
		);
		$('#kangarooRecipePrimeNum').next().remove();
		$('#kangarooRecipePrimeNum').after(
				'<input type="button" class="btn btn-primary" value="레시피 선택" onclick="openRecipeSelect('+puppyPrimeNum+',6)">'
		);
		$('#horseRecipePrimeNum').next().remove();
		$('#horseRecipePrimeNum').after(
				'<input type="button" class="btn btn-primary" value="레시피 선택" onclick="openRecipeSelect('+puppyPrimeNum+',7)">'
		);
		$.ajax({
			type:"POST",
			url:"/OrderListServlet",
			data : {
				puppyPrimeNum:puppyPrimeNum
			},
			success: function(data){
				if(data=="") {
					nullOrder();
				}
				else{
					var parsed = JSON.parse(data);
					var result = parsed.result;
					for(var i=0; i<result.length; i++){
						addOrder(result[i][0].value,result[i][1].value,result[i][2].value,result[i][3].value,result[i][4].value,
								result[i][5].value,result[i][6].value,result[i][7].value,result[i][8].value,result[i][9].value,
								result[i][10].value,result[i][11].value,result[i][12].value,result[i][13].value,result[i][14].value,
								result[i][15].value,result[i][16].value,result[i][17].value,result[i][18].value,result[i][19].value,
								result[i][20].value,result[i][21].value,result[i][22].value,result[i][23].value,result[i][24].value,
								result[i][25].value,result[i][26].value,result[i][27].value,result[i][28].value,result[i][29].value,
								result[i][30].value,result[i][31].value,result[i][32].value,result[i][33].value,result[i][34].value,
								result[i][35].value,result[i][36].value,result[i][37].value,result[i][38].value,result[i][39].value,
								result[i][40].value);	
						
					}
				}

			},
			error:function(request,status,error){
				  alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			}
		});
		
	}
	function nullOrder(){
		$('#orderList').append('<p>주문 기록이 없습니다.</p>');
	}
	function addOrder(roundPrimeNum, orderPrimeNum, userPrimeNum,  puppyPrimeNum, 
			 orderBoxNum,puppyGram, puppyNum, 
			 originalGram,  originalNum,
			 seniorGram,  seniorNum,  fishGram,
			 fishNum,
			 porkGram, porkNum,  kangarooGram, 
			 kangarooNum,  horseGram,  horseNum, 
			 orderProductPuppyAvailable, orderProductOriginalAvailable,  orderProductSeniorAvailable, 
			 orderProductFishAvailable,  orderProductPorkAvailable,  orderProductKangarooAvailable, 
			 orderProductHorseAvailable, 
			 puppyRecipePrimeNum,
			 originalRecipePrimeNum,
			 seniorRecipePrimeNum ,
			 fishRecipePrimeNum ,
			 porkRecipePrimeNum,
			 kangarooRecipePrimeNum,
			 horseRecipePrimeNum ,
			 totalQuantity, totalPrice, 
			 orderETC,  orderPack,dueDate, roundTitle, dueDateAvailable, orderTitle){
		$('#orderList').append('<table class="table order-list">' +
				'<tbody>' +
					'<tr>'+
						'<td>'+
							'<p style="" >'+ roundTitle +'</p>'+
						'</td>'+
						'<td style="width:20%;">'+
		                    '<a href="#" class="table-link">'+
						        '<span class="fa-stack" onclick="updateOrder('+roundPrimeNum+','+ orderPrimeNum+','+ userPrimeNum+','+puppyPrimeNum+','+
			 orderBoxNum+','+puppyGram+','+ puppyNum+','+originalGram+','+originalNum+','+seniorGram+','+seniorNum+','+fishGram+','+
			 fishNum+','+porkGram+','+ porkNum+','+ kangarooGram+','+ kangarooNum+','+horseGram+','+horseNum+',' +
			 orderProductPuppyAvailable+','+ orderProductOriginalAvailable+','+ orderProductSeniorAvailable+','+
			 orderProductFishAvailable+','+  orderProductPorkAvailable+','+orderProductKangarooAvailable+','+
			 orderProductHorseAvailable+','+ puppyRecipePrimeNum+','+originalRecipePrimeNum+','+seniorRecipePrimeNum+','+
			 fishRecipePrimeNum+' ,'+porkRecipePrimeNum+','+kangarooRecipePrimeNum+','+horseRecipePrimeNum+','+
			 totalQuantity+','+ totalPrice+',\''+orderETC+'\','+orderPack+',\''+dueDate+'\',\''+ roundTitle+'\','+dueDateAvailable+',\''+orderTitle+'\');">'+
						            '<i class="fa fa-square fa-stack-2x"></i>'+
						            '<i class="fa fa-pencil fa-stack-1x fa-inverse"></i>'+
						       '</span>'+
							'</a>'+
		                    '<a href="#" class="table-link  danger">'+
						        '<span class="fa-stack" onclick="deleteOrder('+orderPrimeNum+')">'+
						            '<i class="fa fa-square fa-stack-2x"></i>'+
						            '<i class="fa fa-trash-o  fa-stack-1x fa-inverse"></i>'+
						       '</span>'+
							'</a>'+
		                '</td>'+
			        '</tr>'+
			    '</tbody>'+
			'</table>'
			)

	}
	
	function addOrderFunction()
	{				
		var roundPrimeNum = $('#orderRoundPrimeNum').val();
		var userPrimeNum = $('#puppyUserPrimeNum').val();
		var puppyPrimeNum = $('#orderPuppyPrimeNum').val();
		var puppyRecipePrimeNum = $('#puppyRecipePrimeNum').val();
		var originalRecipePrimeNum = $('#originalRecipePrimeNum').val();
		var seniorRecipePrimeNum = $('#seniorRecipePrimeNum').val();
		var fishRecipePrimeNum = $('#fishRecipePrimeNum').val();
		var porkRecipePrimeNum = $('#porkRecipePrimeNum').val();
		var kangarooRecipePrimeNum = $('#kangarooRecipePrimeNum').val();
		var horseRecipePrimeNum = $('#horseRecipePrimeNum').val();
		var puppyGram = document.getElementsByName("orderProductPuppyGram")[0].value;
		var puppyNum = document.getElementsByName("orderProductPuppyNum")[0].value;
		var originalGram = document.getElementsByName("orderProductOriginalGram")[0].value;
		var originalNum = document.getElementsByName("orderProductOriginalNum")[0].value;
		var seniorGram = document.getElementsByName("orderProductSeniorGram")[0].value;
		var seniorNum = document.getElementsByName("orderProductSeniorNum")[0].value;
		var fishGram = document.getElementsByName("orderProductFishGram")[0].value;
		var fishNum = document.getElementsByName("orderProductFishNum")[0].value;
		var porkGram = document.getElementsByName("orderProductPorkGram")[0].value;
		var porkNum = document.getElementsByName("orderProductPorkNum")[0].value;
		var kangarooGram = document.getElementsByName("orderProductKangarooGram")[0].value;
		var kangarooNum = document.getElementsByName("orderProductKangarooNum")[0].value;
		var horseGram = document.getElementsByName("orderProductHorseGram")[0].value;
		var horseNum = document.getElementsByName("orderProductHorseNum")[0].value;
		var orderProductPuppyAvailable = $('input[name="orderProductPuppyAvailable"]:checked').val();
		var orderProductOriginalAvailable = $('input[name="orderProductOriginalAvailable"]:checked').val();
		var orderProductSeniorAvailable = $('input[name="orderProductSeniorAvailable"]:checked').val();
		var orderProductFishAvailable = $('input[name="orderProductFishAvailable"]:checked').val();
		var orderProductPorkAvailable = $('input[name="orderProductPorkAvailable"]:checked').val();
		var orderProductKangarooAvailable = $('input[name="orderProductKangarooAvailable"]:checked').val();
		var orderProductHorseAvailable = $('input[name="orderProductHorseAvailable"]:checked').val();
		var totalQuantity = $('#totalQuantity').val();
		var totalPrice = $('#totalPrice').val();
		var orderETC = $('#orderETC').val();
		var dueDate = $('#testDatepicker').val();
		var orderPack = $('#orderPack').val();
		var roundTitle = $('#orderRoundTitle').val();
		var orderTitle = document.getElementById('orderTitle').value;
		
		$.ajax({
			type:"POST",
			url:"/OrderRegisterServlet",
			data:{
				roundPrimeNum:roundPrimeNum,
				userPrimeNum:userPrimeNum,
				puppyPrimeNum:puppyPrimeNum,
				puppyRecipePrimeNum:puppyRecipePrimeNum,
				originalRecipePrimeNum:originalRecipePrimeNum,
				seniorRecipePrimeNum:seniorRecipePrimeNum,
				fishRecipePrimeNum:fishRecipePrimeNum,
				porkRecipePrimeNum:porkRecipePrimeNum,
				kangarooRecipePrimeNum:kangarooRecipePrimeNum,
				horseRecipePrimeNum:horseRecipePrimeNum,
				puppyGram:puppyGram,
				puppyNum:puppyNum,
				originalGram:originalGram,
				originalNum:originalNum,
				seniorNum:seniorNum,
				seniorGram:seniorGram,
				fishNum:fishNum,
				fishGram:fishGram,
				porkNum:porkNum,
				porkGram:porkGram,
				kangarooNum:kangarooNum,
				kangarooGram:kangarooGram,
				horseNum:horseNum,
				horseGram:horseGram,
				orderProductPuppyAvailable:orderProductPuppyAvailable,
				orderProductOriginalAvailable:orderProductOriginalAvailable,
				orderProductSeniorAvailable:orderProductSeniorAvailable,
				orderProductFishAvailable:orderProductFishAvailable,
				orderProductPorkAvailable:orderProductPorkAvailable,
				orderProductKangarooAvailable:orderProductKangarooAvailable,
				orderProductHorseAvailable:orderProductHorseAvailable,
				totalQuantity:totalQuantity,
				totalPrice:totalPrice,
				orderETC:encodeURIComponent(orderETC),
				orderPack:orderPack,
				dueDate:dueDate,
				roundTitle:encodeURIComponent(roundTitle),
				orderTitle:encodeURIComponent(orderTitle)
			},
			
			success: function(result){

				if(result==1){
					alert("주문 추가 성공"+result);
					
				}
				else if(result==0){
					alert("빈칸이 있다.");
				}
				else if(result==-10){
					alert("숫자만 넣어야 하는 곳에 문자열이 입력되었습니다.");
				}
				else{
					alert("데이터베이스 오류가 있다." + result);
				}
			},
			error:function(request,status,error){
				  alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			}
			
		});
	
	}
	function updateOrder(roundPrimeNum, orderPrimeNum, userPrimeNum,  puppyPrimeNum, 
			 orderBoxNum,puppyGram, puppyNum, 
			 originalGram,  originalNum,
			 seniorGram,  seniorNum,  fishGram,
			 fishNum,
			 porkGram, porkNum,  kangarooGram, 
			 kangarooNum,  horseGram,  horseNum, 
			 orderProductPuppyAvailable, orderProductOriginalAvailable,  orderProductSeniorAvailable, 
			 orderProductFishAvailable,  orderProductPorkAvailable,  orderProductKangarooAvailable, 
			 orderProductHorseAvailable, 
			 puppyRecipePrimeNum,
			 originalRecipePrimeNum,
			 seniorRecipePrimeNum ,
			 fishRecipePrimeNum ,
			 porkRecipePrimeNum,
			 kangarooRecipePrimeNum,
			 horseRecipePrimeNum ,
			 totalQuantity, totalPrice, 
			 orderETC,  orderPack,dueDate, roundTitle, dueDateAvailable, orderTitle){
		$('#orderOrderPrimeNum').val(orderPrimeNum);
		$('#orderRoundPrimeNum').val(roundPrimeNum);
		$('#puppyUserPrimeNum').val(userPrimeNum);
		$('#orderPuppyPrimeNum').val(puppyPrimeNum);
		$('#puppyRecipePrimeNum').val(puppyRecipePrimeNum);
		$('#originalRecipePrimeNum').val(originalRecipePrimeNum);
		$('#seniorRecipePrimeNum').val(seniorRecipePrimeNum);
		$('#fishRecipePrimeNum').val(fishRecipePrimeNum);
		$('#porkRecipePrimeNum').val(porkRecipePrimeNum);
		$('#kangarooRecipePrimeNum').val(kangarooRecipePrimeNum);
		$('#horseRecipePrimeNum').val(horseRecipePrimeNum);
		document.getElementsByName("orderProductPuppyGram")[0].value = puppyGram;
		document.getElementsByName("orderProductPuppyNum")[0].value = puppyNum;
		document.getElementsByName("orderProductOriginalGram")[0].value = originalGram ;
		document.getElementsByName("orderProductOriginalNum")[0].value = originalNum;
		document.getElementsByName("orderProductSeniorGram")[0].value = seniorGram;
		document.getElementsByName("orderProductSeniorNum")[0].value = seniorNum;
		document.getElementsByName("orderProductFishGram")[0].value = fishGram;
		document.getElementsByName("orderProductFishNum")[0].value = fishNum;
		document.getElementsByName("orderProductPorkGram")[0].value = porkGram;
		document.getElementsByName("orderProductPorkNum")[0].value = porkNum;
		document.getElementsByName("orderProductKangarooGram")[0].value = kangarooGram;
		document.getElementsByName("orderProductKangarooNum")[0].value = kangarooNum;
		document.getElementsByName("orderProductHorseGram")[0].value = horseGram;
		document.getElementsByName("orderProductHorseNum")[0].value = horseNum;
		$('input[name="orderProductPuppyAvailable"]:checked').val(orderProductPuppyAvailable);
		$('input[name="orderProductOriginalAvailable"]:checked').val(orderProductOriginalAvailable);
		$('input[name="orderProductSeniorAvailable"]:checked').val(orderProductSeniorAvailable);
		$('input[name="orderProductFishAvailable"]:checked').val(orderProductFishAvailable);
		$('input[name="orderProductPorkAvailable"]:checked').val(orderProductPorkAvailable);
		$('input[name="orderProductKangarooAvailable"]:checked').val(orderProductKangarooAvailable);
		$('input[name="orderProductHorseAvailable"]:checked').val(orderProductHorseAvailable);
		$('#totalQuantity').val(totalQuantity);
		$('#totalPrice').val(totalPrice);
		$('#orderETC').val(orderETC);
		$('#testDatepicker').val(dueDate);
		$('#orderPack').val(orderPack);
		 $('#orderRoundTitle').val(roundTitle);
		 $('#orderTitle').val(orderTitle);
		 
		$('#orderUpdateButton').show();
		$('#orderRegisterButton').hide();
	}
	function updateOrderFunction(){
		var orderPrimeNum = $('#orderOrderPrimeNum').val();
		var roundPrimeNum = $('#orderRoundPrimeNum').val();
		var userPrimeNum = $('#puppyUserPrimeNum').val();
		var puppyPrimeNum = $('#orderPuppyPrimeNum').val();
		var puppyRecipePrimeNum = $('#puppyRecipePrimeNum').val();
		var originalRecipePrimeNum = $('#originalRecipePrimeNum').val();
		var seniorRecipePrimeNum = $('#seniorRecipePrimeNum').val();
		var fishRecipePrimeNum = $('#fishRecipePrimeNum').val();
		var porkRecipePrimeNum = $('#porkRecipePrimeNum').val();
		var kangarooRecipePrimeNum = $('#kangarooRecipePrimeNum').val();
		var horseRecipePrimeNum = $('#horseRecipePrimeNum').val();
		var puppyGram = document.getElementsByName("orderProductPuppyGram")[0].value;
		var puppyNum = document.getElementsByName("orderProductPuppyNum")[0].value;
		var originalGram = document.getElementsByName("orderProductOriginalGram")[0].value;
		var originalNum = document.getElementsByName("orderProductOriginalNum")[0].value;
		var seniorGram = document.getElementsByName("orderProductSeniorGram")[0].value;
		var seniorNum = document.getElementsByName("orderProductSeniorNum")[0].value;
		var fishGram = document.getElementsByName("orderProductFishGram")[0].value;
		var fishNum = document.getElementsByName("orderProductFishNum")[0].value;
		var porkGram = document.getElementsByName("orderProductPorkGram")[0].value;
		var porkNum = document.getElementsByName("orderProductPorkNum")[0].value;
		var kangarooGram = document.getElementsByName("orderProductKangarooGram")[0].value;
		var kangarooNum = document.getElementsByName("orderProductKangarooNum")[0].value;
		var horseGram = document.getElementsByName("orderProductHorseGram")[0].value;
		var horseNum = document.getElementsByName("orderProductHorseNum")[0].value;
		var orderProductPuppyAvailable = $('input[name="orderProductPuppyAvailable"]:checked').val();
		var orderProductOriginalAvailable = $('input[name="orderProductOriginalAvailable"]:checked').val();
		var orderProductSeniorAvailable = $('input[name="orderProductSeniorAvailable"]:checked').val();
		var orderProductFishAvailable = $('input[name="orderProductFishAvailable"]:checked').val();
		var orderProductPorkAvailable = $('input[name="orderProductPorkAvailable"]:checked').val();
		var orderProductKangarooAvailable = $('input[name="orderProductKangarooAvailable"]:checked').val();
		var orderProductHorseAvailable = $('input[name="orderProductHorseAvailable"]:checked').val();
		var totalQuantity = $('#totalQuantity').val();
		var totalPrice = $('#totalPrice').val();
		var orderETC = $('#orderETC').val();
		var dueDate = $('#testDatepicker').val();
		var orderPack = $('#orderPack').val();
		var orderRoundTitle = $('#orderRoundTitle').val();
		var orderTitle = document.getElementById('orderTitle').value;
		$.ajax({
			type:"POST",
			url:"/OrderUpdateServlet",
			data:{
				orderPrimeNum:orderPrimeNum,
				roundPrimeNum:roundPrimeNum,
				userPrimeNum:userPrimeNum,
				puppyPrimeNum:puppyPrimeNum,
				puppyRecipePrimeNum:puppyRecipePrimeNum,
				originalRecipePrimeNum:originalRecipePrimeNum,
				seniorRecipePrimeNum:seniorRecipePrimeNum,
				fishRecipePrimeNum:fishRecipePrimeNum,
				porkRecipePrimeNum:porkRecipePrimeNum,
				kangarooRecipePrimeNum:kangarooRecipePrimeNum,
				horseRecipePrimeNum:horseRecipePrimeNum,
				puppyGram:puppyGram,
				puppyNum:puppyNum,
				originalGram:originalGram,
				originalNum:originalNum,
				seniorNum:seniorNum,
				seniorGram:seniorGram,
				fishNum:fishNum,
				fishGram:fishGram,
				porkNum:porkNum,
				porkGram:porkGram,
				kangarooNum:kangarooNum,
				kangarooGram:kangarooGram,
				horseNum:horseNum,
				horseGram:horseGram,
				orderProductPuppyAvailable:orderProductPuppyAvailable,
				orderProductOriginalAvailable:orderProductOriginalAvailable,
				orderProductSeniorAvailable:orderProductSeniorAvailable,
				orderProductFishAvailable:orderProductFishAvailable,
				orderProductPorkAvailable:orderProductPorkAvailable,
				orderProductKangarooAvailable:orderProductKangarooAvailable,
				orderProductHorseAvailable:orderProductHorseAvailable,
				totalQuantity:totalQuantity,
				totalPrice:totalPrice,
				orderETC:encodeURIComponent(orderETC),
				orderPack:orderPack,
				dueDate:encodeURIComponent(dueDate),
				roundTitle:encodeURIComponent(orderRoundTitle),
				orderTitle:encodeURIComponent(orderTitle)

			},
			success: function(result){
				if(result==1){
					$('#orderOrderPrimeNum').val("");
					$('#orderRoundPrimeNum').val("");
					$('#puppyUserPrimeNum').val("");
					$('#orderPuppyPrimeNum').val("");
					document.getElementsByName("orderProductPuppyGram")[0].value = "";
					document.getElementsByName("orderProductPuppyNum")[0].value = "";
					document.getElementsByName("orderProductOriginalGram")[0].value = "" ;
					document.getElementsByName("orderProductOriginalNum")[0].value = "";
					document.getElementsByName("orderProductSeniorGram")[0].value = "";
					document.getElementsByName("orderProductSeniorNum")[0].value = "";
					document.getElementsByName("orderProductFishGram")[0].value = "";
					document.getElementsByName("orderProductFishNum")[0].value = "";
					document.getElementsByName("orderProductPorkGram")[0].value = "";
					document.getElementsByName("orderProductPorkNum")[0].value = "";
					document.getElementsByName("orderProductKangarooGram")[0].value = "";
					document.getElementsByName("orderProductKangarooNum")[0].value = "";
					document.getElementsByName("orderProductHorseGram")[0].value = "";
					document.getElementsByName("orderProductHorseNum")[0].value = "";
					$('#totalQuantity').val("");
					$('#totalPrice').val("");
					$('#orderETC').val("");
					$('#testDatepicker').val("");
					$('#orderPack').val(1);
					 $('#orderRoundTitle').val("");
					 $('#orderTitle').val("");
					 
					$('#orderUpdateButton').hide();
					$('#orderRegisterButton').show();
					alert("수정 성공");
				}
				else if(result==0){
					alert("빈칸이 있다.");
				}
				else if(result==-10){
					alert("숫자만 넣어야 하는 곳에 문자열이 입력되었습니다.");
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
	function deleteOrder(orderPrimeNum){
		msg = "진짜 삭제하시겠습니까?";
		if(confirm(msg)!=0){
			$.ajax({
				type:"POST",
				url:"/OrderDeleteServlet",
				data:{
					orderPrimeNum:orderPrimeNum,
				},
				success: function(result){
					if(result==1){
						alert("삭제 성공");
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
 	function recipeListFunction(puppyPrimeNum){

 		$('#orderAdmin').css('display','none');
		$('#recipeAdmin').css('display','inline-block');
		$('#recipeList').empty();
		console.log("나와?이거 첫번");

		$.ajax({
			type:"POST",
			url:"/RecipeListServlet",
			data : {
				puppyPrimeNum:puppyPrimeNum
			},
			success: function(data){
				if(data==""){
					nullRecipe();
				}
				else{
					var parsed = JSON.parse(data);
					var result = parsed.result;
					for(var i=0; i<result.length; i++){
						addRecipeList(result[i][0].value, result[i][1].value, result[i][5].value, result[i][2].value
								);	
					}
				}
			},
			error:function(request,status,error){ 
				  alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			}
		});
		
	}
	function nullRecipe(){
		$('#recipeList').append('<p>레시피 기록이 없습니다.</p>');
	}
	function addRecipeList(recipePrimeNum, puppyPrimeNum, recipeDate, productName){
		$('#recipeList').append('<table class="table recipe-list">' +
				'<tbody>' +
					'<tr>'+
						'<td>'+
							'<p style="" onclick="recipeAdminFunction('+recipePrimeNum+');" >'+ productName +'</p>'+
						'</td>'+
						
						'<td>'+
							'<p style="" >'+ recipeDate +'</p>'+
						'</td>'+
						'<td style="width:20%;">'+
/* 		                    '<a href="#" class="table-link">'+
						        '<span class="fa-stack">'+
						            '<i class="fa fa-square fa-stack-2x"></i>'+
						            '<i class="fa fa-search-plus fa-stack-1x fa-inverse"></i>'+
						       '</span>'+
	   						'</a>'+
		                    '<a href="#" class="table-link">'+
						        '<span class="fa-stack">'+
						            '<i class="fa fa-square fa-stack-2x"></i>'+
						            '<i class="fa fa-pencil fa-stack-1x fa-inverse"></i>'+
						       '</span>'+
							'</a>'+
		                    '<a href="#" class="table-link  danger">'+
						        '<span class="fa-stack">'+
						            '<i class="fa fa-square fa-stack-2x"></i>'+
						            '<i class="fa fa-trash-o  fa-stack-1x fa-inverse"></i>'+
						       '</span>'+
							'</a>'+ */
		                '</td>'+
			        '</tr>'+
			    '</tbody>'+
			'</table>'
			);
			

	}
 	function recipeAdminFunction(recipePrimeNum){
		
		$('#recipeIngredientAdmin').empty();
		$('#recipeRecipePrimeNum').val(recipePrimeNum);
		$.ajax({
			type:"POST",
			url:"/RecipeAdminServlet",
			data : {
				recipePrimeNum:recipePrimeNum
			},
			success: function(data){
				if(data=="") return;
				var parsed = JSON.parse(data);
				var result = parsed.result;
				for(var i=0; i<result.length; i++){
					addRecipeAdmin(result[i][0].value, result[i][1].value, result[i][2].value, result[i][4].value
							);	
				}
			},
			error:function(request,status,error){ 
				  alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			}
		});
	}
 	
 	function addRecipeAdmin(productPrimeNum, ingredientPrimeNum, rawIngredient, mixRate){
 		$('#recipeIngredientAdmin').append(
 				'<tr>'+
 					'<td style="display:inline-block; width:30%;">'+
	 					'<input disabled name="rawIngredient" value="'+rawIngredient+'">'+
	 				'</td>'+
					'<td>'+
						'<input type="text" class="form-control" name="mixRate" value="'+mixRate+'"  /> '+
						'<input type="hidden" name="ingredientPrimeNum" value="'+ingredientPrimeNum+'">'+
					'</td>'+
				'</tr>'
 		);
 		
 		
 	}
 	
 	
 	function updateRecipe(){
 		
 		var rawIngredientLength = $("input[name='rawIngredient']").length;
 		var mixRateLength = $("input[name='mixRate']").length;
 		var ingredientPrimeNumLength = $("input[name='ingredientPrimeNum']").length;
		var rawIngredient= new Array(rawIngredientLength);
		var mixRate= new Array(mixRateLength);
		var ingredientPrimeNum= new Array(ingredientPrimeNumLength);

		var recipePrimeNum = $('#recipeRecipePrimeNum').val();
		
		
		for(var i=0; i<rawIngredientLength; i++){
			rawIngredient[i] =$("input[name='rawIngredient']")[i].value;
			mixRate[i] =$("input[name='mixRate']")[i].value;
			ingredientPrimeNum[i] =$("input[name='ingredientPrimeNum']")[i].value;
		}
		
		
		jQuery.ajaxSettings.traditional = true;
		console.log(rawIngredientLength + ","+mixRateLength+","+ingredientPrimeNumLength );

		$.ajax({
			type:"POST",
			url:"/RecipeUpdateServlet",
			data:{
				
				rawIngredient:rawIngredient,
				mixRate:mixRate,
				ingredientPrimeNum:ingredientPrimeNum,
				recipePrimeNum:recipePrimeNum

			},
			
			success: function(result){
 				if(result==1){
					alert("수정 성공");
 				}
				else if(result==0){
					alert("빈칸이 있다." + result);
				}
				else if(result==-10){
					alert("숫자만 넣어야 하는 곳에 문자열이 입력되었습니다.");
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
 	
 	
 	function addIngredientFunction(){
 		var puppyPrimeNum = $('#recipePuppyPrimeNum').val();
 		var recipePrimeNum = $('#recipeRecipePrimeNum').val();

 	    window.open("ingredientAdd.jsp?puppyPrimeNum="+puppyPrimeNum+"&recipePrimeNum="+recipePrimeNum, "newWindow", "width=1500, height=400, scrollbar=no");

 	} 
 	
 	function addRecipeFunction(){
 		var puppyPrimeNum = document.getElementById("recipePuppyPrimeNum").value;
 	    window.open("puppyRecipeAdminBridge.jsp?puppyPrimeNum="+puppyPrimeNum, "newWindow", "width=700, height=400, scrollbar=no");
 	} 
 	
	var newWindow;
	function openNewWindow(){
	/*     var data = document.querySelector('#OrderInsertUserName').value;
	 */    window.open("orderRoundCheck.jsp" , "newWindow", "width=300, height=400, scrollbar=no");
	}

	function openRecipeSelect(puppyPrimeNum, productNum){
		   window.open("recipeSelect.jsp?puppyPrimeNum="+puppyPrimeNum+"&productNum="+productNum, "newWindow", "width=300, height=400, scrollbar=no");

	}
	function calculateQuantity(){
		var puppyAge = $('#puppyAge').val();
		var puppyAgeMonth = $('#puppyAgeMonth').val();
		var puppyGender = $('#puppyGender').val();
		var puppyNeutralization = $('#puppyNeutralization').val();
		var puppyWeight = $('#puppyWeight').val();
		var puppyActivity = $('#puppyActivity').val();
		var weightControl = $('#weightControl').val();
		var foodSpecies = $('#foodSpecies').val();

		if(puppyAge == null || puppyAgeMonth == null || puppyGender == null || puppyNeutralization == null || puppyWeight == null||
				puppyActivity == null || weightControl == null ||
				puppyAge == "" || puppyAgeMonth == "" || puppyGender == "" || puppyNeutralization == "" || puppyWeight == ""||
				puppyActivity == "" || weightControl == ""
		){
			alert("계산을 하는데 채워지지 않은 빈칸이 있습니다.");
			return;
		}
		
		puppyAge = Number(puppyAge);
		puppyAgeMonth = Number(puppyAgeMonth);
		puppyWeight = Number(puppyWeight);
		
		if(!Number.isInteger(puppyAge)){	
			alert("강아지 나이에는 정수값을 넣어야 합니다.");
		}
		if(!Number.isInteger(puppyAgeMonth)){
			alert("강아지 나이(개월)에는 정수값을 넣어야 합니다.");
		}

		

		else{
			var RER = 70 * Math.pow(puppyWeight, 0.75);
			var N = 0;
			
			if(puppyAge == 0 && (puppyAgeMonth>=1 && puppyAgeMonth<=3)){
				N = 3;
				if(puppyNeutralization == 1){
					N = N * 0.9;
					if(puppyActivity == 1){
						N = N * 1.2;
					}
					else if(puppyActivity == 2){
						N = N * 1.1;
					}
					else if(puppyActivity == 3){
						N = N * 0.8;
					}
					else if(puppyActivity== 4 || puppyActivity == 5){
						N = N * 0.7;
					}
				}
				else{
					if(puppyActivity == 1){
						N = N * 1.2;
					}
					else if(puppyActivity == 2){
						N = N * 1.1;
					}
					else if(puppyActivity == 3){
						N = N * 0.8;
					}
					else if(puppyActivity== 4 || puppyActivity == 5){
						N = N * 0.7;
					}
				}
			}
			else if(puppyAge == 0 && (puppyAgeMonth>=4 && puppyAgeMonth<=6)){
				N = 2.5;
				if(puppyNeutralization == 1){
					N = N * 0.9;
					if(puppyActivity == 1){
						N = N * 1.2;
					}
					else if(puppyActivity == 2){
						N = N * 1.1;
					}
					else if(puppyActivity == 3){
						N = N * 0.8;
					}
					else if(puppyActivity== 4 || puppyActivity == 5){
						N = N * 0.7;
					}
				}
				else{
					if(puppyActivity == 1){
						N = N * 1.2;
					}
					else if(puppyActivity == 2){
						N = N * 1.1;
					}
					else if(puppyActivity == 3){
						N = N * 0.8;
					}
					else if(puppyActivity== 4 || puppyActivity == 5){
						N = N * 0.7;
					}
				}
			}
			else if(puppyAge == 0 && (puppyAgeMonth>6 && puppyAgeMonth<=12)){
				N=2;
				if(puppyNeutralization == 1){
					N = N * 0.9;
					if(puppyActivity == 1){
						N = N * 1.2;
					}
					else if(puppyActivity == 2){
						N = N * 1.1;
					}
					else if(puppyActivity == 3){
						N = N * 0.8;
					}
					else if(puppyActivity== 4 || puppyActivity == 5){
						N = N * 0.7;
					}
				}
				else{
					if(puppyActivity == 1){
						N = N * 1.2;
					}
					else if(puppyActivity == 2){
						N = N * 1.1;
					}
					else if(puppyActivity == 3){
						N = N * 0.8;
					}
					else if(puppyActivity== 4 || puppyActivity == 5){
						N = N * 0.7;
					}
				}
			}
			else if(puppyAge>=1 && puppyAge<8){
				if(weightControl==1){
					N = 1;
				}
				else{
					if(puppyNeutralization == 1){
						N = 1.8 * 0.9;
						if(puppyActivity == 1){
							N = N * 1.2;
						}
						else if(puppyActivity == 2){
							N = N * 1.1;
						}
						else if(puppyActivity == 3){
							N = N * 0.8;
						}
						else if(puppyActivity== 4 || puppyActivity == 5){
							N = N * 0.7;
						}
					}
					else{
						N = 1.8;
						if(puppyActivity == 1){
							N = N * 1.2;
						}
						else if(puppyActivity == 2){
							N = N * 1.1;
						}
						else if(puppyActivity == 3){
							N = N * 0.8;
						}
						else if(puppyActivity== 4 || puppyActivity == 5){
							N = N * 0.7;
						}
					}
				}
			}
			else if(puppyAge>8){
				N = 1.1;
			}

			var recommendedQuantity = RER * N;
			
			
			if(foodSpecies == 1){
				recommendedQuantity = recommendedQuantity / 129 * 100;
			}
			else if(foodSpecies == 2){
				recommendedQuantity = recommendedQuantity / 124 * 100;

			}
			else if(foodSpecies == 3){
				recommendedQuantity = recommendedQuantity / 126 * 100;

			}
			else if(foodSpecies == 4){
				recommendedQuantity = recommendedQuantity / 112 * 100;

			}
			else if(foodSpecies == 5){
				recommendedQuantity = recommendedQuantity / 136 * 100;

			}
			else if(foodSpecies == 6){
				recommendedQuantity = recommendedQuantity / 120 * 100;

			}
			else if(foodSpecies == 7){
				recommendedQuantity = recommendedQuantity / 110 * 100;

			}
			
			$('#recommendedQuantity').val(Math.floor(recommendedQuantity));
		}
		

		
	}
	function calculateTotal(){
		var puppyGram = document.getElementsByName("orderProductPuppyGram");
		var puppyNum = document.getElementsByName("orderProductPuppyNum");
		var originalGram = document.getElementsByName("orderProductOriginalGram");
		var originalNum = document.getElementsByName("orderProductOriginalNum");
		var seniorGram = document.getElementsByName("orderProductSeniorGram");
		var seniorNum = document.getElementsByName("orderProductSeniorNum");
		var fishGram = document.getElementsByName("orderProductFishGram");
		var fishNum = document.getElementsByName("orderProductFishNum");
		var porkGram = document.getElementsByName("orderProductPorkGram");
		var porkNum = document.getElementsByName("orderProductPorkNum");
		var kangarooGram = document.getElementsByName("orderProductKangarooGram");
		var kangarooNum = document.getElementsByName("orderProductKangarooNum");
		var horseGram = document.getElementsByName("orderProductHorseGram");
		var horseNum = document.getElementsByName("orderProductHorseNum");

		if(puppyGram[0].value==""){
			var puppyGramValue=0;
		}
		else{
			puppyGramValue =puppyGram[0].value;
		}
		if(puppyNum[0].value==""){
			var puppyNumValue=0;
		}
		else{
			puppyNumValue =puppyNum[0].value;
		}
		if(originalGram[0].value==""){
			var originalGramValue=0;
		}
		else{
			originalGramValue =originalGram[0].value;
		}
		if(originalNum[0].value==""){
			var originalNumValue=0;
		}
		else{
			originalNumValue =originalNum[0].value;
		}
		if(seniorGram[0].value==""){
			var seniorGramValue=0;
		}
		else{
			seniorGramValue =seniorGram[0].value;
		}
		if(seniorNum[0].value==""){
			var seniorNumValue=0;
		}
		else{
			seniorNumValue =seniorNum[0].value;
		}
		if(fishGram[0].value==""){
			var fishGramValue=0;
		}
		else{
			fishGramValue =fishGram[0].value;
		}
		if(fishNum[0].value==""){
			var fishNumValue=0;
		}
		else{
			fishNumValue =fishNum[0].value;
		}
		if(porkGram[0].value==""){
			var porkGramValue=0;
		}
		else{
		 	porkGramValue =porkGram[0].value;
		}
		if(porkNum[0].value==""){
			var porkNumValue=0;
		}
		else{
			porkNumValue =porkNum[0].value;
		}
		if(kangarooGram[0].value==""){
			var kangarooGramValue=0;
		}
		else{
			kangarooGramValue =kangarooGram[0].value;
		}
		if(kangarooNum[0].value==""){
			var kangarooNumValue=0;
		}
		else{
			kangarooNumValue =kangarooNum[0].value;
		}
		if(horseGram[0].value==""){
			var horseGramValue=0;
		}
		else{
			horseGramValue =horseGram[0].value;
		}
		if(horseNum[0].value==""){
			var horseNumValue=0;
		}
		else{
			horseNumValue =horseNum[0].value;
		}
		
		console.log(puppyGram[0].value);
		for(var i = 0; i<1; i++){
			var result = 
				puppyGram[i].value * puppyNum[i].value +
				originalGram[i].value * originalNum[i].value +
				seniorGram[i].value * seniorNum[i].value +
				fishGram[i].value * fishNum[i].value +
				porkGram[i].value * porkNum[i].value +
				kangarooGram[i].value * kangarooNum[i].value +
				horseGram[i].value * horseNum[i].value;
				

			
			var totalPrice = 0;
			var orderProductPuppyAvailable = $('input[name="orderProductPuppyAvailable"]:checked').val();
			var orderProductOriginalAvailable = $('input[name="orderProductOriginalAvailable"]:checked').val();
			var orderProductSeniorAvailable = $('input[name="orderProductSeniorAvailable"]:checked').val();
			var orderProductFishAvailable = $('input[name="orderProductFishAvailable"]:checked').val();
			var orderProductPorkAvailable = $('input[name="orderProductPorkAvailable"]:checked').val();
			var orderProductKangarooAvailable = $('input[name="orderProductKangarooAvailable"]:checked').val();
			var orderProductHorseAvailable = $('input[name="orderProductHorseAvailable"]:checked').val();

			console.log(orderProductPuppyAvailable);
				if(orderProductPuppyAvailable==1){
					totalPrice += (puppyGramValue *puppyNumValue) * 40000 / 1000;
					console.log(totalPrice);
				}
				else if(orderProductPuppyAvailable==0){
					totalPrice += (puppyGramValue *puppyNumValue) * 32000 / 1000;
					console.log(totalPrice);

				}
				if(orderProductOriginalAvailable==1){
					totalPrice += (originalGramValue *originalNumValue) * 40000 / 1000;
					console.log(totalPrice);

				}
				else if(orderProductOriginalAvailable==0){
					totalPrice += (originalGramValue *originalNumValue)  * 31000 / 1000;
					console.log(totalPrice);

				}
				if(orderProductSeniorAvailable==1){
					totalPrice += (seniorGramValue *seniorNumValue) * 40000 / 1000;
					console.log(totalPrice);

				}
				else if(orderProductSeniorAvailable==0){
					totalPrice += (seniorGramValue *seniorNumValue)  * 32000 / 1000;
					console.log(totalPrice);

				}
				if(orderProductFishAvailable==1){
					totalPrice += (fishGramValue *fishNumValue)  * 40000 / 1000;
					console.log(totalPrice);

				}
				else if(orderProductFishAvailable==0){
					totalPrice += (fishGramValue *fishNumValue)  * 34000 / 1000;
					console.log(totalPrice);

				}
				if(orderProductPorkAvailable==1){
					totalPrice += (porkGramValue *porkNumValue) * 40000 / 1000;
					console.log(porkGramValue + ","+porkNumValue);

				}
				else if(orderProductPorkAvailable==0){
					totalPrice += (porkGramValue *porkNumValue)  * 34000 / 1000;
					console.log(porkGramValue + ","+porkNumValue);

				}
				if(orderProductKangarooAvailable==1){
					totalPrice += (kangarooGramValue *kangarooNumValue)  * 40000 / 1000;
					console.log(totalPrice);

				}
				else if(orderProductKangarooAvailable==0){
					totalPrice += (kangarooGramValue *kangarooNumValue)  * 35000 / 1000;
					console.log(totalPrice);

				}
				if(orderProductHorseAvailable==1){
					totalPrice +=(horseGramValue *horseNumValue)  * 40000 / 1000;
					console.log(totalPrice);

				}
				else if(orderProductHorseAvailable==0){
					totalPrice += (horseGramValue *horseNumValue)  * 36000 / 1000;
					console.log(totalPrice);

				}
				
				
		}
		console.log(totalPrice);
		$('#totalQuantity').val(result);
		$('#totalPrice').val(totalPrice);
	}
	$(function() {
	    $('#testDatepicker').datepicker({
	        showButtonPanel: true, 
	        currentText: '오늘 날짜', 
	        closeText: '닫기', 
	        dateFormat: "yymmdd"
	    });
	});
	
	$(function() {
	    $('#testDatepicker2').datepicker({
	        showButtonPanel: true, 
	        currentText: '오늘 날짜', 
	        closeText: '닫기', 
	        dateFormat: "yymmdd"
	    });
	});

/*	function autoClosingAlert(selector,delay){
		var alert = $(selector).alert();
		alert.show();
		window.setTimeout(function() { alert.hide() }, delay);
	}*/
	
</script>
<title>도거박스 관리자페이지</title>
</head>
<body>

<nav class="navbar navbar-default">
	<div class="navbar-header">
		<a class="navbar-brand">도거박스 시스템관리 프로그램</a>
	</div>
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav ">
			<li class=""><a href="realMain.jsp">메인</a>
		
		</ul>
		<ul class="nav navbar-nav ">
			<li class="active"><a href="main.jsp">주문 입력</a>
		</ul>
		<ul class="nav navbar-nav ">
			<li class=""><a href="orderAdmin.jsp">주문 관리</a>
		</ul>
		<ul class="nav navbar-nav ">
			<li class=""><a href="../recipe/recipeAdmin.jsp">베이스레시피/재료 관리</a>
		</ul>
	</div>
</nav>
	<div class="container bootstrap snippet" style=" margin-top:0px; width:1300px; border:2px solid black; height:902px;">
		<div class="" style="text-align:left;display:inline-block;">
			<div class="">
				<div class="" style="display:inline-block;  height:900px; 	">
					<div class="" style="height:100px;">
						
							<h4 style="display:inline-block;"><i class="fa fa-circle text-green"></i>고객 관리</h4>
							<input class="form-control" style="width:200px; display:inline-block;" placeholder="이름을 입력하세요" id="searchUserName"/>
							<button class="btn btn-primary" type="button" style="display:inline-block;" onclick="searchUser();">검색	</button>
						</div>
					<div id="userList"class="" style="overflow-y: auto; height:370px; width:350px;  ">
						
					</div>
					<div class="form-group" style="height:660px;">
						<div class="">
							<div class="" style="display:inline-block;">
								<input class="form-control" type="text" id="userName" style="height:40px; width:150px; display:inline-block;" placeholder="고객이름">
							</div> 
							<div class="" style="display:inline-block;">
								<input class="form-control" type="text" id="userAddress" style="height:40px; width:220px; display:inline-block;" placeholder="고객주소">
							</div>
						</div>
						<div class="">
							<div class="" style="display:inline-block;">
								<input class="form-control" type="text" id="userPhoneNum" style="height:40px; width:150px; display:inline-block;" placeholder="폰 번호">
							</div> 
							<div class="" style="display:inline-block;">
								<input class="form-control" type="text" id="userIntroRoute" style="height:40px; width:150px; display:inline-block;" placeholder="유입경로">
							</div>
						</div>
						<div class="">
							<div class="" style="display:inline-block; width:100px;">
								<h4 style="display:inline-block;">배송 주기 :</h4>
								<select  class="form-control" id="userRoutine" style="display:inline-block;">
									<option value="1">정기</option>
									<option value="2">단기</option>
									<option value="3">샘플</option>
								</select>								
							</div> 
							<div style="display:inline-block; width:100px;">
								<h4 style="display:inline-block;">소개자 이름</h4>
								<input class="form-control" type="text" value="없음" id="introduceWho" style="display:inline-block;">
							</div>

						</div>
						<div class="">
							<div class="" style="display:inline-block;">
								<h4 style="display:inline-block;">배송 텀 :</h4>
								<select class="form-control" style="display:inline-block;" id="userTerm">
									<option value="1">2주</option>
									<option value="2">한달</option>
									<option value="3">해당사항 없음</option>
								</select>							
							</div> 
							<div class="" style="padding-right:50px;">
								<button type="button" class="btn btn-primary pull-right" onclick="addUserFunction();" id="userRegisterButton">고객 등록</button>
								<button type="button" class="btn btn-primary pull-right" onclick="updateUserFunction();" id="userUpdateButton" style="display:none;">고객 정보 수정</button>
							<input type="hidden" id="userUserPrimeNum">
							</div>
						</div>
					</div>
<!-- 			
					 -->
				</div>


<!-- 	<div class="container bootstrap snippet" style="border:1px solid black;width:350px; display:inline-block; ">
		<div class="row" style="border:1px solid black">
			<div class="col-xs-12">
강아지	<div class="portlet portlet-default" style=" display:inline-block; border:1px solid black; "> -->
				<div style="display:inline-block; width:360px; margin-left:30px; height:900px;">
					<div class="" style="height:60px;">
						<div class="" >
							<h4 style="display:inline-block;"><i class="fa fa-circle text-green"></i>강아지 관리</h4>
						</div>
					</div>
					<div id="puppyList"class="" style=" overflow-y: auto; height:220px; width:360px;">
						
					</div>
					<div class="form-group" style=" margin-bottom:0px;  height:620px;">
						<div class="" id="puppyReg">
							<input class="form-control" type="text" id="puppyUserPrimeNum" style="height:30px;width:50px; display:inline-block;" placeholder="유저 아이디" value="">
						</div> 
						<div class="" style="margin-bottom:10px;">
							<div class="" style="display:inline-block;">
								<input class="form-control" type="text" id="puppyName" style="height:30px; width:150px;; display:inline-block;" placeholder="강아지이름">
							</div> 
							<div class="" style="display:inline-block;">
								<input class="form-control" type="text" id="puppySpecies" style="height:30px; width:150px; display:inline-block;" placeholder="품종">
							</div>
						</div>
						<div class=""style="margin-bottom:10px;">
							<div class="" style="display:inline-block;">
								<input class="form-control" type="text" id="puppyAge" style="height:30px; width:110px; display:inline-block; font-size:10pt;" placeholder="나이(년)">
							</div> 
							<div class="" style="display:inline-block;">
								<input class="form-control" type="text" id="puppyAgeMonth" style="height:30px; width:110px; display:inline-block;" placeholder="나이(개월)">
							</div>
							<div class="" style="display:inline-block;">
								<input class="form-control" type="text" id="puppyAgeETC" style="height:30px; width:110px; display:inline-block;" placeholder="나이 etc">
							</div>
						</div>
						<div style="margin-bottom:10px;">
							<div class="" style="display:inline-block;">
								<input class="form-control" type="text" id="puppyWeight" style="height:30px; width:110px; display:inline-block;" placeholder="체중">
							</div>
							<div class="" style="display:inline-block;">
								<input class="form-control" type="text" id="puppyWeightETC" style="height:30px; width:160px; display:inline-block;" placeholder="체중etc">
							</div>

						</div>
						<div class=""style="margin-bottom:10px;">
							<div class="" style="display:inline-block;">
								<input class="form-control" type="text" id="puppyETC" style="height:30px; width:330px; display:inline-block;" placeholder="참고사항">
							</div>
						</div>
						<div>
							<div class="" style="display:inline-block;">
								<input class="form-control" type="text" id="puppyRestrict" style="height:30px; width:330px; display:inline-block;" placeholder="알러지 재료">
							</div>
						</div>
						<div class=""style="margin-bottom:10px;">
							<div class="" style="display:inline-block;">
								<h4 style="display:inline-block;">성별 </h4>
								<select  class="form-control" id="puppyGender" style="display:inline-block;" style="width:60px;">
									<option value="1">수컷</option>
									<option value="2">암컷</option>
								</select>								
							</div> 
							<div class="" style="display:inline-block; margin-bottom:10px;">
								<h4 style="display:inline-block;">중성화 여부</h4>
								<select class="form-control" style="display:inline-block;" id="puppyNeutralization" >
									<option value="1">함 </option>
									<option value="2">안 함</option>
								</select>								
							</div> 
						</div>
						<div class="">
							<div class="" style="display:inline-block; width:100px;">
								<h4 style="display:inline-block;">활동성 </h4>
								<select  class="form-control" id="puppyActivity" style="display:inline-block;" style="width:60px;">
									<option value="4">게으른편</option>
									<option value="1">매우 활발</option>
									<option value="2">활발</option>
									<option value="3">보통</option>
									<option value="5">매우 게으른편</option>
									
								</select>
							</div>
							
							<div style="display:inline-block; width:130px;">
								<h4 style="display:inline-block;">체중 조절 필요 </h4>
								<select  class="form-control" id="weightControl" style="display:inline-block;" style="width:60px;">
									<option value="2">필요없음</option>
									<option value="1">필요</option>
									
									
								</select>
							</div> 
								<input type="text"id="testDatepicker2" style="display:inline-block; width:100px;">
													
							
							<div class="">
								<div style="display:inline-block; width:100px;">
									<select  class="form-control" id="foodSpecies" style="width:100px; display:inline-block;">
										<option value="1">오리지날</option>
										<option value="2">퍼피</option>
										<option value="3">시니어</option>
										<option value="4">피쉬</option>
										<option value="5">포크</option>
										<option value="6">캥거루</option>
										<option value="7">홀스</option>
									</select>
								</div>
								<div class="" style="display:inline-block;">
									<input class="form-control" type="text" id="recommendedQuantity" style="height:30px; width:100px; display:inline-block;" placeholder="권장 급여량"><span>g</span>
								</div>
								<div class="" style="display:inline-block;">
									<button class="btn btn-primary" onclick="calculateQuantity();" style="width:60px; height:30px; display:inline-block;">계산</button>
								</div>
								<button type="button" class="btn btn-default pull-right" onclick="addPuppyFunction();" id="puppyRegisterButton">강아지 등록</button>
								<button type="button" class="btn btn-default pull-right" onclick="updatePuppyFunction();" id="puppyUpdateButton" style="display:none;">강아지 수정</button>
								<input type="hidden" id="puppyPuppyPrimeNum">
							</div>
						</div>
					</div>
<!-- 					<div class="alert alert-success" id="successPuppyMessage" style="display:none;">
						<strong>강아지 등록에 성공했습니다.</strong>
					</div>
					<div class="alert alert-danger" id="dangerPuppyMessage" style="display:none;">
						<strong>내용을 모두 입력해주세요.</strong>
					</div>
					<div class="alert alert-warning" id="warningPuppyMessage" style="display:none;">
						<strong>데이터베이스 오류가 발생했습니다.</strong>
					</div>
 -->
					
				</div>
				
<!--주문  -->		<div style="display:none; width:450px; margin-left:30px; height:800px; " id="orderAdmin">
					<div class="" style="height:37px;">
						<div class="" >
							<h4 style="display:inline-block;"><i class="fa fa-circle text-green"></i>주문 관리</h4>
						</div>
					</div>
					<div id="orderList"class="" style=" overflow-y: auto; height:160px; width:440px;">
						
					</div>
					
					<div class="form-group" style=" height:380px;" id="orderRegister">
						<div class="">
							<input class="form-control" type="text" placeholder="강아지 id"  id="orderPuppyPrimeNum" value="">
							
						</div>
						<div class="">
							<input class="form-control" type="text" id="orderRoundTitle" placeholder="차수 제목" style="display:inline-block; width:100px;" value="" />
							<input type="hidden" id="orderRoundPrimeNum" value=""/>
							
							<button type="button" class="btn btn-primary" onclick="openNewWindow();" style="width:150px;">차수 선택</button>
						</div>
						<div class="">
							<div id="orderProductPuppyRecipe">
								<input type="number" class="form-control" step="1" placeholder="퍼피(gram)" name="orderProductPuppyGram" maxlength="50" id="puGram" style="display:inline-block; width:100px;"></input>
								<input type="number" class="form-control" step="1" placeholder="퍼피(개수)" name="orderProductPuppyNum" maxlength="50" id="puNum" style="display:inline-block; width:100px;"></input>
								<input type="radio" name="orderProductPuppyAvailable" value=1 />처방<input type="radio" name="orderProductPuppyAvailable" value=0 Checked />비처방
								<input type="hidden" name="orderProductPuppyRecipePrimeNum" id="puppyRecipePrimeNum" value=0 />
							</div>
						</div>
						<div class="" >
					
							<div id="orderProductOriginalRecipe">
								<input type="number" class="form-control" step="1" placeholder="오리지널(gram)" name="orderProductOriginalGram" maxlength="50" id="oGram" style="display:inline-block; width:100px;"></input>
								<input type="number" class="form-control" step="1" placeholder="오리지널(개수)" name="orderProductOriginalNum" maxlength="50" id="oNum"  style="display:inline-block; width:100px;"></input>
								<input type="radio" name="orderProductOriginalAvailable" value=1 />처방<input type="radio" name="orderProductOriginalAvailable" value=0 Checked />비처방
								<input type="hidden" name="orderProductOriginalRecipePrimeNum" id="originalRecipePrimeNum" value=0 />
							
							</div>
						</div>
						<div class="">
						
							<div id="orderProductSeniorRecipe">
								<input type="number" class="form-control" step="1" placeholder="시니어(gram)" name="orderProductSeniorGram" maxlength="50" id="sGram"  style="display:inline-block; width:100px;"></input>
								<input type="number"  class="form-control" step="1" placeholder="시니어(개수)" name="orderProductSeniorNum" maxlength="50" id="sNum"  style="display:inline-block; width:100px;"></input>
								<input type="radio" name="orderProductSeniorAvailable" value=1 />처방<input type="radio" name="orderProductSeniorAvailable" value=0 Checked />비처방
								<input type="hidden" name="orderProductSeniorRecipePrimeNum" id="seniorRecipePrimeNum" value=0 />
							
							</div>
						</div>
						<div class="">

							<div id="orderProductFishRecipe">
								<input type="number" class="form-control" step="1" placeholder="피쉬(gram)" name="orderProductFishGram" maxlength="50" id="fGram" style="display:inline-block; width:100px;"></input>
								<input type="number" class="form-control" step="1" placeholder="피쉬(개수)" name="orderProductFishNum" maxlength="50" id="fNum"  style="display:inline-block; width:100px;"></input>
								<input type="radio" name="orderProductFishAvailable" value=1 />처방<input type="radio" name="orderProductFishAvailable" value=0 Checked />비처방
								<input type="hidden" name="orderProductFishRecipePrimeNum" id="fishRecipePrimeNum" value=0 />
							
							</div>
						</div>
						<div class="">

							<div id="orderProductPorkRecipe">
								<input type="number"  class="form-control" step="1"  placeholder="포크(gram)" name="orderProductPorkGram" maxlength="50" id="pGram" style="display:inline-block; width:100px;"></input>
								<input type="number" class="form-control" step="1" placeholder="포크(개수)" name="orderProductPorkNum" maxlength="50" id="pNum"  style="display:inline-block; width:100px;"></input>
								<input type="radio" name="orderProductPorkAvailable" value=1 />처방<input type="radio" name="orderProductPorkAvailable" value=0 Checked />비처방
								<input type="hidden" name="orderProductPorkRecipePrimeNum" id="porkRecipePrimeNum" value=0 />
							
							</div>
						</div>
						<div class="">

							<div id="orderProductKangarooRecipe">
								<input type="number" class="form-control"step="1"  placeholder="캥거루(gram)" name="orderProductKangarooGram" maxlength="50" id="kGram" style="display:inline-block; width:100px;"></input>
								<input type="number"  class="form-control"step="1"  placeholder="캥거루(개수)" name="orderProductKangarooNum" maxlength="50" id="kNum" style="display:inline-block; width:100px;"></input>
								<input type="radio" name="orderProductKangarooAvailable" value=1 />처방<input type="radio" name="orderProductKangarooAvailable" value=0 Checked />비처방
								<input type="hidden" name="orderProductKangarooRecipePrimeNum" id="kangarooRecipePrimeNum" value=0 />
							
							</div>
						</div>
						<div class="">

							<div id="orderProductHorseRecipe">
								<input type="number"  class="form-control" step="1" placeholder="홀스(gram)" name="orderProductHorseGram" maxlength="50" id="hGram" style="display:inline-block; width:100px;"></input>
								<input type="number"  class="form-control" step="1" placeholder="홀스(개수)" name="orderProductHorseNum" maxlength="50" id="hNum"  style="display:inline-block; width:100px;"></input>
								<input type="radio" name="orderProductHorseAvailable" value=1 />처방<input type="radio" name="orderProductHorseAvailable" value=0 Checked />비처방
								<input type="hidden" name="orderProductHorseRecipePrimeNum" id="horseRecipePrimeNum" value=0 ></input>
							
							</div>
						</div>
						<div class="">
							<div>
								<input type="number" class="form-control" placeholder="주문량" name="orderTotalQuantity" maxlength="50" id="totalQuantity"value=""style="display:inline-block; width:100px;"></input>
								<button type="button" class="btn btn-primary" onclick="calculateTotal();" style="width:50px; height:40px;" >계산</button>
							</div>
							
							<div>
								<input type="number" class="form-control" placeholder="가격" name="orderTotalPrice" id="totalPrice" maxlength="50" value="" style="width:100px;"></input>
							
							</div>
							<div>
								<input type="text" class="form-control" placeholder="참고사항" name="orderETC" maxlength="200" id="orderETC"></input>
								
							</div>
							<div>
							

								<select  class="select-one radio-container form-control" name="orderPack" id= "orderPack" style="width:50px; display:inline-block;">
									<option value="1">풀팩</option>
									<option value="2">하프팩</option>
								</select>
								<input type="text"id="testDatepicker" style="display:inline-block; width:100px;" placeholder="결제일자"></input>
								<input type="text" id="orderTitle" style="display:inline-block; width:150px;" class="form-control" placeholder="주문제목ex.)1/2" value=""></input>
							</div>
							<div class="">
								<button type="button" id="orderRegisterButton" class="btn btn-default pull-right" onclick="addOrderFunction();">주문 등록</button>
								<button type="button" id="orderUpdateButton" style="display:none;" class="btn btn-default pull-right" onclick="updateOrderFunction();">주문 수정</button>
							<input type="hidden" id=orderOrderPrimeNum>
							</div>
						</div>
						
<!-- 					<div class="alert alert-success" id="successMessage" style="display:none;">
						<strong>주문 등록에 성공했습니다.</strong>
					</div>
					<div class="alert alert-warning" id="warningMessage" style="display:none;">
						<strong>데이터베이스 오류가 발생했습니다.</strong>
					</div> -->

					
				</div>
			</div>
			
			<div style="display:none; width:450px;margin-left:30px; height:700px;" id="recipeAdmin">
				
						<div class="" style="height:50px;" >
							<h4 style="display:inline-block;"><i class="fa fa-circle text-green"></i>레시피 관리</h4>
							<button type="button" onclick="addRecipeFunction();" class="btn btn-primary" style="width:100px;">레시피 추가</button>
						</div>
					
					<div id="recipeList"class="" style="overflow-y:auto; height:150px; width:440px;">
						
					</div>
					
					<div class="form-group" style="">
						<button type="button" onclick="addIngredientFunction();" class="btn btn-primary" style="width:100px;">재료 추가</button>
						<input type="text" id="recipePuppyPrimeNum" value="">
						<input type="text" id="recipeRecipePrimeNum" value="">
						
					<div style="overflow-y:auto;width:440px; height:400px;">				
						<table class="table recipe-admin" id="recipeIngredientAdmin">
						
						</table>
					</div>	
						<div class="">
							<button type="button" class="btn btn-default pullx-right" onclick="updateRecipe();">레시피 수정</button>
						</div>
					</div>
						
<!-- 					<div class="alert alert-success" id="successMessage" style="display:none;">
						<strong>주문 등록에 성공했습니다.</strong>
					</div>
					<div class="alert alert-warning" id="warningMessage" style="display:none;">
						<strong>데이터베이스 오류가 발생했습니다.</strong>
					</div> -->

					
				</div>
			</div>
		</div>
<!--					<div class="alert alert-success" id="successUserMessage" style="display:none;">
						<strong>고객 등록에 성공했습니다.</strong>
					</div>
					<div class="alert alert-danger" id="notEnoughUserMessage" style="display:none;">
						<strong>내용을 모두 입력해주세요.</strong>
					</div>
					<div class="alert alert-warning" id="dataBaseErrorUserMessage" style="display:none;">
						<strong>유저 관련 데이터베이스 오류가 발생했습니다.</strong>
					</div>
					<div class="alert alert-warning" id="searchBlankUserMessage" style="display:none;">
						<strong>검색 이름을 입력해주세요.</strong>
					</div>
					<div class="alert alert-success" id="successPuppyMessage" style="display:none;">
						<strong>강아지 등록에 성공했습니다.</strong>
					</div>
					<div class="alert alert-danger" id="notEnoughPuppyMessage" style="display:none;">
						<strong>내용을 모두 입력해주세요.</strong>
					</div>
					<div class="alert alert-warning" id="dataBaseErrorPuppyMessage" style="display:none;">
						<strong>강아지 관련 데이터베이스 오류가 발생했습니다.</strong>
					</div>
					<div class="alert alert-success" id="successOrderMessage" style="display:none;">
						<strong>주문 등록에 성공했습니다.</strong>
					</div>
					<div class="alert alert-danger" id="notEnoughOrderMessage" style="display:none;">
						<strong>내용을 모두 입력해주세요.</strong>
					</div>
					<div class="alert alert-warning" id="dataBaseErrorOrderMessage" style="display:none;">
						<strong>주문 관련 데이터베이스 오류가 발생했습니다.</strong>
					</div>
					<div class="alert alert-success" id="successRecipeMessage" style="display:none;">
						<strong>주문 등록에 성공했습니다.</strong>
					</div>
					<div class="alert alert-danger" id="notEnoughRecipeMessage" style="display:none;">
						<strong>내용을 모두 입력해주세요.</strong>
					</div>
					<div class="alert alert-warning" id="dataBaseErrorRecipeMessage" style="display:none;">
						<strong>주문 관련 데이터베이스 오류가 발생했습니다.</strong>
					</div>-->
	</div>

        
	 


</body>

</html>