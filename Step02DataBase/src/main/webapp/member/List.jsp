<%@page import="test.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="test.dao.MemberDao"%>
<%@page import="test.util.DbcpBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	MemberDao dao = new MemberDao();
	
	List<MemberDto> list = dao.selectAll();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List.jsp</title>
<jsp:include page="/WEB-INF/include/resource.jsp"></jsp:include>

</head>
<body>

	<jsp:include page="/WEB-INF/include/navbar.jsp">
		<jsp:param value="member" name="thisPage"/>
	</jsp:include>

	<ul>
		<li><a href="${pageContext.request.contextPath }/member/insertform.jsp">회원추가</a></li>
	</ul>
	<br />
		<div class="container">
        <h1>회원 목록</h1>
        <table class="table table-striped">
            <thead class="table-dark">
                <tr>
                    <th>번호</th>
                    <th>이름</th>
                    <th>주소</th>
                    <th>수정</th>
                    <th>삭제</th>
                </tr>
            </thead>
            <tbody>
               <%for (MemberDto tmp : list) {%>
        		<tr>
        			<td><%=tmp.getNum()%></td>
        			<td><%=tmp.getName()%></td>
        			<td><%=tmp.getAddr()%></td>
        			<td><a href="updateform.jsp?num=<%=tmp.getNum()%>">수정</a></td>
        			<td><a href="javascript:" class="deleteLink" data-num="<%=tmp.getNum()%>">삭제</a></td>
        			
           		</tr>
       		 	<%}%>
       
            </tbody>
        </table>
    </div>
    <jsp:include page="/WEB-INF/include/footer.jsp"></jsp:include>
    
    <script>
    
    document.querySelectorAll(".deleteLink").forEach(item => {
        item.addEventListener("click", (e) => {
            
            const num = e.target.getAttribute("data-num");
            const isDelete = confirm(num + "번 회원을 삭제 하시겠습니까?");
            
            if(isDelete) {
                location.href = "${pageContext.request.contextPath }/member/delete.jsp?num=" + num;
            }
        });
    });
    </script>
</body>
</html>