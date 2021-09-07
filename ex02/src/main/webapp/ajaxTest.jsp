<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajaxTest.jsp</title>
  <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>

</head>
<body>
	<input name ="writer" id="writer">
	
	<button type="button" id="btn1">문자열</button>
	<button type="button" id="btn2">파라미터</button>
	<input name ="content" id="content">
	<div id="result"></div>

<script>
	$(function(){ //page ready 이벤트 페이지가 준비되면 실행해라
	//$("#result").html("bbbbbb");
	//$("#btn1").click(function(){})
	
	//addEvnetListener와 동일 , 이벤트 여러개 추가 가능
	$("#btn1").on("click", function(){
		$.ajax({
			url : "ajax1",
			method : "get",
			data : {writer : $("#writer").val()},
			//async : false, //동기식
			dataType : "json", 	// plain(String ), json, xml 
			success : function(r){
				$("#result").append(r.content+"<br>");
				$("#result").append(r.writer+"<br>");
			}
			
		});// end $.ajax
		$('#result').append("클릭됨<br>");
	}) //btni click end
	//ajax2 test2
	$("#btn2").on("click", function(){
		$.ajax({
			url : "ajax2",
			method : "post",
			data : JSON.stringify( {writer : $("#writer").val() } ),
			//async : false, //동기식
			contentType : "application/json",
			dataType : "json", 	// plain(String ), json, xml 
			success : function(data){
				//$("#result").append($("<p>").html(data.content));
				$("#result").append($(`<p>\${data.writer}<br> \${data.content}</p>`));
				//$("#result").append($('<p>'+data.content+'</p>'))
			}
			
		});// end $.ajax
		//$('#result').append("클릭됨<br>");
	}) //btni click end
	
/* 	$("#btn1").on("click", function(){
		alert("두번");
	}) //btni click end */
	//btn1.click = function(){} //값이 하나밖에 안들어감
	
	//그룹 이벤트 : 위임 -> 동적으로 추가될 태그에도 미리 이벤트 지정
	// 부모태그에 이벤트 지정
	$("#result").on("click","p" , function(){
		$(this).remove();
	})
	
	});// end of $(function(){}

</script>

</body>
</html>