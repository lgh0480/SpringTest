<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<c:forEach items="${empList }" var="emp">
		<div class="emp">
			<span>${emp.employeeId }</span>
			<span>${emp.firstName}, ${emp.lastName}</span>
			<span>${emp.email}</span>
		</div>
	</c:forEach>
<script>
	$(function(){
		$(".emp").on("click",function(){
			var span = $(this).find("span");
			$("#managerId").val(span.eq(0).text());
			$("#name").val(span.eq(1).text());
			$("#empModal").modal('hide');		
		});
	});
</script>	
</body>
</html>