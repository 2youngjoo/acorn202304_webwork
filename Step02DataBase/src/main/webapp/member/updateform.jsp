<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. 수정할 회원의 번호를 얻어낸다.
	int num=Integer.parseInt(request.getParameter("num"));
	// 2. 번호를 이용해서 DB에 저장된 수정할 회원의 정보를 얻어낸다.
	MemberDto dto=MemberDao.getInstance().getData(num);
	// 3. 수정할 양식을 클라이언트에게 응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/member/updateform.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<h1>회원 정보 수정 양식</h1>
		<form action="update.jsp" method="post">
			<div>
				<label for="num">번호</label>
				<input type="text" id="num" name="num" value="<%=dto.getNum()%>" readonly/>
			</div>
			<div>
				<label for="num">이름</label>
				<input type="text" id="name" name="name" value="<%=dto.getName()%>"/>
			</div>
			<div>
				<label for="num">주소</label>
				<input type="text" id="addr" name="addr" value="<%=dto.getAddr()%>"/>
			</div>
			<button type="submit">수정 확인</button>
			<button type="reset">취소</button>
		</form>
	</div>
</body>
</html>

