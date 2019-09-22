<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bulletin.Bulletin" %>
<%@ page import="bulletin.BulletinDAO" %> 
<%@ page import="doggerboxuser.DoggerboxUser" %>
<%@ page import="doggerboxuser.DoggerboxUserDAO" %>   
<%@ page import= "java.io.PrintWriter" %>

<!DOCTYPE html>
<html>
<head>
<script src ="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/main_style.css">
<link rel="stylesheet" href="../css/bulletin/write_style.css">
<link href="../dist/summernote.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
        /* summernote에서 이미지 업로드시 실행할 함수 */
	 	function sendFile(file, editor) {
            // 파일 전송을 위한 폼생성
	 		data = new FormData();
	 	    data.append("uploadFile", file);
	 	    $.ajax({ // ajax를 통해 파일 업로드 처리
	 	        data : data,
	 	        type : "POST",
	 	        url : "bulletinImageUpload.jsp",
	 	        cache : false,
	 	        contentType : false,
	 	        processData : false,
	 	        success : function(data) { // 처리가 성공할 경우
                    // 에디터에 이미지 출력
	 	        	$(editor).summernote('editor.insertImage', data.url);
	 	        }
	 	    });
	 	}
	</script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale=1>
<title>도거박스:&nbsp;건강한 변화를 선물합니다. </title>
<style type="text/css">
 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: black; text-decoration: none;}
</style>
</head>
<body>
<%
	int bulletinCategory = 0;
	if(request.getParameter("bulletinCategory")!=null){
		bulletinCategory = Integer.parseInt(request.getParameter("bulletinCategory"));
	}
	int bulletinID = 0;
	if(request.getParameter("bulletinID")!=null){
		bulletinID = Integer.parseInt(request.getParameter("bulletinID"));
	}
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String)session.getAttribute("userID");
	}
	if(userID==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	}
	
	DoggerboxUserDAO userDAO = new DoggerboxUserDAO();
	DoggerboxUser user = userDAO.getUser(userID);
%>



	<div class="container"> 
		
			<div class="header">
				<a href="main.jsp"><img src="../img/logo.png" width="150px" height="50px" class="logo"></a>
				<a href="main.jsp"><img src="../img/logo.png" width="100px" height="40px" class="logo_mobile"></a>
				<div class="link-container">
					<a href="../myPage.jsp"  class="my-page">마이 페이지</a>
					<a href="bulletin_intro.jsp"  class="bulletin">게시판</a>
					<a href="../product/basic_lineup.jsp"  class="product-introduce">제품 소개</a>
					<a href="../company_introduce.jsp"  class="company-introduce">회사소개</a>
				</div>
				
			</div>
		
	<%
		BulletinDAO bulletinDAO = new BulletinDAO();
		Bulletin bulletin = bulletinDAO.getBulletin(bulletinID);
	%>
			
		<div class="main-container1">

			<div class="profile-container">
				<span class="profile"><img src=<%=user.getThumbnail_image()%> width="50px" height="50px"  class="profile_thumbnail"></span>
				<span class="writer"><%=user.getUserName() %></span>
			</div>
		 		<form action="writeAction.jsp?bulletinID=<%=bulletinID%>" method="post" id="write">
	 			
	 				<input name="bulletinTitle" maxlength="200"  class="title" value="<%=bulletin.getBulletinTitle()%>">

					<textarea name="bulletinContent" id="summernote" class="content"><%=bulletin.getBulletinContent()%></textarea>
					        <script>
					            $(document).ready(function() {
					                $('#summernote').summernote({ // summernote를 사용하기 위한 선언
					                    height: 400,
										callbacks: { // 콜백을 사용
					                        // 이미지를 업로드할 경우 이벤트를 발생
										    onImageUpload: function(files, editor, welEditable) {
											    sendFile(files[0], this);
											}
										}
									});
								});
							</script>
	
					
	 				<input type="submit" id="savebutton" class="write-button"value="글쓰기">	
	 					
	 			</form>
		</div> 
<!-- 		<div class="footer"></div>
 -->	</div>
	
<script src="../dist/summernote.min.js" type="text/javascript"></script>
<script src="../dist/lang/summernote-ko-KR.js" type="text/javascript"></script>

<script type="text/javascript">
$(document).ready(function() {
  $('#summernote').summernote({  height: 300,          // 기본 높이값
	  minHeight: null,      // 최소 높이값(null은 제한 없음)
	  maxHeight: null,      // 최대 높이값(null은 제한 없음)
	  focus: true,          // 페이지가 열릴때 포커스를 지정함
	  lang: 'ko-KR'         // 한국어 지정(기본값은 en-US)
	  });

});
</script>
</body>


</html>