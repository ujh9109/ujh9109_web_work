<%@page import="test.dto.CommentDto"%>
<%@page import="test.dao.CommentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int parentNum = Integer.parseInt(request.getParameter("parentNum"));
	String targetWriter = request.getParameter("targetWriter");
	String content = request.getParameter("content");
	
	//댓글 작성자 정보는 session으로부터 얻어낸다.
	String writer = (String)session.getAttribute("userName");
	
	//저장할 댓글의 글번호를 미리 얻어낸다.
	int num = CommentDao.getInstance().getSequence();
	//dto에 담기
	CommentDto dto = new CommentDto();
	dto.setNum(num);
	dto.setWriter(writer);
	dto.setTargetWriter(targetWriter);
	dto.setContent(content);
	dto.setGroupNum(num);
	dto.setParentNum(parentNum);
	
	//DB에 저장하고
	boolean isSuccess = CommentDao.getInstance().insert(dto);
	//응답한다.
	String cPath = request.getContextPath();
	response.sendRedirect(cPath+"/board/view.jsp?num="+parentNum);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>save-comment.jsp</title>
</head>
<body>
</body>
</html>