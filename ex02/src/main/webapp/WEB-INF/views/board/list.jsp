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
			<h1 class="page-header">게시판</h1>
		</div>
		<!-- /.col-lg-12 -->
		<table class="table" id="board">
			<thead>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<!-- <th>글내용</th> -->
					<th>작성자</th>
					<th>날짜</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach var="board" items="${list}">
					<tr>
						<td>${board.bno }</td>
						<td><a class="move" href="${board.bno }">${board.title } (${board.replyCnt })</a></td>
						<%-- <td>${board.content }</td> --%>
						<td>${board.writer}</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${board.regdate }" /></td>
					</tr>
				</c:forEach>
			</tbody>	
		</table>
		<form id="actionForm" action="list" method="get">
		<select name="type">		
			<option value="" ${pageMaker.cri.type ==null ? 'selected' : "" }>선택</option>
			<option value="T" ${pageMaker.cri.type =='T' ? 'selected' : "" }>제목</option>
			<option value="C" ${pageMaker.cri.type =='C' ? 'selected' : "" }>내용</option>
			<option value="W" ${pageMaker.cri.type =='W' ? 'selected' : "" }>작성자</option>
			<option value="TC"${pageMaker.cri.type =='TC' ? 'selected' : "" } >제목 or 내용</option>
			<option value="TW"${pageMaker.cri.type =='TW' ? 'selected' : "" } >제목 or 작성자</option>
			<option value="TWC"${pageMaker.cri.type =='TWC' ? 'selected' : "" } >제목 or 내용 or 작성자</option>
			
		</select>
			<input name="keyword" value="${pageMaker.cri.keyword}">
			<input type="hidden" name="pageNum" value="1">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
			<button class="btn btn-default">검색</button>
		</form>
	<div id="pageButton">			
		<c:if test="${pageMaker.prev }"><a href="${pageMaker.startPage -1}">이전</a></c:if>
		
		<c:forEach begin="${pageMaker.startPage }" 
				   end="${pageMaker.endPage }" var="num"><a href="${num}">${num}</a>
	    </c:forEach>
		
		<c:if test="${pageMaker.next }"><a href="${pageMaker.endPage +1}" >다음</a></c:if>
	</div>	
		<div class="justify-content-md-center">
			<div class="col-4">
				<a href="register"><button type="button" class="btn btn-primary">등록</button></a>
			</div>
		</div>
	</div>
<script>
$(function(){
	var actionForm = $("#actionForm")
	
	$(".move").on("click", function(e){
		e.preventDefault();
		var bno = $(this).attr("href")
		actionForm.append('<input type="hidden" name="bno" value="'+bno+'">')
		actionForm.attr("action","get")
		actionForm.submit();
	});
	$("#pageButton a").on("click", function(e){
		e.preventDefault(); //a, submit 내가 정의한 펑션을 지정할때 
		var p = $(this).attr("href")
		$('[name="pageNum"]').val(p)
		actionForm.submit();
	})
	//$("#board").DataTable();
})
</script>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>