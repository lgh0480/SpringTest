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
			
			<input type="hidden" name="replycnt" value="${list.replyCnt}">
			<input name="replyer" value="user10">
			<input name="reply">
			<button type="button" id="saveReply">댓글등록</button>
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
			<!-- 페이징 추가 -->
			<div class="panel-footer"></div>
		</div>
	</div>
<script>
	let bno ="${board.bno}"
	$(function(){
		//등록처리
		$("#saveReply").on("click", function(){
			$.ajax({
				url : "../reply/", //method(or type):"get"
				method : "post",
				data :$("#replyForm").serialize(),
				dataType : "json",
				success : function(data){
					console.log(data);
					$(".chat").append ( makeLi(data) ) ;
				}
			
			})
		});
		
		//페이징 처리
		let pageNum = 1;
		let replyPageFooter = $(".panel-footer");
		let replyCnt = $(".replycnt").val();
		function ShowReplyPage(replyCnt) {
			
			let endNum = Math.ceil(pageNum / 10.0 ) * 10 ;
			let startNum = endNum - 9;

			let prev = startNum != 1;
			let next = false;

			if(endNum * 10 >= replyCnt){
				endNum = Math.ceil(replyCnt/10.0);
			}
			if(endNum * 10 < replyCnt){
				next = true;
			}

			var str ="<ul class='pagination pull-right'>";

			if(prev) {
				str +="<li class='page-item'><a class='page-link'href='"+(startNum - 1)+ "'>이전</a></li>";

			}

			for(let i = startNum ; i <= endNum; i++){
				let active = pageNum == i? "active":"";

				str+= "<li class='page-item "+active+"'><a class='page-link'href='"+i+"'>"+i+"</a></li>";

			}
			if(next){
				str+= "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>다음</a></li>";
			}
			str += "</ul></div>";

			console.log(str);

			replyPageFooter.html(str);
		}
		//
		function makeLi(data){
			return '<li class="left clearfix">'
					+ '	<div class="header">'
					+ '		<strong class="primary-font">'+ data.replyer +'</strong>'
					+ '			<small class="pull-right text-muted">'+data.replyDate +'</small>'
					+ '   	</div>'
					+ '	<p>'+ data.reply +'</p>'
					+ '	</li>	';
		}
		
		//목록조회
		$.ajax({
			url: "../reply/", //method(or type):"get"
			data : {bno:bno} , //"bno=524295"
			dataType : "json", //응답결과가 json
			success: function(datas){
				console.log(datas);
				str = "";
				for(i=0; i<datas.length; i++){
					str += makeLi(datas[i]);
			}
			$('.chat').html(str);
			
			ShowReplyPage(replyCnt);
			}
		});	
		
	})
	
	</script>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>