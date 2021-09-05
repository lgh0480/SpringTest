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
	                <button type="button" data-oper='list' onclick="location.href='list'" class="btn btn-primary">목록</button>
	            </form>
	        </div>
	      
	    </div>
	    <!-- /.row (nested) -->
	</div>
	<!-- /.panel-body -->
	
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>