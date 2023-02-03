<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id="loginForm" action="/user/sign_in" method="post">
		<div>
			<input type="text" name="email" id="email">
		</div>
		<div>
			<input type="password" name="password" id="password">
		</div>
		<div>
			<input type="submit" value="로그인" id="loginBtn">
		</div>
	</form>
</body>

<script>
	$(document).ready(function() {
		$('#loginBtn').on('click',function(e) {
			e.preventDefault();
			
			let email = $('#email').val().trim();
			let password = $('#password').val().trim();
			
			if (email == '') {
				alert('아이디를 입력해주세요');
				return;
			}
			
			if (password == '') {
				alert('비밀번호를 입력해주세요');
				return;
			}
			
			// ajax
			let url = $("#loginForm").action("action");
			let data = $("#loginForm").serialize();
			
			$.post(url, data)
			.done(function(data) {
				if (data.code == 1) {
					alert('로그인에 성공');
					location.reload();
				} else {
					alert("로그인에 실패했습니다. 다시 시도해주세요");
				}
			}); // --- ajax
			
		}); // --- loginForm
	});
</script>

</html>