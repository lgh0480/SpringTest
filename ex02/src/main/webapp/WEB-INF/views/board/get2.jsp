<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="/WEB-INF/views/includes/header.jsp" %>

	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">게시글 상세보기</h1>
		</div>
	</div>	
	<div class="panel-body">
	    <div class="row">
	        <div class="col-lg-6">
	            <form role="form" action="modify" method="post">
	              <%--   <input type="hidden" name="pageNum" value="${cri.pageNum }">
					<input type="hidden" name="amount" value="${cri.amount }"> --%>
	                
	                <div class="form-group" >
	                    <label>번호</label>
	                    <input class="form-control" name="bno" id="bno"
	                    	value='<c:out value="${board.bno }"/>' readonly="readonly" >
	                    <p class="help-block">글제목을 입력해주세요.</p>
	                </div>
	                        
	                <div class="form-group" >
	                    <label>글제목</label>
	                    <input class="form-control" name="title" id="title"
	                    	value='<c:out value="${board.title }"/>' >
	                    <p class="help-block">글제목을 입력해주세요.</p>
	                </div>
	                
	                <div class="form-group">
	                    <label>내용</label>
	                    <textarea class="form-control" rows="3" name="content" id="content"><c:out value="${board.bno }"/></textarea>
	                </div>
	                
	                <div class="form-group">
	                    <label>작성자</label>
	                    <input class="form-control" placeholder="Enter text" name="writer" id="writer"value='<c:out value="${board.bno }"/>'>
	                </div>
	                
	                <button type="submit" data-oper='modify' class="btn btn-default">수정</button>
	                <button type="submit" data-oper='remove' formaction="delete" class="btn btn-danger">삭제</button>
	                <a class="btn btn-primary" href="list?pageNum=${cri.pageNum}&amount=${cri.amount}">목록으로</a>
	            </form>
	        </div>
	      
	    </div>
	    <!-- /.row (nested) -->
	</div>
	<!-- 댓글 등록  -->
	<div class="panel-heading">
		<form id="replyForm" action="" method="post">
			<input type="hidden" name="bno" value="${board.bno}">
			<input name="replyer" value="user10">
			<input name="reply">
			<button type="button" id="saveReply" class="btn btn-default">댓글등록</button>
		</form>
	</div>
	<!-- 댓글 목록 -->
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">댓글</h1>
			<ul class="chat">
				<li class="left clearfix">
					<div class="header">
						<strong class="primary-font">작성자</strong>
						<small class="pull-right text-muted">시간</small>
					</div>
					<p>내용</p>
				</li>					
			</ul>
		</div>
	</div>
<script src="../resources/js/reply.js">

</script>
<script>
	let bno ="${board.bno}";
	$(function(){
		//등록처리
		$("#saveReply").on("click", function(){
			replyService.add( function (data){
				$('.chat').append( makeLi(data) );
			}) ;
		
		});
		
		
		//목록조회
		replyService.getList({bno:bno}, listCallback);
		
		//목록 콜백함수
		function listCallback(datas){
			str = "";
			for(i=0; i<datas.length; i++){
				str += makeLi(datas[i]);
				}
				$('.chat').html(str);
			}
		//댓글 태그 만들기
		function makeLi(data){
			return '<li class="left clearfix">'
					+ '	<div class="header">'
					+ '		<strong class="primary-font">'+ data.replyer +'</strong>'
					+ '			<small class="pull-right text-muted">'+data.replyDate +'</small>'
					+ '   	</div>'
					+ '	<p>'+ data.reply +'</p>'
					+ '	</li>	';
		}
	});

	</script>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>