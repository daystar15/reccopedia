<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
    
<!-- 로그인 -->
<div class="sign_in_modal none">
	<div class="modal_box">
		<div class="modal_top">
			<h1 class="modal_logo">
				<img src="/static/images/logo.png" alt="">
			</h1>
			<p>로그인</p>
		</div>
		<form id="signInForm" action="/user/sign_in" method="post">
			<div>
				<input type="text" name="logInEmail" id="logInEmail" placeholder="이메일">
			</div>
			<div>
				<input type="password" name="logInPassword" id="logInPassword" placeholder="비밀번호">
			</div>
			<input type="submit" value="로그인">
		</form>
		<!-- 비밀번호 찾기 나중에 처리
                <div class="forget_password">
                    <a href="#">비밀번호를 잊어버리셨나요?</a>
                </div> 
                -->
		<div class="go_sign_up">
			<p>
				계정이 없으신가요?
				<a href="#" class="link">회원가입</a>
			</p>
		</div>
	</div>
</div>

<script>
	$(document).ready(function() {
		

	});
</script>