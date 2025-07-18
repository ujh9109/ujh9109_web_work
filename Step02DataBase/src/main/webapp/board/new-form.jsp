<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>new-form.jsp</title>
<jsp:include page="/WEB-INF/include/resource.jsp"></jsp:include>
</head>
<body>
	<div class="container">
		<h1>게시글 작성 양식</h1>
		<form action="save.jsp" method="post">
			<div class="mb-2">
				<label class="form-Label" for="title">제목</label>
				<input class="form-control" type="text" name="title" id="title" />
			</div>
			<div class="mb-2">
				<label class="form-Label" for="content">내용</label>
				<textarea class="form-control" name="content" id="content" rows="10"></textarea>
			</div>
			<button class="btn btn-success bn-sm" type="submit">저장</button>
		</form>
	</div>
</body>
</html>