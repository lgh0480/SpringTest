<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="/WEB-INF/views/includes/header.jsp" %>

<!-- DataTables CSS -->
    <link href="${pageContext.request.contextPath}/resources/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

<!-- DataTables Responsive CSS -->
    <link href="${pageContext.request.contextPath}/resources/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">
	<!-- DataTables JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
 	  <script src="${pageContext.request.contextPath}/resources/vendor/datatables-responsive/dataTables.responsive.js"></script>
    
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">사원정보</h1>
		</div>
		<!-- /.col-lg-12 -->
		<table class="table" id="board">
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
				<c:forEach var="member" items="${memberList}">
					<tr>
						<td><a href="get?employeeId=${board.bno }">${member.employeeId }</a></td>
						<td>${member.firstName }</td>
						<td>${member.lastName }</td>
						<td>${member.email }</td>
						<td>${member.phoneNumber}</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${member.hireDate }" /></td>
						<td>${member.jobId}</td>
						<td>${member.salary}</td>
						<td>${member.commissionPct}</td>
						<td>${member.managerId}</td>
						<td>${member.departmentId}</td>
					</tr>
				</c:forEach>
			</tbody>	
		</table>
		<div class="justify-content-md-center">
			<div class="col-4">
				<a href="register"><button type="button" class="btn btn-primary">회원등록</button></a>
			</div>
		</div>
	</div>
<script>
$(function(){
	$("#board").DataTable();
})
</script>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>