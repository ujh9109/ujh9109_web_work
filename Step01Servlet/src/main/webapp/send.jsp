<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//여기는 java coding 영역.
//서블릿의 service() 메소드 안쪽 영역이라고 이해하면 됨.
	String url = request.getRemoteHost();
	String name = request.getParameter("name");
	String msg = request.getParameter("msg");
	System.out.println(url+" : "+name+" : "+msg);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>send.jsp</title>
</head>
<body>
	<h1>jsp 페이지에서 응답합니다</h1>
	<p>보낸 사람의 이름:<%=name%> </p>
	<p>보낸 내용:<%=msg %> </p>
</body>
</html>