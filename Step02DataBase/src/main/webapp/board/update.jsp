<%@page import="test.dto.BoardDto"%>
<%@page import="test.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	
	BoardDto dto = new BoardDto();
	dto.setNum(num);
	dto.setTitle(title);
	dto.setContent(content);
	
	String writer = BoardDao.getInstance().getByNum(num).getWriter();

	String userName = (String)session.getAttribute("userName");
	
	if(!writer.equals(userName)){
		response.sendError(
			HttpServletResponse.SC_FORBIDDEN,
			"다른 사람의 글은 수정할 수 없습니다."
			);
		return;
	}

	boolean isSuccess = BoardDao.getInstance().update(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update.jsp</title>
</head>
<body>
	<script>
		alert("<%=dto.getNum()%>번 글을 수정했습니다.")
		location.href="view.jsp?num=<%=dto.getNum()%>"
	</script>
</body>
</html>