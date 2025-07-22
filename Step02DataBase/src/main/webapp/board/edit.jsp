<%@page import="test.dto.BoardDto"%>
<%@page import="test.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	int num = Integer.parseInt(request.getParameter("num"));
	BoardDto dto = BoardDao.getInstance().getByNum(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>edit.jsp</title>
<jsp:include page="/WEB-INF/include/resource.jsp"></jsp:include>
<!-- Toast UI Editor CSS -->
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
    
<!-- Toast UI Editor JS -->
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
    
<!-- 한국어 번역 파일 추가 -->
<script src="https://uicdn.toast.com/editor/latest/i18n/ko-kr.js"></script>
</head>
<body>
	<div class="container pt-3">
	<nav aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="${pageContext.request.contextPath }/">Home</a></li>
				<li class="breadcrumb-item"><a href="list.jsp">Board</a></li>
				<li class="breadcrumb-item active" aria-current="page">Edit</li>
			</ol>
		</nav>
		<h1>글 수정 페이지</h1>
		
		<form action="update.jsp?num=<%=dto.getNum() %>" method="post" id="editForm">
			<div>
				<label class="form-label" for="num">글번호</label>
				<input class="form-control" type="text" name="num" id="num" readonly />
			</div>
			<div>
				<label class="form-label" for="writer">작성자</label>
				<input class="form-control" type="text" name="writer" id="writer" readonly />
			</div>
			<div>
				<label class="form-label" for="title">제목</label>
				<input type="text" class="form-control" name="title" id=title value="<%=dto.getTitle() %>" />
			</div>
			<div>
				<label class="form-label" for="editor">내용</label>
				<div class="editor" id="editor"></div>
				<textarea class="form-control" name="content" id="hiddenContent"></textarea>
			</div>
			
			<button class="btn btn-success btn-sm" type="submit">수정</button>
			<button class="btn btn-danger btn-sm" type="reset">취소</button>
		</form>
		<script>
		//위에 toast ui javascript가 로딩 되어있으면 toastui.Editor 클래스 사용 가능
		//해당 클래스를 이용해서 객체 생성하면서 {} object로 ui에 관련된 옵션을 잘 전달하면
		//우리가 원하는 모양의 텍스트 편집기를 만들 수 있다.
		const editor = new toastui.Editor({
			el: document.querySelector('#editor'),
		    height: '500px',
		    initialEditType: 'wysiwyg',
		    previewStyle: 'vertical',
		    language: 'ko',
		    initialValue: `<%=dto.getContent()%>`
		});
		
		document.querySelector('#editForm').addEventListener("submit", (e)=>{
			//에디터로 작성된 문자열 읽어오기
			const content = editor.getHTML();
			//테스트로 콘솔에 출력하기
			console.log(content);
			//에디터로 작성된 문자열을 폼 전송이 될수 있도록 textarea 의 value 로 넣어준다.
			document.querySelector("#hiddenContent").value=content;
			
			//테스트 하기 위해 폼 전송 막기
			//e.preventDefault();
			
			//폼전송을 막지 않으면 전송이 된다.
		
		})
	</script>
	</div>
</body>
</html>