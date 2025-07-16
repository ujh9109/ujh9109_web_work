<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//세션 영역에 저장된 값을 삭제하는 것이 로그아웃
	//userName이라는 키 값으로 저장된 값을 삭제
	session.removeAttribute("userName");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		alert("로그아웃 되었습니다");
		location.href="${pageContext.request.contextPath }/";
	</script>
</body>
</html>