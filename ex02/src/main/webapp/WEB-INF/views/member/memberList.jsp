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
						<td><a class="move" href="get?employeeId=${member.employeeId}">${member.employeeId }</a></td>
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
		<form id="actionForm" action="memberList" method="get">
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
					<a href="register"><button type="button" class="btn btn-primary">회원등록</button></a>
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
		var bno = $(this).attr("href")
		actionForm.append('<input type="hidden" name="employId" value="'+employeeId+'">')
		actionForm.attr("action","get")
		actionForm.submit();
	});
	
	$("#pageButton a").on("click", function(e){
		e.preventDefault();
		var p = $(this).attr("href")
		$('[name="pageNum"]').val(p) 
		actionForm.submit();
	})
})
</script>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>