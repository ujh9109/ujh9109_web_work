<%@page import="java.util.List"%>
<%@page import="test.dao.MemberDao"%>
<%@page import="test.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	MemberDto dto = new MemberDto();

	if(!name.equals("")){
		dto.setName(name);
	};


	if(!addr.equals("")){
		dto.setAddr(addr);
	};

	MemberDao dao = new MemberDao();
	boolean isSuccess = false;
	if(dto.getName() != null){
		isSuccess = dao.insert(dto);
		
	}

	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">

</head>
<body>
	<div class="container">

		<%if(isSuccess){%>
			<p class="alert alert-success mt-5">
			<i class="bi bi-check-circle-fill"></i>
			성공적으로 회원 정보가 추가되었습니다
			<a class="alert-link" href="${pageContext.request.contextPath }/member/List.jsp">회원목록</a>
    		</p>
    	<%}else{ %>
    		<p class="alert alert-danger mt-5">
    		<i class="bi bi-x-circle-fill"></i>
    		회원정보 저장 실패!
    		<a class="alert-link" href="${pageContext.request.contextPath }/member/insertform.jsp">재시도</a>
   			</p>
   		<%} %>
   		
   		<%-- tailwind css도 찾아볼 것 --%>
    
	</div>
</body>
</html>