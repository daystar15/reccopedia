<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="inner">
    <div>
        <h1 class="logo"><a href="#"><img src="/static/images/logo.png" alt=""></a></h1>
        <div class="menu">
            <a href="#">영화</a>
            <a href="#">TV</a>
        </div>
    </div>
    <div>
        <form action="/search" method="get">
            <div>
                <img src="/static/images/search.png" alt="">
                <label>
                    <input type="text" name="keyword" id="keyword" placeholder="콘텐츠, 인물, 컬렉션, 유저를 검색해보세요.">
                </label>
            </div>
        </form>
        <div class="before_login">
            <div class="sign_in">
                <span>로그인</span>
            </div>
            <div class="sign_up">
                <span>회원가입</span>
            </div>
        </div>
        <!-- 로그인 된 후 시작 -->
        <div class="after_login none">
            <div class="my_account">
                <a href="/user/evaluate_view" id="go_review">평가하기</a>
                <a href="/user/user_view" id="go_userPage">
                    <span class="comment_user_profile">
                        <img src="/static/images/test.jpg" alt="">
                    </span>
                </a>
            </div>
        </div>
        <!-- 로그인 된 후 끝 -->
    </div>
</div>


<!-- 모달배경 -->
<div class="modal_back none"></div>

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
			<div class="sign_up_submit">
				<input type="submit" value="회원가입" id="signUpBtn">
			</div>
		</form>
		<div class="go_sign_in">
			<p>
				이미 가입하셨나요?
				<a href="#" class="link">로그인</a>
			</p>
		</div>
	</div>
</div>

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
			<div class="sign_in_submit">
				<input type="submit" value="로그인">
			</div>
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
    $(document).ready(function () {
    	
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
		
		$("#signInForm").submit(function(e) {
			e.preventDefault();
			
			let email = $("#logInEmail").val().trim();
			let password = $("#logInPassword").val().trim();
		
			if (email == "") {
				alert("이메일을 입력해주세요");
				return;
			};
			
			if (password == "") {
				alert("비밀번호를 입력해주세요");
				return;
			} 
			
			// ajax
			$.ajax({
				type: "post"
				, url: "/user/sign_in"
				, data: {"email":email, "password":password}
			
				, success:function(data) {
					if (data.code == 1) {
						alert("로그인에 성공");
						$(".modal_back").remove();
						$(".modal_box").remove();
						$('.before_login').remove();
						$('.after_login').removeClass('none');
					} else {
						alert(data.errorMessage);
					}
				}
				, error:function(e) {
					alert("로그인에 실패");
				}
			}); //---ajax
		
		}); //---로그인 버튼
    	
    	
        $('.sign_up').on('click', function() {
            $(".sign_up_modal").removeClass('none');
            $(".modal_back").removeClass('none');
            $(".go_sign_up").removeClass('none');
        });

        $('.sign_up_modal .go_sign_in p a').on('click', function() {
            $(".sign_in_modal").removeClass('none');
            $(".sign_up_modal").addClass('none');
        });

        $('.sign_in').on('click', function() {
            $(".sign_in_modal").removeClass('none');
            $(".modal_back").removeClass('none');
            $(".go_sign_in").removeClass('none');
        });

        $('.sign_in_modal .go_sign_up p a').on('click', function() {
            $(".sign_up_modal").removeClass('none');
            $(".sign_in_modal").addClass('none');
        });

        $('.modal_back').on('click', function() {
            $(".modal_back").addClass('none');
            $(".sign_up_modal").addClass('none');
            $(".sign_in_modal").addClass('none');
        });
    });
</script>