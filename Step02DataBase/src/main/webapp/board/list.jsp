
<%@page import="org.apache.tomcat.jakartaee.commons.lang3.StringUtils"%>
<%@page import="test.dto.BoardDto"%>
<%@page import="test.dao.BoardDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

//검색 keyword 가 있는 지 읽어와 본다.
String keyword = request.getParameter("keyword");
//그냥 board로 들어오면 keyword는 null. 검색어 입력 안하면 keyword는 ""

if(keyword ==null){
	keyword="";
}


//기본 페이지 번호는 1 로 설정하고 
int pageNum = 1;
//페이지 번호를 읽어와서 
String strPageNum = request.getParameter("pageNum");
//전달되는 페이지 번호가 있다면 
if (strPageNum != null) {
	//해당 페이지 번호를 숫자로 변경해서 사용한다. 
	pageNum = Integer.parseInt(strPageNum);
}

//한 페이지에 몇개씩 표시할 것인지
final int PAGE_ROW_COUNT = 3;

//하단 페이지를 몇개씩 표시할 것인지
final int PAGE_DISPLAY_COUNT = 5;

//보여줄 페이지의 시작 ROWNUM
int startRowNum = 1 + (pageNum - 1) * PAGE_ROW_COUNT; //공차수열
//보여줄 페이지의 끝 ROWNUM
int endRowNum = pageNum * PAGE_ROW_COUNT; //등비수열 

//하단 시작 페이지 번호 (정수를 정수로 나누면 소수점이 버려진 정수가 나온다)
int startPageNum = 1 + ((pageNum - 1) / PAGE_DISPLAY_COUNT) * PAGE_DISPLAY_COUNT;
//하단 끝 페이지 번호
int endPageNum = startPageNum + PAGE_DISPLAY_COUNT - 1;
//전체 글의 갯수

/*
	StringUtils 클래스의 isEmpty() static 메소드를 이용하면 문자열이 비었는 지 
	여부를 알 수 있다.
	
	null 혹은 "" 빈문자열은 비었다고  판정된다.
	
	StringUtils.isEmpty(keyword)
	
	keyword == null or "".equals(keyword)
	
*/
int totalRow=0;
if(StringUtils.isEmpty(keyword)){
	totalRow = BoardDao.getInstance().getCount();
}else{
	totalRow = BoardDao.getInstance().getCountByKeyword(keyword);
	
}
//전체 페이지의 갯수 구하기
int totalPageCount = (int) Math.ceil(totalRow / (double) PAGE_ROW_COUNT);
//끝 페이지 번호가 이미 전체 페이지 갯수보다 크게 계산되었다면 잘못된 값이다.
if (endPageNum > totalPageCount) {
	endPageNum = totalPageCount; //보정해 준다. 
}

//dto 에 select 할 row 의 정보를 담고 
BoardDto dto = new BoardDto();
dto.setStartRowNum(startRowNum);
dto.setEndRowNum(endRowNum);

//해당 row 만 select 한다

List<BoardDto> list = null;

if(StringUtils.isEmpty(keyword)){
	list = BoardDao.getInstance().selectPage(dto);
}else{
	dto.setKeyword(keyword);
	list = BoardDao.getInstance().selectPageByKeyword(dto);
	
}
//글목록 얻어오기
//List<BoardDto> list = BoardDao.getInstance().selectAll();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board/list.jsp</title>
<jsp:include page="/WEB-INF/include/resource.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/WEB-INF/include/navbar.jsp">
		<jsp:param value="board" name="thisPage" />
	</jsp:include>

	<div class="container pt-1">
		<a class="btn btn-outline-primary btn-sm" href="new-form.jsp"> 새글
			작성 <i class="bi bi-pencil-square"></i>
		</a>
		<h1>게시글 목록 입니다.</h1>
		<div class="row my-3">
			<%-- 4/12 인 칼럼을 만들고 margin-start: auto를 부여해서 왼쪽 마진을 자동 부여한다. --%>
			<div class="col-lg-4 col-md-6 ms-auto">
			<form action="list.jsp" method="get">
				<div class="input-group">
					<input type="text" class="form-control" name="keyword" placeholder="검색어를 입력하세요" value="<%=StringUtils.isEmpty(keyword) ? "" : keyword%>"/>
					<button type="submit" class="btn btn-outline-secondary"><i class="bi bi-search"></i></button>
				</div>
				</form>
			</div>
		</div>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>글번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>조회수</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (BoardDto tmp : list) {
				%>
				<tr>
					<td><%=tmp.getNum()%></td>
					<td><%=tmp.getWriter()%></td>
					<td><a href="view.jsp?num=<%=tmp.getNum()%>"><%=tmp.getTitle()%></a>
					</td>
					<td><%=tmp.getViewCount()%></td>
					<td><%=tmp.getCreatedAt()%></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>

		<ul class="pagination justify-content-center">
			
			<%if (startPageNum != 1) {%>
			<li class="page-item"><a class="page-link" href="list.jsp?pageNum=<%=startPageNum - 1%>&keyword=<%=keyword%>">&lsaquo;</a></li>
			<%}%>

			
			<%for (int i = startPageNum; i <= endPageNum; i++) {%>
			<li class="page-item"><a class="page-link <%=i == pageNum ? "active" : ""%>"
				href="list.jsp?pageNum=<%=i%>&keyword=<%=keyword%>"><%=i%></a></li>
			<%}%>

			
			<%if (endPageNum < totalPageCount) {%>
			<li class="page-item"><a class="page-link" href="list.jsp?pageNum=<%=endPageNum + 1%>&keyword=<%=keyword%>">&rsaquo;</a></li>
			<%}%>
			
			
		</ul>

	</div>
</body>
</html>




