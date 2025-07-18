<%@page import="test.dto.BoardDto"%>
<%@page import="test.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int num = Integer.parseInt(request.getParameter("num"));

	String writer = BoardDao.getInstance().getByNum(num).getWriter();

	String userName = (String)session.getAttribute("userName");
	
	if(!writer.equals(userName)){
		response.sendError(
			HttpServletResponse.SC_FORBIDDEN,
			"다른 사람의 글은 삭제할 수 없습니다."
			);
		return;
	}

	BoardDao.getInstance().deleteByNum(num);
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		alert("삭제했습니다!")
		location.href="list.jsp"
	</script>
</body>
</html>