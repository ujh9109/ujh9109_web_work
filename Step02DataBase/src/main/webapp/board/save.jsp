<%@page import="test.dao.BoardDao"%>
<%@page import="test.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	//폼 전송되는 title과 content
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	// writer는 세션 객체로 얻어낸다.
	String writer = (String)session.getAttribute("userName");
	
	//dto에 담기
	BoardDto dto = new BoardDto();
	dto.setContent(content);
	dto.setTitle(title);
	dto.setWriter(writer);
	
	//글번호 담기
	int num = BoardDao.getInstance().getSequence();
	dto.setNum(num);
	
	boolean isSuccess = BoardDao.getInstance().insert(dto);
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>save.jsp</title>
</head>
<body>
<div class="container">
	<%if(isSuccess){%>
		<script>
			var num = <%= num %>;
	    	alert("저장했습니다");
	    	location.href = "view.jsp?num=<%=num%>";
		</script>
	<%}else{%>
		<p>
			글 저장실패!
			<a href="new-form.jsp">다시작성</a>
		</p>
	<%}%>
</div>
</body>
</html>