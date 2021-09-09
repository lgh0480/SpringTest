<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="frm">
	<div>
		<input type="text" name="writer" />
		<input type="text" name="content" />
	</div>
	</form>
		<input type="file" name="uploadFile" multiple="multiple"/>
	<button type="button" id="uploadBtn">업로드</button>
  <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>	
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
				url: "uploadAjaxAction",
				method : "post",
				data: formData,
				success : function(result){
					alert("업로드 완료");
				}
			});
		});
	});
</script>	
</body>
</html>