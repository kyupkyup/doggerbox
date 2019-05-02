<%@ page language="java" contentType="application/cnd.ms-excel; name='excel';charset=euc-kr"
    pageEncoding="euc-kr"%>
<!DOCTYPE html>

<%
	String file_name = "excel_download";
	String ExcelName = new String(file_name.getBytes(), "euc-kr")+".xls";
	response.reset(); 
	response.setContentType("application/vnd.ms-excel");
	response.setHeader("Content-Disposition", "attachment; filename="+ExcelName);
	response.setHeader("Content-Description", "JSP Generated Data");
	response.setHeader("Pragma", "no-cache");
	
	String table = request.getParameter("excel_table");
%>
<html>
<head>
<meta charset=" text/html; euc-kr" http-equiv="Content-type" content="application/vns.cs-excel;">
<title>Insert title here</title>
</head>
<body>
	<Table>
		<%=table%>
	</Table>
</body>
</html>