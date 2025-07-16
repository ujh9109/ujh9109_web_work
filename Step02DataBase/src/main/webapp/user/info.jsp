<%@page import="test.dao.UserDao"%>
<%@page import="test.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//세션에 저장된 userName을 읽어온다.
	String userName = (String)session.getAttribute("userName");
	UserDto dto = new UserDao().getByUserName(userName);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>info.jsp</title>
<jsp:include page="/WEB-INF/include/resource.jsp"></jsp:include>
</head>
<body>
	<div class="container">
		<h1>회원가입 정보</h1>
		<table class="table table-bodered table-striped">
			<tr>
				<th>아이디</th>
				<td><%=dto.getUserName() %></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><a href="edit-password.jsp">수정하기</a></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><%=dto.getEmail() %></td>
			</tr>
			<tr>
				<th>프로필 이미지</th>
				<td>
					<i style="font-size:50px" class="bi bi-person-circle"></i>
				</td>
			</tr>
			<tr>
				<th>최종 수정일</th>
				<td><%=dto.getUpdatedAt() %></td>
			</tr>
			<tr>
				<th>가입 날짜</th>
				<td><%=dto.getCreatedAt() %></td>
			</tr>
		</table>
		<a href="edit.jsp">개인 정보 수정(이메일, 프로필사진)</a>
	</div>
</body>
</html>