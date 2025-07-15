
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//1. form 전송되는 숫자를 읽어와서 실제 정수로 만들어준다.
	int num = Integer.parseInt(request.getParameter("inputNum"));
	//2. 해당 숫자가 짝수이면 "전송한 숫자 x는 짝수입니다." 출력.
	//   해당 숫자가 홀수면 "전송한 숫자 x는 홀수입니다."
	//	콘솔이 아닌 클라이먼트 웹브라우저에 출력하는 프로그래밍 해볼 것.
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/jsp/save.jsp</title>
</head>
<body>

	<h3>if else문을 이용</h3>
	<%if(num%2==0){ %>
	<p>입력한 숫자 <%=num %>은 짝수입니다</p>
	<%}else{ %>
	<p>입력한 숫자 <%=num %>은 홀수입니다</p>
	<%} %>

	<h3>3항 연산자 이용</h3>
	<p>입력한 숫자 <%=num %>은 <%=num%2==0?"짝수":"홀수" %>입니다</p>

	
</body>
</html>