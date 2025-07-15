<%@page import="test.dto.BookDto"%>
<%@page import="test.dao.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String title = request.getParameter("title");
	String author = request.getParameter("author");
	String published_at = request.getParameter("published_at");
	
	BookDao dao = new BookDao();
	BookDto dto = new BookDto();
	dto.setNum(num);
	dto.setAuthor(author);
	dto.setTitle(title);
	dto.setPublished_at(published_at);
	boolean isSuccess = dao.update(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%if(isSuccess){ %>
	<p>
		<strong><%=num %></strong>번 책의 정보를 수정했습니다.
		<a href="list.jsp">확인</a>
	</p>
	<%}else{ %>
		수정실패! <a href="updateform.jsp?num=<%=num%>">다시 수정하러 가기</a>
	<% }%>
	
</body>
</html>