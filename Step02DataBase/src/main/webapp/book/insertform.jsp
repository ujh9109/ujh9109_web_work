<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/book/insertform.jsp</title>
</head>
<body>
	<div class="container">
		<h1>새로운 책 등록 양식</h1>
		<form action="insert.jsp" method="post">
			<div>
				<label for="title">제목</label>
				<input type="text" name="title" id="title"/>
			</div>
			<div>
				<label for="author">저자</label>
				<input type="text" name="author" id="author"/>
			</div>
			<div>
				<label for="published_at">출판사</label>
				<input type="text" name="published_at" id="published_at"/>
			</div>
			<button type="submit">추가</button>
		</form>
	</div>
</body>
</html>





