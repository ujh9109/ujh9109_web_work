<%@page import="test.dao.MemberDao"%>
<%@page import="test.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	int num=Integer.parseInt(request.getParameter("num"));
	
	MemberDto dto= new MemberDao().getByNum(num);
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/updateform.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
</head>
<body>
	<div class="container">
		<h1>회원정보 수정 양식</h1>
		<form action="${pageContext.request.contextPath }/member/update.jsp" method="post">
			<div class="mb-2">
				<label for="num">번호</label>
				<input type="text" name="num" id="num" value="<%=dto.getNum() %>" readonly/>
			</div>
			<div class="mb-2">
				<label class="form-label" for="name">이름</label>
				<input class="form-control" type="text" name="name" id="name" value="<%=dto.getName() %>"/>
				<div class="form-text">10글자 이내로 입력해주세요.</div>
			</div>
			<div class="mb-2">
				<label class="form-label" for="addr">주소</label>
				<input class="form-control" type="text" name="addr" id="addr" value="<%=dto.getAddr() %>"/>
				<div class="form-text">실제 거주하는 주소를 입력해 주세요.</div>
			</div>
			<button class="btn btn-outline-success btn-sm " type="submit">
			<i class="bi bi-clipboard-plus"></i>
			수정
			</button>
			<button class="btn btn-outline-warning btn-sm "type="reset">
			<i class="bi bi-clipboard-x"></i>
			취소
			</button>
		</form>
	</div>
</body>
</html>









