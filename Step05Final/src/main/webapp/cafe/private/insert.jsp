<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 폼 전송되는 title 읽어온다
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	// 글의 작성자 얻어내기
	String writer=(String)session.getAttribute("id");
	// 글의 정보를 CafeDto에 담고
	CafeDto dto = new CafeDto();
	dto.setWriter(writer);
	dto.setTitle(title);
	dto.setContent(content);
	// DB에 저장하고 응답하기
	boolean isSuccess=CafeDao.getInstance().insert(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/insert.jsp</title>
</head>
<body>
	<div class="container">
		<%if(isSuccess){ %>
			<p>
				저장했습니다.
				<a href="${pageContext.request.contextPath }/cafe/list.jsp">목록보기</a>
			</p>
		<%}else{ %>
			<p>
				저장 실패!
				<a href="insertform.jsp">다시 작성</a>
			</p>
		<%} %>
   </div>	
</body>
</html>

