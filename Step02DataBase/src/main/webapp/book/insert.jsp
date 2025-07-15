<%@page import="test.dao.BookDao"%>
<%@page import="test.dto.BookDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String title = request.getParameter("title");
	String author=request.getParameter("author");
	String published_at =request.getParameter("published_at");
	
	BookDto dto = new BookDto();
	dto.setAuthor(author);
	dto.setTitle(title);
	dto.setPublished_at(published_at);
	
	BookDao dao = new BookDao();
	boolean isSuccess = dao.insert(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert.jsp</title>
</head>
<body>
<%if(isSuccess){%>
	<p>성공적으로 책 정보가 추가되었습니다</p>
	<a href="${pageContext.request.contextPath }/book/list.jsp">책 목록</a>
    <%}else{ %>
    <p>책 정보 저장 실패!</p>
    <a href="${pageContext.request.contextPath }/book/insertform.jsp">재시도</a>
    <%} %>
</body>
</html>