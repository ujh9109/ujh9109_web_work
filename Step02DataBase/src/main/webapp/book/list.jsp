<%@page import="test.dto.BookDto"%>
<%@page import="java.util.List"%>
<%@page import="test.dao.BookDao"%>
<%@page import="test.util.DbcpBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	BookDao dao = new BookDao();
	
	List<BookDto> list = dao.selectAll();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list.jsp</title>
<jsp:include page="/WEB-INF/include/resource.jsp"></jsp:include>


</head>
<body>
	<jsp:include page="/WEB-INF/include/navbar.jsp">
		<jsp:param value="book" name="thisPage"/>
	</jsp:include>

	<ul>
		<li><a href="${pageContext.request.contextPath }/book/insertform.jsp">책 추가</a></li>
	</ul>
	<br />
	<div class="container">
        <h1>책 목록</h1>
        <table class="table table-striped">
            <thead class="table-dark">
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>저자</th>
                    <th>출판사</th>
                    <th>수정</th>
                    <th>삭제</th>
                </tr>
            </thead>
            <tbody>
               <%for (BookDto tmp : list) {%>
        		<tr>
        			<td><%=tmp.getNum()%></td>
        			<td><%=tmp.getTitle()%></td>
        			<td><%=tmp.getAuthor()%></td>
        			<td><%=tmp.getPublished_at()%></td>
        			<td><a href="updateform.jsp?num=<%=tmp.getNum()%>">수정</a></td>
        			<td><a href="${pageContext.request.contextPath }/book/delete.jsp?num=<%=tmp.getNum()%>">삭제</a></td>
        			
           		</tr>
       		 	<%}%>
       
            </tbody>
        </table>
    </div>
    <jsp:include page="/WEB-INF/include/footer.jsp"></jsp:include>
</body>
</html>