<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커스텀 로그인 </title>
</head>
<body>
	<div align="center">
		<h1>커스텀로그인</h1>
		<form action="login" method="post">
			<input type="text" name="${_csrf.parameterName }" value="${_csrf.token }" >
			<input name="id">
			<input name="password">
			<button>로그인</button>
		</form>
	</div>
	
</body>
</html>