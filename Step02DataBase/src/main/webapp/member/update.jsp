<%@page import="test.dto.MemberDto"%>
<%@page import="test.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String addr = request.getParameter("addr");
	String name = request.getParameter("name");
	
	MemberDao dao = new MemberDao();
	
	MemberDto dto= new MemberDto();
	dto.setNum(num);
	dto.setAddr(addr);
	dto.setName(name);

	boolean isUpdate = dao.update(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
</head>
<body>
	<%if(isUpdate){%>
		<p>
			<i class="bi bi-send-check"></i>
			<strong><%=num %></strong>번 회원의 정보를 수정했습니다.
			<a href="List.jsp">확인</a>
		</p>
	<%}else{ %>
		<p>
			<i class="bi bi-exclamation-octagon"></i>
			수정실패! <a href="updateform.jsp?num=<%=num%>">다시 수정하러 가기</a>
		</p>
	<%} %>

</body>
</html>