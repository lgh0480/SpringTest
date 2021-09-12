<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

</head>
<body>
		<div>
			<table class="table" id="board" border="1">
				<thead>
					<tr>
						<th>사원번호</th>
						<th>성</th>
						<th>이름</th>
						<th>이메일</th>
						<th>휴대폰번호</th>
						<th>입사일</th>
						<th>부서아이디</th>
						<th>급여</th>
						<th>보너스</th>
						<th>직장상사</th>
						<th>부서번호</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="emp" items="${empList}">
						<tr>
							<td><a class="move" href="${emp.employeeId}">${emp.employeeId }</a></td>
							<td>${emp.firstName }</td>
							<td>${emp.lastName }</td>
							<td>${emp.email }</td>
							<td>${emp.phoneNumber}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${emp.hireDate }" /></td>
							<td>${emp.jobId}</td>
							<td>${emp.salary}</td>
							<td>${emp.commissionPct}</td>
							<td>${emp.managerId}</td>
							<td>${emp.departmentId}</td>
						</tr>
					</c:forEach>
				</tbody>	
			</table>
			<form id="actionForm" action="empList" method="get">
				<select name="type">		
					<option value="" ${pageMaker.cri.type ==null ? 'selected' : "" }>선택</option>
					<option value="E" ${pageMaker.cri.type =='E' ? 'selected' : "" }>사원번호</option>
					<option value="L" ${pageMaker.cri.type =='L' ? 'selected' : "" }>이름</option>
					<option value="P" ${pageMaker.cri.type =='P' ? 'selected' : "" }>휴대전화번호</option>
					<option value="D" ${pageMaker.cri.type =='D' ? 'selected' : "" }>부서번호</option>
					<option value="EL"${pageMaker.cri.type =='EL' ? 'selected' : "" } >사원번호 or 이름</option>
					<option value="EP"${pageMaker.cri.type =='EP' ? 'selected' : "" } >사원번호 or 휴대전화번호</option>
					<option value="ED"${pageMaker.cri.type =='ED' ? 'selected' : "" } >사원번호 or 부서번호</option>
					<option value="ELPD"${pageMaker.cri.type =='ELPD' ? 'selected' : "" } >사번or 이름 or 휴대전화번호 or 부서번호</option>
			
				</select>	
					<input name="keyword" value="${pageMaker.cri.keyword}">
					<input type="hidden" name="pageNum" value="1">
					<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
					<button class="btn btn-default">검색</button>
			</form>
			
			<div class="justify-content-md-center">
				<div class="col-4">
					<a href="empInsertForm"><button type="button" class="btn btn-primary">회원등록</button></a>
				</div>
			</div>
				<div class='pull-right' id="pageButton">
				
				<ul class="pagination">
					<c:if test="${pageMaker.prev }">
						<li class="paginate_button previous"><a href="${pageMaker.startPage -1}">이전</a></li>
					</c:if>
				
				
				<c:forEach begin="${pageMaker.startPage }" 
					   	   end="${pageMaker.endPage }" var="num">
					   <li class="paginate_button"><a href="${num}">${num}</a></li>
		    	</c:forEach>
		    	
		    	<c:if test="${pageMaker.next }">
		    			<li class="paginate_button next"><a href="${pageMaker.endPage +1}" >다음</a></li>
		    	</c:if>
		    	</ul>
			</div>
		</div>
		
<script>
$(function(){
	//$("#board").DataTable();
	var actionForm = $("#actionForm")
		$(".move").on("click", function(e){
		e.preventDefault();
		var employeeId = $(this).attr("href")
		actionForm.append('<input type="hidden" name="employeeId" value="'+employeeId+'">')
		actionForm.attr("action","updateEmp")
		actionForm.submit();
	});
	
	$("#pageButton a").on("click", function(e){
		e.preventDefault();
		var p = $(this).attr("href")
		$('input[name="pageNum"]').val(p) 
		actionForm.submit();
	})
})
</script>		
</body>
</html>