<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int num = 1;
	String name = "김구라";
	String addr = "노량진";
	
	List<String> names = List.of("김구라","해골","원숭이");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/jsp/test01.jsp</title>
</head>
<body>
	<h1>회원 한명의 정보입니다.</h1>
	<p>번호: <strong><%=num%></strong></p>
	<p>이름: <strong><%=name+"님"%></strong></p>
	<p>주소: <strong><%=addr%></strong></p>
	<ul>
		<%for(int i=0; i<names.size();i++){%>
			<li><%=names.get(i) %></li>
		<%}%>
	</ul>
	<ol>
		<%for(String tmp : names){%>
			<li><%=tmp %></li>
		<%} %>
	</ol>	
		
	
</body>
</html>