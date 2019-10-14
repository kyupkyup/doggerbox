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
<link href='fullcalendar/core/main.css' rel='stylesheet' />
<link href='fullcalendar/daygrid/main.css' rel='stylesheet' />
<link href='fullcalendar/google-calendar/main.css' rel='stylesheet' />
<link href='fullcalendar/list/main.css' rel='stylesheet' />
<link href='fullcalendar/timegrid/main.css' rel='stylesheet' />

<script src ="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 
<script src='fullcalendar/core/main.js'></script>
<script src='fullcalendar/daygrid/main.js'></script>
<script src='fullcalendar/google-calendar/main.js'></script>
<script src='fullcalendar/interaction/main.js'></script>
<script src='fullcalendar/list/main.js'></script>
<script src='fullcalendar/luxon/main.js'></script>
<script src='fullcalendar/moment/main.js'></script>
<script src='fullcalendar/moment-timezone/main.js'></script>
<script src='fullcalendar/rrule/main.js'></script>
<script src='fullcalendar/timegrid/main.js'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>


<script type="text/javascript">

</script>

<script>


  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'dayGrid', 'interaction', 'list', 'timeGrid'],
      header:{
    	  left:'prev, next, today',
    	  center:'title',
    	  right:'dayGridMonth, timeGridWeek, timeGridDay, listWeek'
      },
      locale:'ko',
      defaultView: 'dayGridMonth',
      selectable:true,
      editable:true,
      eventLimit:true,
      events:function(info, successCallback, failureCallback){
	    		  
	    		  $.ajax({
/* 	    			  dataType:"json",
 */	    			 url:"/GetCalendarServlet",
	    			 type:"POST",
	    			  data:{
	    				 start : moment(info.startStr).format('YYYYMMDD'),
	    				 end : moment(info.endStr).format('YYYYMMDD')
	    			 },
	    			 success:function(data){
	    				 console.log("이거나와?");
	
	    				 if(data=="") return;
	    				 	var parsed = JSON.parse(data);
	    				 	var result = parsed.result;	
	    					var events=[];
    						for(var i=0; i<result.length; i++){
    							if(result[i][3].value == 1){
        							events.push({
        								id : result[i][0].value,
        								title : result[i][1].value,
        								start : result[i][2].value, 
        								allday:true,
    									color:'blue'
        							});
    							}
    							else if(result[i][3].value == 0){
          							events.push({
        								id : result[i][0].value,
        								title : result[i][1].value,
        								start : result[i][2].value, 
        								allday:true,
    									color:'red'
        							});
    							}
    							else if(result[i][3].value == 3){
          							events.push({
        								id : result[i][0].value,
        								title : result[i][1].value,
        								start : result[i][2].value, 
        								allday:true,
    									color:'green'
        							});
    							}
    							else if(result[i][3].value == 2){
          							events.push({
        								id : result[i][0].value,
        								title : result[i][1].value,
        								start : result[i][2].value, 
        								allday:true,
    									color:'yellow'
        							});
    							}
    						}

						console.log(data);
						console.log(events);
	  		    		successCallback(events);
						
	
	    			 },
	 				error:function(failureCallback){
	 					console.log("실패");
	 					console.log(failureCallback);
	 				}   			 
	    		  
	    		  });
	    	  },
	    	  eventClick:function(info){
	    		  console.log(info.event);
	    		  $.ajax({
	    			 url:"/SetDueDateAvailableServlet",
		    			type:"POST",
		    			  data:{
		    				 orderPrimeNum : info.event.id,
	    		  			 color : info.event.backgroundColor
		    			 },
		    			 success:function(result){
		    				 calendar.refetchEvents();
		    			 },
		    			 
		    			 
		    				error:function(request,status,error){
		    					  alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
		    				}
			    		
	    		  });

	    	  },
	      eventDrop:function(info){
	    	  console.log(info.event.start.getDate());
	    	  $.ajax({
	    			 url:"/UpdateDueDateServlet",
		    			type:"POST",
		    			  data:{
		    				 orderPrimeNum : info.event.id,
		    				 dueDate : moment(info.event.start).format('YYYYMMDD'),
	    		  			 color : info.event.backgroundColor

		    			 },
		    			 success:function(result){
		    				 calendar.refetchEvents();
		    			 },
		    			 
		    			 
		    				error:function(request,status,error){
		    					  alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
		    				}
	    	  });
	      }
	      

      
    });

     calendar.render();
  
  });

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
			<li class="active"><a href="realMain.jsp">메인</a>
		</ul>
		<ul class="nav navbar-nav ">
			<li class=""><a href="main.jsp">주문 입력</a>
		</ul>
		<ul class="nav navbar-nav ">
			<li class=""><a href="orderAdmin.jsp">주문 관리</a>
		</ul>
		<ul class="nav navbar-nav ">
			<li class=""><a href="../recipe/recipeAdmin.jsp">베이스레시피/재료 관리</a>
		</ul>
	</div>
</nav>
<div class="container">
	<div id="calendar">
	</div>
</div>
        
	 


</body>

</html>