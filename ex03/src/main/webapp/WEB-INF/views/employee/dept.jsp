<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서관리</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">부서관리</h1>
		</div>
	</div>
	<table class="table text-center">
		<thead>
			<tr>
				<th>부서번호</th>
				<th>부서명</th>
				<th>매니저아이디</th>
				<th>지역번호</th>
			</tr>
		</thead>
		<tbody></tbody>
	</table>
	<div id="list"></div>
	
	<button class="btn btn-primary"  data-toggle="modal" data-target="#empModal">부서추가</button>
</div>	
<!-- 모달 -->	
<div class="modal" tabindex="-1" id="empModal" aria-labelledby="empModal" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="frm1"  class="form-horizontal">
		<h2>부서 추가</h2>
		<!-- <div class="form-group">		
			<label>부서번호:</label>
			<input type="text"  class="form-control" name="departmentId" >
		</div>	 -->
		<div class="form-group">
			<label>부서명:</label>
			<input type="text"  class="form-control"  name="departmentName" id="departmentName" >
		</div>	
		<div class="form-group">
			<label>매니저번호:</label>
			<input type="text"  class="form-control"  name="managerId" id="managerId">
		</div>			
		<div class="form-group">
			<label>지역번호:</label>
			<input type="text"  class="form-control"  name="locationId" id="locationId">
		</div>			
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" id="deptInsert" >등록</button>
      </div>
    </div>
  </div>
</div>	

<script>
$(function(){
	deptList();
	
	deptInsert();
	
	deptOneselct();
	
	//등록
	function deptInsert(){
		$('#deptInsert').on('click', function(){
			$('#frm1')
			var departmentId = $("#departmentId").val();
			var departmentName = $("#departmentName").val();
			var managerId = $("#managerId").val();
			var locationId = $("#locationId").val();
			$.ajax({
				url : 'deptInsert',
				type : 'POST',
				dataType : 'JSON',
				data: JSON.stringify({ departmentId : departmentId, departmentName : departmentName, managerId: managerId, locationId: locationId }),
				contentType: 'application/json', 
				success : function(data){
					$('#empModal').modal('hide');
					deptList();
					//location.reload();
				}
			}); 
		});
	} // end of deptInsert();
	//수정폼 부르기
	function deptOneselct(){
		$("tbody").on("click", "#btnDeptUpdate",function(){
			var deptId = $(this).closest('tr').data("departmentid");
			var tr = $(this).closest('tr');
			//특정 사용자 조회
			$.ajax({
				url : 'deptOndSelect/'+deptId,
				type:'GET',
				contentType:'application/json;charset=utf-8',
				dataType:'json',
				success : function deptOneSelect(data) {
					 $("#departmentId").val(data.departmentId);
					 $("#departmentName").val(data.departmentName);
					 $("#managerId").val(data.managerId);
					 $("#locationId").val(data.locationId);
				}
			})
		})
	}
	//목록조회
	function deptList(){
		
		$.ajax({
			url:"deptList",
			dataType : "json",
			success : function(datas){
				$("tbody").empty();
				$.each(datas , function(i, data){
					$('<tr data-deptid ="'+data.departmentId+'">')
					.append($("<td>").html(data.departmentId))
					.append($("<td>").html(data.departmentName))
					.append($("<td>").html(data.managerId))
					.append($("<td>").html(data.locationId))
					//.append($("<td>").html('<button class=\"btn btn-danger\" id=\'btnDelete\'>삭제</button>'))
					.append($("<td>").html('<button class=\"btn btn-primary\" id=\'btnDeptUpdate\' data-toggle=\"modal\" data-target=\"#empModal\">수정</button>'))
					.append($("<td>").html('<input type=\'hidden\' id=\'hidden_deptId\'>').val(data.departmentId))
					
					.appendTo($("tbody"));
				})
			}
		});
	} //end of deptList()
});
	
</script>	
</body>
</html>