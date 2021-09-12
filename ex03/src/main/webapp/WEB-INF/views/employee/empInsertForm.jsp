<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록</title>
<style type="text/css">
	.require{
		color : red;
	}
	.emp {
		cursor: pointer;
	}	
	.emp:hover{
		color : blue;}
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
</head>
<script type="text/javascript">
   $(function(){
      function validation(){
         if(frm.lastName.value == ""){
            alert("이름을 입력하세요");
            frm.lastName.focus();
            return false;
         }
         
         return true;
      }
      
      
      //등록버튼
      $("#btnRegister").on("click",function(){
         if(validation()){
            frm.submit();
         }
      });
      //매니저 검색 버튼
      $("#btnEmpSearch").on("click", function(){
         //검색페이지를 ajax -> modal body 넣고 -> 모달
         $.ajax({
            url:"empSearch",
            success: function(data){
               $("#empModal .modal-body").html(data);
               $("#empModal").modal('show');
            }
         });
      });
      //매니저 단건 조회 (change 이벤트 사용)
       //let empId = {employeeId :$("#managerId").val()};
      $("#managerId").on("keydown", function(e){
         e.preventDefault();
         let empId = {employeeId :$("#managerId").val()}
         $("#name").val("");
         if($("managerId").val() =="")
            return;
         if(e.keyCode == 13) {
            e.preventDefault("")
         $.ajax({
            url:"ajaxEmp",
            data: empId,
            success: function(data){
               if(data){
                  $("#name").val(data.firstName)
               } else {
                  $("#btnEmpSearch").click();
               }
            }
         });
      }
      
      });
      //수정버튼
      $("#btnUpdateEmp").on("click",function(){
            if(validation()){
               alert("수정이 완료 되었습니다.");
               frm.submit();
            }
      });
      //document.addEventListener('keydown')
   });
</script>
<body>
      <div align="center"><h1>회원 등록</h1></div>
   <form role="form" action="${not empty emp? 'updateEmp': 'empInsert'}" method="post" id="frm" name="frm">
      <%-- <c:if test="${not empty emp }">
         <input type="text" name="employeeId" id="employeeId">
      </c:if> --%>
      
      <div class="form-group">
         <label>사원번호</label> 
         <input type="text" name="employeeId" id="employeeId" 
               value='<c:out value="${emp.employeeId}"/>'  >
      </div>

      <div class="form-group">
         <label>First name</label><span class="require">*</span>
         <input type="text" name="firstName" id="firstName" value='<c:out value="${emp.firstName}"/>' >
      </div>
      
      <div class="form-group">
         <label>Last name</label><span class="require">*</span>
         <input type="text" name="lastName" id="lastName" value='<c:out value="${emp.lastName}"/>' >
      </div>
      
      <div class="form-group">
         <label>Email</label><span class="require">*</span>
         <input type="text" name="email" id="email" value='<c:out value="${emp.email}"/>' >
      </div>
      
      <div class="form-group">
         <label>휴대전화</label><span class="require">*</span>
         <input type="text" name="phoneNumber" id="phoneNumber" value="${emp.phoneNumber }">
      </div>
      
      <div class="form-group">
         <label>부서-아이디</label>
         <c:if test="${not empty emp }">
         <select name="jobId" id="jobId" >
            <option >${emp.jobId }</option>
            <c:forEach items="${jobs.jobs}" var="job">
            
               <option value="${job.jobId}">${job.jobTitle}</option>
            </c:forEach>
         </select>
         </c:if>
         <c:if test="${empty emp }">
         <select name="jobId" id="jobId" >
            <option >선택</option>
            <c:forEach items="${jobs.jobs}" var="job">
            
               <option value="${job.jobId}">${job.jobTitle}</option>
            </c:forEach>
         </select>
         </c:if>
      </div>
      
      <div class="form-group">
         <label>급여</label>
         <input type="text" name="salary" id="salary" value="${emp.salary }">
      </div>
      
      <div class="form-group">
         <label>commissionPct</label>
         <input type="text" name="commissionPct" id="commissionPct" value="${emp.commissionPct}">
      </div>
      
      <div class="form-group">
         <label>매니저번호</label>
         
         
         <input type="text" name="managerId" id="managerId" value="${emp.managerId}"><input id="name">
         <button type="button" class="btn btn-primary" id="btnEmpSearch" value="${dept.departmentName}" >매니저검색</button>
      </div>
      
      <div class="form-group">
         <label>부서번호</label>
         <c:if test="${not empty emp }">   
            <select name="departmentId" id="departmentId" >
            <option >${emp.departmentId }</option>
            
            <c:forEach items="${jobs.depts}" var="dept">
               <option value="${dept.departmentId}">${dept.departmentName}</option>
            </c:forEach>
         </select>
         </c:if>
         <c:if test="${empty emp }">   
            <select name="departmentId" id="departmentId" >
            <option >선택</option>
            
            <c:forEach items="${jobs.depts}" var="dept">
               <option value="${dept.departmentId}">${dept.departmentName}</option>
            </c:forEach>
         </select>
         </c:if>
      </div>
      
      <c:if test="${empty emp }">
      <button type="button" class="btn btn-primary" id="btnRegister">등록</button>
      </c:if>
      <c:if test="${not empty emp }">
      <button type="button" class="btn btn-primary" id="btnUpdateEmp">수정</button>   
      <button type="submit" class="btn btn-danger" id="btnDeleteEmp" formaction="deleteEmp">삭제</button>
      </c:if>
      <button type="reset" class="btn btn-default">취소</button>
   
   </form>
   
	
	<div class="modal" tabindex="-1" id="empModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Modal body text goes here.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>