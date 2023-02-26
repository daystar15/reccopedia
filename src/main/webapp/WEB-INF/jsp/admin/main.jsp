<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                        </li>
                    </ul>
                </nav>
            </header>
            <div class="contents col-10">
            	<div class="p-5">
            		<h2>대시보드</h2>
            		<div class="w-90 mt-4">
            			<div class="d-flex justify-content-between mb-5">
            				<div class="bg-light col-5" style="height: 400px">
            					<div class="d-flex justify-content-between mb-5 py-3">
            						<h5>회원관리</h5>
            						<h5>+</h5>
            					</div>
            				</div>
            				<div class="bg-light col-6" style="height: 400px">
            					<div class="d-flex justify-content-between mb-5 py-3">
            						<h5>댓글 신고 목록</h5>
            						<h5>+</h5>
            					</div>
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