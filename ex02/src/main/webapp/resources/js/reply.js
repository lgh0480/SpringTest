/* webapp/resources/js/reply.js */

let replyService = (function() {
	//등록
	function add(callback, error) {
		$.ajax({
			url: "../reply/",
			data: $("#replyForm").serialize(),
			method: "post",
			dataType: "json",
			success: function(data) {
				if (callback) callback(data);
			},
			error: function() {
				if (error) error();
			}
		});
			
	}
		function getList(param, callback, error){
			$.ajax({
				url: "../reply/",
				data : {bno:bno} , //"bno=524295"
				dataType : "json",
				success: function(data) {if (callback) callback(data); },
				error: function() {if (error) error();   }
			});
		}
		return {add:add, getList:getList}
	})(); 