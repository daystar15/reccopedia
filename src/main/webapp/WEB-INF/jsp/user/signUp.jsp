<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 회원가입 -->
<div class="sign_up_modal none">
	<div class="modal_box">
		<div class="modal_top">
			<h1 class="modal_logo">
				<img src="/static/images/logo.png" alt="">
			</h1>
			<p>회원가입</p>
		</div>
		<form id="signUpForm" action="/user/sign_up" method="post">
			<div>
				<input type="text" name="name" id="name" placeholder="이름">
			</div>
			<div>
				<input type="text" name="email" id="email" placeholder="이메일">
			</div>
			<div>
				<input type="password" name="password" id="password" placeholder="비밀번호">
			</div>
				<input type="submit" value="회원가입" id="signUpBtn">
			
		</form>
		<div class="go_sign_in">
			<p>
				이미 가입하셨나요?
				<a href="#" class="link">로그인</a>
			</p>
		</div>
	</div>
</div>

<script>
	$(document).ready(function() {
$("#signUpForm").submit(function(e) {
  			
    		e.preventDefault();
			
			let name = $("#name").val().trim();
			let email = $("#email").val().trim();
			let password = $("#password").val().trim();
			
			if (name == "") {
				alert("이름을 입력해주세요");
				return;
			};
			
			if (email == "") {
				alert("이메일을 입력해주세요");
				return;
			};
			
			if (password == "") {
				alert("비밀번호를 입력해주세요");
				return;
			} 
			//else if (password.length < 6) {
			//	alert("비밀번호를 최소 6자이상 설정해주세요.");
			//}
			
			// ajax
			$.ajax({
				type: "post"
				, url: "/user/sign_up"
				, data: {"name":name, "email":email, "password":password}
			
				, success:function(data) {
					if (data.code == 1) {
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
	})
</script>