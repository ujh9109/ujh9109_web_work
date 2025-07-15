<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Loginform.jsp</title>
</head>
<body>
	<div class="container">
		<h1>로그인 양식</h1>
		<form action="Login.jsp" method="post">
			<div>
				<label for="userName">아이디</label>
				<input type="text" name="userName" id="userName" />
			</div>
			<div>
				<label for="password">비밀번호</label>
				<input type="password" name="password" id="password" />
			</div>
			<button type="submit">로그인</button>
		</form>
	</div>
</body>
</html>