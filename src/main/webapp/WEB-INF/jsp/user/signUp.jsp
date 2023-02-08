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
				<div class="alarm_box">
					<span id="emptyName" class="none"><img src="/static/images/warning.png" id="noDuplicate">이름을 입력해주세요.</span>
					<span id="usefulName" class="none"><img src="/static/images/check.png">멋진 이름이군요.</span>
				</div>
			</div>
			<div>
				<div class="email_box">
					<input type="text" name="email" id="email" placeholder="이메일">
					<button type="button" id="duplicatedBtn">중복확인</button>
				</div>
				<div class="alarm_box">
					<span id="emptyEmail" class="none"><img src="/static/images/warning.png">이메일을 입력해주세요.</span>
					<span id="needCheckEmail" class="none"><img src="/static/images/warning.png">이메일을 입력해주세요.</span>
					<span id="isDuplicatedEmail" class="none"><img src="/static/images/warning.png">중복된 이메일입니다</span>
					<span id="invalidEmail" class="none"><img src="/static/images/warning.png">유효한 이메일 주소를 입력해 주시기 바랍니다.</span>
					<span id="usefulEmail" class="none"><img src="/static/images/check.png">사용가능한 이메일 입니다.</span>
				</div>
			</div>
			<div>
				<input type="password" name="password" id="password" placeholder="비밀번호">
				<div class="alarm_box">
					<span id="passwordLength" class="none"><img src="/static/images/warning.png">비밀번호를 6 ~ 12자로 설정해주세요.</span>
					<span id="usefulPassword" class="none"><img src="/static/images/check.png">안전한 비밀번호 입니다.</span>
				</div>
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
		
		// 이메일 알림문구 초기화
		$('#invalidEmail').addClass("none");
		$("#usefulEmail").addClass("none");
		$("#isDuplicatedEmail").addClass("none");
		$("#emptyEmail").addClass("none");
		$("#needCheckEmail").addClass("none");
		
		// 비밀번호 알림문구 초기화
		$('#passwordLength').addClass("none");
		$('#usefulPassword').addClass("none");
		$('#passwordLength').addClass("none");
		
		// 이름 알림문구 초기화
		$("#emptyName").addClass("none");
		$("#usefulName").addClass("none");
		
		// 이름 확인
		$("#name").on('keydown', function() {
			let name = $("#name").val().trim();
			
			if (name.length > 1) {
				$("#usefulName").removeClass("none");
				$("#emptyName").addClass("none");
			} else {
				$("#emptyName").removeClass("none");
				$("#usefulName").addClass("none");
			}
			
		});
		
		// 이메일 정규식 확인
		$("#email").on('keydown', function() {
			let email = $("#email").val().trim();
			let exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

			// 유효한 정규식 이메일 주소
			if (exptext.test(email)==false) {
		        $('#invalidEmail').removeClass("none");
		    } else {
		        $('#invalidEmail').addClass("none");
		    }
		});
		
		// 비밀번호 확인
		$("#password").on('keydown', function() {
			let password = $("#password").val().trim();
			
			if (password.length < 6 || password.length > 12) {
		        $('#passwordLength').removeClass("none");
		        $('#usefulPassword').addClass("none");
		    } else {
		        $('#usefulPassword').removeClass("none");
		        $('#passwordLength').addClass("none");
		    }
		});
		
		// 이메일 중복확인
		$("#duplicatedBtn").on('click', function() {
			
			let email = $("#email").val().trim();
			
			// 유효성 체크
			if (email == "") {
				$("#emptyEmail").removeClass("none");
				return;
			};
			
			// ajax
			$.ajax({
				url: "/user/is_duplicated_email",
				data: {"email":email},
				success:function(data) {
					if (data.result == true) {
						$("#isDuplicatedEmail").removeClass("none");
						$("#usefulEmail").addClass("none");
					} else {
						$("#isDuplicatedEmail").addClass("none");
						$("#usefulEmail").removeClass("none");
					}
				},
				error:function(error) {
					alert("아이디 중복확인에 실패")
				}
				
				
			}); //---ajax 끝
			
		});//---중복확인
		
		
		
		// 회원가입폼 클릭시
		$("#signUpForm").submit(function(e) {
  			
			// submit버튼 동작 안하도록 막음
    		e.preventDefault();
			
			let name = $("#name").val().trim();
			let email = $("#email").val().trim();
			let password = $("#password").val().trim();
			
			if (name == "") {
				$("#emptyName").removeClass("none");
				return;
			};
			
			if (email == "") {
				$("#emptyEmail").removeClass("none");
				return;
			};
			
			if (password == "") {
				 $('#passwordLength').removeClass("none");
				return;
			} 
			
			if ($("#usefulEmail").hasClass('none') == true) {
				$("#needCheckEmail").removeClass("none");
				return;
			}
			
			// ajax
			$.ajax({
				type: "post"
				, url: "/user/sign_up"
				, data: {"name":name, "email":email, "password":password}
			
				, success:function(data) {
					if (data.code == 1) {
						alert(name + "님 환영합니다!");
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