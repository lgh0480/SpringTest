<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member 관리 </title>
</head>
<body>
	<div align="center">
		<h1>목록</h1>
		<table border="1">
			<tr>
				<th>이메일</th>
				<th>비밀번호</th>
				<th>이름</th>
				<th>전화번호</th>
			</tr>
			<c:forEach var="member" items="${memberList }">
			<tr>
				<td>${member.email }</td>
				<td>${member.password }</td>
				<td>${member.name }</td>
				<td>${member.phone }</td>
			</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>