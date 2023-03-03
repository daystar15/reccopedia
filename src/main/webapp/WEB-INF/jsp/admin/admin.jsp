<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<link rel="stylesheet" href="/static/css/admin.css">
</head>
<body>
	<div id="wrap">
		<div class="bg-box">
			<img src="/static/images/admin_background.jpg" alt="">
		</div>
		<div class="main-box">
			<div class="m-auto">
				<h1 class="mb-3">
					<img src="/static/images/logo.png" alt="" class="w-100">
				</h1>
				<form id="loginForm" action="" method="post">
					<div class="input-group mb-3">
						<input type="text"  class="form-control" name="logInId" id="logInId" placeholder="아이디">
					</div>
					<div class="input-group mb-3">
						<input type="password" class="form-control" name="password" id="password" placeholder="비밀번호">
					</div>
					<input type="submit" class="btn btn-primary w-100" value="로그인">
				</form>
			</div>
	</div>
	</div>
	<script>
		$(document).ready(function() {
			$('#loginForm').on('submit', function(e) {
				
				e.preventDefault(); 
	
				let loginId =  $('#logInId').val().trim();
				let password =  $('#password').val();
				
				if (loginId == '') {
					alert('아이디를 입력해주세요.');
					return false;
				}
				
				if (password == '') {
					alert('비밀번호를 입력해주세요.');
					return false;
				}
				
				// ajax (or 서브밋)
				let url = $(this).attr('action');
				console.log(url);
				let params = $(this).serialize(); // loginId=aaaa&password=aaaa
				console.log(params);
				
				$.ajax({
					type: "post"
					, url: "/admin/sign_in"
					, data: {"loginId":loginId, "password":password}
				
					, success:function(data){
						if (data.code == 1) { // 성공
							location.href = '/admin/main';
						} else { // 실패
							alert(data.errorMessage);
						}
					}
				});//---ajax
				
			});
		});
	</script>
</body>
</html>