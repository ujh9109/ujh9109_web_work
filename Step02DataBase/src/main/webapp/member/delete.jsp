<%@page import="test.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="test.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	
	MemberDao dao = new MemberDao();
	dao.deleteByNum(num);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete.jsp</title>
</head>
<body>
<%--자바스크립트를 응답해서 알림창이 뜨고 "확인" 버튼을 누르면 다시 목록보기로 이동하도록 한다. --%>
	<script>
	
		alert("삭제했습니다.");
		location.href = "${pageContext.request.contextPath }/member/List.jsp";
	
		</script>
</body>
</html>