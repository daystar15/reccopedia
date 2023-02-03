<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 예시</title>
<!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>

</head>
<body>
	<h3>회원가입</h3>
	<form id="signUpForm" method="post" action="/user/sign_up">
		<div>
			<label>
				<input type="text" name="name" id="name" placeholder="이름">
			</label>
		</div>	
		<div>
			<label>
				<input type="text" name="email" id="email" placeholder="이메일">
			</label>
		</div>
		<div>
			<label>
				<input type="password" name="password" id="password" placeholder="비밀번호">
			</label>
		</div>
		<input type="submit" id="singUpBtn" value="회원가입">		
	</form>
	<div class="go_sign_in">
		<p>이미 가입하셨나요? <a href="#">로그인</a></p>
	</div>
</body>

<script>
	$(document).ready(function() {
		$("#singUpBtn").on('click', function(e) {
			e.preventDefault();
			
			let name = $("#name").val().trim();
			let email = $("#email").val().trim();
			let password = $("#password").val().trim();
			
			if (name == '') {
				alert("이름을 입력해주세요");
				return false;
			};
			
			if (email == '') {
				alert("이메일을 입력해주세요");
				return false;
			};
			
			if (password == '') {
				alert("비밀번호를 입력해주세요");
				return false;
			} else if (password.length < 6) {
				alert("비밀번호를 최소 6자이상 설정해주세요.");
			}
			
			// ajax
			$.ajax({
				type: "post"
				, url: "/user/sign_up"
				, data: {"name":name, "email":email, "password":password}
			
				, success:function(data) {
					if (data == 1) {
						alert("회원가입에 성공");
						window.location.reload();
					} else {
						alert(data.errorMessage);
					}
				}
				, error:function(e) {
					alert("회원가입에 실패");
				}
			}); //---ajax
			
		}); //---회원가입 버튼
		
		
		
		
	});
</script>

</html>