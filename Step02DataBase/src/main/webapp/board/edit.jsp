<%@page import="test.dto.BoardDto"%>
<%@page import="test.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	int num = Integer.parseInt(request.getParameter("num"));
	BoardDto dto = BoardDao.getInstance().getByNum(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>edit.jsp</title>
<jsp:include page="/WEB-INF/include/resource.jsp"></jsp:include>
</head>
<body>
	<div class="container pt-3">
	<nav aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="${pageContext.request.contextPath }/">Home</a></li>
				<li class="breadcrumb-item"><a href="list.jsp">Board</a></li>
				<li class="breadcrumb-item active" aria-current="page">Edit</li>
			</ol>
		</nav>
		<h1>글 수정 페이지</h1>
		
		<form action="update.jsp?num=<%=dto.getNum() %>" method="post">
			<div>
				<label class="form-label" for="num">글번호</label>
				<input class="form-control" type="text" name="num" id="num" readonly />
			</div>
			<div>
				<label class="form-label" for="writer">작성자</label>
				<input class="form-control" type="text" name="writer" id="writer" readonly />
			</div>
			<div>
				<label class="form-label" for="title">제목</label>
				<input type="text" class="form-control" name="title" id=title value="<%=dto.getTitle() %>" />
			</div>
			<div>
				<label class="form-label" for="content">내용</label>
				<textarea class="form-control" name="content" id="content" rows="10"><%=dto.getContent() %></textarea>
			</div>
			
			<button class="btn btn-success btn-sm" type="submit">수정</button>
			<button class="btn btn-danger btn-sm" type="reset">취소</button>
		</form>
		
	</div>
</body>
</html>