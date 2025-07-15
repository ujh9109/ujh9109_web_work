<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//폼 전송되는 수정할 회원의 정보 추출하기.
	String nick = request.getParameter("nick");
	String gender = request.getParameter("gender");
	String job = request.getParameter("job");
	String comment = request.getParameter("comment");
	
	//취미정보는 넘어오지 않을 수도 있고, 혹은 1개에서 3개가 넘어올 수도 있다.
	String[] hobbys = request.getParameterValues("hobby");
	//스트링 배열에 들어있는 데이터들은 JSON 문자열로 변환 후에 DB에 저장한다.
	
	
	
	System.out.println("nick:"+nick);
	System.out.println("gender:"+gender);
	System.out.println("job:"+job);
	System.out.println("comment:"+comment);
	
	if(hobbys != null){
		for(String tmp:hobbys){
			System.out.println("hobby:"+tmp);
		}
	}else{
		System.out.println("취미를 선택하지 않았습니다.");
	}
	
	/*
		다운로드해서 lib 폴더에 넣은 gson.jar 파일에 포함된 클래스로 생성된 객체를 이용해서
		String 배열에 저장된 문자열을 Json 문자열로 변환하기.
	*/
	
	if(hobbys != null){
		Gson gson = new Gson();
		String result = gson.toJson(hobbys);
		System.out.println(result);
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/jsp/update.jsp</title>
</head>
<body>
	<p>회원 정보를 수정했습니다.</p>
</body>
</html>