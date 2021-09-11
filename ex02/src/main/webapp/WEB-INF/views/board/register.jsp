<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="/WEB-INF/views/includes/header.jsp" %>

	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">게시글 등록</h1>
		</div>
	</div>
	
	 <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">게시글 등록</div>
                        
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <form role="form" action="register" method="post" id="frm">
										                                      
                                        <div class="form-group" >
                                            <label>글제목</label>
                                            <input class="form-control" name="title" id="title">
                                            <p class="help-block">글제목을 입력해주세요.</p>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label>내용</label>
                                            <textarea class="form-control" rows="3" name="content" id="content"></textarea>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label>작성자</label>
                                            <input class="form-control" placeholder="Enter text" name="writer" id="writer">
                                        </div>
                                        
                                        <button type="button" class="btn btn-default" id="btnRegister">등록</button>
                                        <button type="reset" class="btn btn-default">취소</button>
                                    </form>
                                    <!-- 글등록과 파일첨부 기능을 분리 시킴 -->
                                         <div class="form-group">
                                            <label>파일첨부</label>
                                            <input type="file" placeholder="Enter text" name="uploadFile" id="uploadFile" multiple="multiple">
                                            	<button type ="button" id="uploadBtn">첨부파일 등록</button>
                                            <ul id ="uploaded"></ul>
                                        </div>
                                </div>
                              	<!-- div class="row">
                              		<div class="col-lg-12">
                              			<div class="panel panel-default">
                              				<div class="panel-heading">File Attach</div>
                              					/.panel-heading
                              					<div class="panel-body">
                              						<div class="form-group uploadDiv">
                              							<input type="file" name="uploadFile">
                              						</div>
                              					</div>
                              			</div>
                              		</div>
                              	</div> -->
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
 <!-- jQuery -->
<script>
	$(function(){
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$"); //정규표현식
		var maxSize = 5242880; //5MB

		function checkExtension(fileName, fileSize) {

			if (fileSize >= maxSize) {
				alert("파일 사이즈 초과");
				return false;
			}

			if (regex.test(fileName)) {
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}
			return true;
		}
		
		$("#uploadBtn").on("click",function(){
			
			let formData = new FormData(document.frm); //document는 name을 받아와야한다.
			
			let inputFile = $("input[ name='uploadFile']");
			
			let files =inputFile[0].files;
			
			console.log(files);
			for(i=0; i <files.length; i++){
				if(! checkExtension(files[i].name, files[i].size))
					return;
				formData.append("uploadFile", files[i]); 
			}
			// 추가되야될것은 formData
			$.ajax({
				processData : false,
				contentType: false,
				url: "../uploadAjaxAction",
				method : "post",
				data: formData,
				success : function(datas){
					var str = "";
					for(i = 0; i < datas.length; i++) {
						var obj = datas[i];
						var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);			      
					    var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
					      
						str += "<li "
						str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
						str += "<span> "+ obj.fileName+"</span>";
						str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
						str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
						str += "<img src='../resources/img/attach.png'></a>";
						str += "</div>";
						str +"</li>";
						
						
					}
					$("#uploaded").html(str);
					alert("업로드 완료");
				}
			});
		});
		
		//등록버튼 이벤트
		$("#btnRegister").on("click", function(e){
			e.preventDefault();
			var str = "";
			$("#uploaded li").each(function(i, obj){
				var jobj = $(obj); //j쿼리 객체를 감싸면 됨.

				str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
		      	str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
		      	str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
		      	str += "<input type='hidden' name='attachList["+i+"].fileType' value='1'>"; //jobj.data("type")+"'>";
			});
			$("#frm").append(str).submit();
		});
	});
</script>		
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>	