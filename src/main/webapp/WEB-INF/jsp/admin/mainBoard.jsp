<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="p-5">
	<h2>대시보드</h2>
	<div class="w-90 mt-4">
		<div class="d-flex justify-content-between mb-5">
			<div class="bg-light p-4" style="width: 38%">
				<div class="d-flex justify-content-between mb-2">
					<h5>회원관리</h5>
					<h5><a href="/admin/user_view">+</a></h5>
				</div>
				<table class="table">
					<thead class="text-center">
						<tr>
							<th>No.</th>
							<th>이름</th>
							<th>소개</th>
							<th>이메일</th>
							<th>회원탈퇴</th>
						</tr>
					</thead>
					<tbody class="text-center">
						<c:forEach items="${userList}" var="list" varStatus="status">
							<tr>
								<td style="vertical-align: middle">${fn:length(userList) - status.index}</td>
								<td style="vertical-align: middle">${list.name}</td>
								<td style="vertical-align: middle">${list.info}</td>
								<td style="vertical-align: middle">${list.email}</td>
								<td style="vertical-align: middle"><button type="button" class="btn btn-danger">회원탈퇴</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="bg-light p-4" style="width: 60%">
				<div class="d-flex justify-content-between mb-2">
					<h5>댓글 신고 목록</h5>
					<h5><a href="/admin/report_view">+</a></h5>
				</div>
				<table class="table">
					<thead class="text-center">
						<tr>
							<th>번호</th>
							<th>api번호</th>
							<th>사용자번호</th>
							<th>댓글번호</th>
							<th>내용</th>
							<th>신고이유</th>
							<th>삭제여부</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody class="text-center">
						<c:forEach items="${reportList}" var="list" varStatus="status">
							<tr>
								<td style="vertical-align: middle">${fn:length(reportList) - status.index}</td>
								<td style="vertical-align: middle">${list.apiId}</td>
								<td style="vertical-align: middle">${list.userId}</td>
								<td class="commentId" data-comment="${list.commentId}" style="vertical-align: middle">${list.commentId}</td>
								<td style="vertical-align: middle">${list.content}</td>
								<td style="vertical-align: middle">${list.reason}</td>
								<td style="vertical-align: middle">
								<c:forEach items="${commentList}" var="comment">
									<c:if test="${comment.id eq list.commentId}">
							      		삭제완료
							      	</c:if>
								</c:forEach>
								</td>
								<td><button type="button" class="deleteBtn btn btn-danger">삭제</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="w-100">
			<div class="bg-light w-100 p-3" style="height: 500px">
				<h5 class="mb-3">댓글 현황</h5>
				<div id="chart"></div>
			</div>
		</div>
	</div>
</div>
<script>
    	$(document).ready(function(){
    		$(".deleteBtn").on('click', function(e) {
    			let id = event.target.parentElement.parentElement.querySelector(".commentId").dataset.comment;
    			console.log(id);
    			// ajax 글 삭제
    			$.ajax ({
    				// request
    				type: "DELETE"
    				, url: "/comment/delete"
    				, data: {"id":id}
    				
    				// response
    				, success:function(data) {
    					if (data.code == 1) {
    						alert("삭제 되었습니다.");
    						location.reload();
    					} else {
    						alert(data.errorMessage);
    					}
    				}
    				, error:function(e) {
    					alert("댓글을 삭제하는데 실패했습니다.");
    				}
    			}); // --- ajax
    		})
    	})
    </script>
    
    
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">  
	  google.charts.load('current', {packages: ['corechart', 'bar']});
	  google.charts.setOnLoadCallback(drawBasic);

	  function drawBasic() {
	  var data = new google.visualization.DataTable();
	  data.addColumn('string', '댓글');
	  data.addColumn('number', '댓글수');

	  data.addRows([
		  ['영화', ${fn:length(commentMvList)}],
		  ['TV', ${fn:length(commentTvList)}]
	  ]);

	  var options = {
		  title: '영화 / TV 댓글',
		  hAxis: {
		  	title: '댓글',
		  },
		  vAxis: {
		  	title: '댓글수'
		  }
	  };

	  var chart = new google.visualization.ColumnChart(
	  document.getElementById('chart'));

	  chart.draw(data, options);
	  }
</script>