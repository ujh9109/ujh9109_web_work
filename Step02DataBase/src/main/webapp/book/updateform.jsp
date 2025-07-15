<%@page import="test.dao.BookDao"%>
<%@page import="test.dto.BookDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	BookDto dto = new BookDao().getByNum(num); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateform.jsp</title>
</head>
<body>
<div class="container">
		<h1>책 정보 수정 양식</h1>
		<form action="${pageContext.request.contextPath }/book/update.jsp" method="post">
			<div>
				<label for="num">번호</label>
				<input type="text" name="num" id="num" value="<%=dto.getNum() %>" readonly/>
			</div>
			<div>
				<label for="title">제목</label>
				<input type="text" name="title" id="title" value="<%=dto.getTitle() %>"/>
			</div>
			<div>
				<label for="author">저자</label>
				<input type="text" name="author" id="author" value="<%=dto.getAuthor() %>"/>
			</div>
			<div>
				<label for="published_at">출판사</label>
				<input type="text" name="published_at" id="published_at" value="<%=dto.getPublished_at() %>"/>
			</div>
			<button type="submit">수정</button>
			<button type="reset">취소</button>
		</form>
	</div>
</body>
</html>