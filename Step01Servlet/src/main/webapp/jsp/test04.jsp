<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//context path를 HttpServletRequest 객체의 메소드를 이용해서 얻어내기.
	String cPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test04.jsp</title>
</head>
<%-- 

/Step01Servlet/jsp/xxx.jsp
Step01Servlet은 context path라고 한다.
절대 경로로 표현할 때 쓰인다.

프로젝트를 개발할 때 쓰이고, 그 이후에 context path는 변경되거나 제거된다.

JSP에 context path가 코딩되어있으면 안된다.

 --%>
 
 	<h1>context path 얻어내서 사용하기</h1>
 	<a href="../index.html">인덱스 페이지</a><br />
 	<a href="/Step01Servlet/index.html">인덱스 페이지</a><br />
 	<a href="<%=cPath %>/index.html">인덱스 페이지2</a>
 	
 	<h1>Expression Language 활용</h1>
 	<p>EL은 jsp 페이지에서 특별히 해석되는 언어이다.
 	\${이 안에 작성하는 언어가 EL이다.}</p>
 	
 	${pageContext.request.contextPath }
 	<br />
 	<a href="${pageContext.request.contextPath }/index.html">인덱스 페이지3</a>
 	<br />
 	
 	<img src="${pageContext.request.contextPath }/images/Spain.png" />
 	
 	<script>
 		//자바스크립트에서 백틱 안에 \${} 사용할 일이 있다.
 		function printMsg(msg){
 			const result = `매개변수에 전달된 내용:\${msg}`;
 			console.log(result);
 		}
 		
 	</script>
 	
<body>

</body>
</html>