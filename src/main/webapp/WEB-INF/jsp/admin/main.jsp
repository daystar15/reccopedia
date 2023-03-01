<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<title>Document</title>
	<!-- 부트스트랩 CDN link -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div id="wrap">
        <div class="d-flex">
            <header class="header col-2 bg-dark text-white p-3">
                <h1 class="logo w-75 m-auto">
                    <img src="/static/images/logo.png" alt="" class="w-100">
                </h1>
                <div class="admin_info text-center">
                    <h5 class="my-3">${adminName}님 환영합니다!</h4>
                    <a class=" text-white" href="/main/movie">왓챠피디아 사이트 이동</a>
                </div>
                <nav class="nav">
                    <ul class="list-unstyled">
                        <li class="nav-item">
                            <a class="nav-link text-white" href="#">대시보드</a>
                            <a class="nav-link text-white" href="#">회원관리</a>
                            <a class="nav-link text-white" href="#">신고댓글목록</a>
                        </li>
                    </ul>
                </nav>
            </header>
            <div class="contents col-10">
            	<div class="p-5">
            		<h2>대시보드</h2>
            		<div class="w-90 mt-4">
            			<div class="d-flex justify-content-between mb-5">
            				<div class="bg-light col-4 py-3">
            					<div class="d-flex justify-content-between mb-2">
            						<h5>회원관리</h5>
            						<h5>+</h5>
            					</div>
            					<table class="table">
									 <thead class="text-center">
									   <tr>
									      <th>번호</th>
									      <th>이름</th>
									      <th>소개</th>
									      <th>이메일</th>
									   </tr>
									 </thead>
									 <tbody class="text-center">
									   <c:forEach items="${userList}" var="list" varStatus="status">
									   <tr>
									      <td style="vertical-align: middle">${fn:length(userList) - status.index}</td>
									      <td style="vertical-align: middle">${list.name}</td>
									      <td style="vertical-align: middle">${list.info}</td>
									      <td style="vertical-align: middle">${list.email}</td>
									   </tr>
									   </c:forEach>
									 </tbody> 
								</table>
            				</div>
            				<div class="bg-light col-7 py-3">
            					<div class="d-flex justify-content-between mb-2">
            						<h5>댓글 신고 목록</h5>
            						<h5>+</h5>
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
									      	 <c:if test="${comment.id ne list.commentId}">
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
            					<h5 class="mb-3">방문자 현황</h5>
            					<div id="chart"></div>
            				</div>
            			</div>
            		</div>
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
		google.charts.load('current', {'packages':['line']});
	    google.charts.setOnLoadCallback(drawChart);
	
	    function drawChart() {
	
	      var data = new google.visualization.DataTable();
	      data.addColumn('number', 'Day');
	      data.addColumn('number', 'Guardians of the Galaxy');
	      data.addColumn('number', 'The Avengers');
	      data.addColumn('number', 'Transformers: Age of Extinction');
	
	      data.addRows([
	        [1,  37.8, 80.8, 41.8],
	        [2,  30.9, 69.5, 32.4],
	        [3,  25.4,   57, 25.7],
	        [4,  11.7, 18.8, 10.5],
	        [5,  11.9, 17.6, 10.4],
	        [6,   8.8, 13.6,  7.7],
	        [7,   7.6, 12.3,  9.6],
	        [8,  12.3, 29.2, 10.6],
	        [9,  16.9, 42.9, 14.8],
	        [10, 12.8, 30.9, 11.6],
	        [11,  5.3,  7.9,  4.7],
	        [12,  6.6,  8.4,  5.2],
	        [13,  4.8,  6.3,  3.6],
	        [14,  4.2,  6.2,  3.4]
	      ]);
	
	      var options = {
	        chart: {
	          title: 'Box Office Earnings in First Two Weeks of Opening',
	          subtitle: 'in millions of dollars (USD)'
	        },
	        width: 1400,
	        height: 400,
	        axes: {
	          x: {
	            0: {side: 'bottom'}
	          }
	        }
	      };
	
	      var chart = new google.charts.Line(document.getElementById('chart'));
	
	      chart.draw(data, google.charts.Line.convertOptions(options));
    }
</script>
</body>
</html>