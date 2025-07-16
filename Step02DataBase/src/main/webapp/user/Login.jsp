<%@page import="java.net.URLEncoder"%>
<%@page import="org.mindrot.jbcrypt.BCrypt"%>
<%@page import="test.dao.UserDao"%>
<%@page import="test.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//폼 전송되는 아이디와 비밀번호 추출하기
	String userName = request.getParameter("userName");
	String password = request.getParameter("password");
	
	//로그인 후에 가야할 목적지 정보
	String url = request.getParameter("url");
	//로그인 실패를 대비해서 목적지 정보를 인코딩한 결과도 준비한다.
	String encodedUrl = URLEncoder.encode(url, "UTF-8");
	
	boolean isValid = false;
	
	//db에서 userName을 이용해서 select 되는 정보가 있는지 select 해본다.
	UserDto dto = new UserDao().getByUserName(userName);
	//만일 select 되는 정보가 있다면(최소 userName은 존재)
	if(dto !=null){
		//raw 비밀번호와 DB에 저장된 암호화된 비밀번호를 비교해서 일치 하는 지 확인한다.
		//BCrypt.checkpw(입력한 비밀번호, 암호화된 비밀번호)
		isValid = BCrypt.checkpw(password, dto.getPassword());
	}
	
	/*
		만일 입력한 아이디와 비밀번호가 유효한 정보라면 로그인 처리를 한다.
		
		jsp에서 기본 제공해주는 HttpSession 객체에 userName을 저장한다.
		
		HttpSession 객체에 저장하면 응답을 한 이후에 다음 번 요청에서 
		HttpSession 객체에 저장된 정보를 읽어올 수 있다.
		
		세션 객체에 담긴 정보는 어떤 요청도 하지 않고 일정 시간이 흐르면 자동 삭제된다.
		
		필요하다면(로그아웃이 요청되면) 강제로 세션 객체에 담긴 정보를 삭제할 수도 있따.
		
		세션 객체에 담긴 로그인 정보를 삭제하는 것이 "로그아웃".
		세션객체에 로그인 정보(userName)을 저장하는 것이 "로그인"
	*/
	if(isValid){
		//HttpSession 객체에 "userName"이라는 키 값으로 userName을 저장한다.
		session.setAttribute("userName", userName);
		//세션 유지시간 설정(초단위)
		session.setMaxInactiveInterval(60*10); //설정하지 않으면 기본 30분
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login.jsp</title>
</head>
<body>
	<div class="container">
		<%if(isValid){%>
			<p>
				<strong><%=userName %></strong> 회원님 로그인 되었습니다.
				<a href="<%=url %>">확인</a>
				
			</p>
		<%}else{ %>
			<p>
				아이디 혹은 패스워드를 확인하세요!
				<a href="Loginform.jsp?url=<%=encodedUrl %>">다시 로그인</a>
			</p>
		<%} %>
	</div>
</body>
</html>