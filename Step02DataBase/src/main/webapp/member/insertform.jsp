<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertform.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<body>
	<div class="container">
		<h1>회원 정보 추가 양식</h1>
		<form action="insert.jsp" method="post">
			<div class="mb-2">
				<label class="form-label" for="name">이름</label>
				<input class="form-control" type="text" name="name" id="name"/>
				<div class="form-text">10글자 이내로 입력해주세요.</div>
			</div>
			<div class="mb-2">
				<label class="form-label" for="addr">주소</label>
				<input class="form-control" type="text" name="addr" id="addr"/>
				<div class="form-text">실제 거주하는 주소를 입력해 주세요.</div>
			</div>
			
			<button class="btn btn-primary btn-sm " type="submit">
				저장
				<i class="bi bi-floppy2-fill"></i>
				<%--이미지를 글자 형식으로 만드는 이유
					1. 로딩시간이 빨라짐.
					2. 글자의 색상을 맘대로 바꿀 수 있음.
					3. 벡터로 만들어졌기 때문에 크기를 키워도 깨지지 않음.
				 --%>
			</button>
		</form>
	</div>
</body>
</html>