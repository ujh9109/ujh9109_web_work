<%@page import="test.dao.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int num = Integer.parseInt(request.getParameter("num"));
	BookDao dao = new BookDao();
	boolean isSuccess = dao.deleteByNum(num);
	
	String cPath = request.getContextPath();
	response.sendRedirect(cPath+"/book/list.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete.jsp</title>
</head>
<body>
	
</body>
</html>