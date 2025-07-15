<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//DB에 저장되어 있었던 nick name이라고 가정하자
	String nickName = "짱구";

	String gender = "man";
	
	String job = "developer"; 
	
	String comment = "좋은 하루 되세요\n 어쩌구...\n 저쩌구...\n\t 들여쓰기";
	
	String hobbys = "[\"game\",\"music\"]";
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/jsp/test05.jsp</title>
</head>
<body>
	<h1>어떤 정보를 수정하는 폼</h1>
	<p>
		최초 출력할 떄는 DB에 저장된 정보를 이용해서 여러가지 form 요소들을 출력해준다.
	</p>

	<form action="update.jsp" method="get">
		<div>
			<label for="nick">닉네임</label>
			<input type="text" name="nick" id="nick" value="<%=nickName %>" />	
		</div>
			
		<fieldset>
			<legend>성별</legend>
			<label>
				<input type="radio" name="gender" value="man" <%=gender.equals("man")? "checked":"" %>/>남자
			</label>
			<label>
				<input type="radio" name="gender" value="woman" <%=gender.equals("woman")? "checked":"" %>/>여자
			</label>
		</fieldset>
		
		<div>
   			<label for="job">직업</label>
    		<select id="job" name="job">
        		<option value="student"<%=job.equals("student")? "selected":"" %>>학생</option>
        		<option value="developer" <%=job.equals("developer")? "selected":"" %>>개발자</option>
        		<option value="etc"<%=job.equals("etc")? "selected":"" %>>기타</option>
    		</select>
		</div>
		
		<div>
			<label for="comment">하고 싶은 말</label>
			<br />
			<textarea name="comment" id="comment" rows="10"><%=comment %></textarea>
		</div>
		
		<fieldset>
			<legend>취미(여러개 선택가능)</legend>
			<label>
				<input type="checkbox" name="hobby" value="game" <%=hobbys.contains("game")? "checked":"" %>/>게임
			</label>
			<label>
				<input type="checkbox" name="hobby" value="sports" <%=hobbys.contains("sports")? "checked":"" %>/>운동
			</label>
			<label>
				<input type="checkbox" name="hobby" value="music" <%=hobbys.contains("music")? "checked":"" %>/>음악
			</label>
		</fieldset>
		
		<button type="submit">수정</button>
		<button type="reset">취소</button>
	</form>
	
	
</body>
</html>