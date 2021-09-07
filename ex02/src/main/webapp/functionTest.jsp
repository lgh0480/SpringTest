<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
	 	(function print(a){
			console.log("즉시 실행 "+ a);
		})(5);
	 					//선언() 실행()
		var replyService = (function(){
	 	function add(reply, callback, error){
	 		$.ajax({
	 			url : "../reply/",
	 			data : $("#replyForm").serialize(),
	 			method : "post",
	 			dataType : "json",
	 			success : function(data){
	 				if(callback) callback(data);
	 			}
	 			error : function(){
	 				if(error) error();
	 			}
	 		});
	 	} 
	 	function b() {console.log("b");}
	 	function c() {console.log("c");}
	 	return {a:a, b:b, c:c}			
	 	})();
	//print(3);
	</script>
</body>
</html>