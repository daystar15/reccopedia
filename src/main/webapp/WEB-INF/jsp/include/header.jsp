<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<div class="inner">
    <div>
        <h1 class="logo"><a href="/main"><img src="/static/images/logo.png" alt=""></a></h1>
        <div class="menu">
            <a href="/main">영화</a>
            <a href="/main/tv">TV</a>
        </div>
    </div>
    <div>
    	<div class="multi_search_box">
	        <form action="" method="get">
	            <div>
	                <button type="submit" id="searchBtn"><img src="/static/images/search.png" alt=""></button>
	                <label>
	                    <input type="text" name="title" id="contentsTitle" placeholder="콘텐츠를 입력해보세요.">
	                </label>
	            </div>
	        </form>
        </div>
        <!-- 로그아웃 시작 -->
        <c:if test="${empty userId}">
        <div class="before_login_box">
        	<div class="before_login">
	            <div class="sign_in">
	                <span><jsp:include page="../user/signIn.jsp"/>로그인</span>
	            </div>
	            <div class="sign_up">
	                <span><jsp:include page="../user/signUp.jsp"/>회원가입</span>
	            </div>
	        </div>
        </div>
        </c:if>
        <!-- 로그아웃 끝 -->
        
        <!-- 로그인 시작 -->
        <c:if test="${not empty userId}">
	        <div class="after_login">
	            <div class="my_account">
	                <a href="/point/review_view" id="go_review">평가하기</a>
	                <a href="/user/sign_out" id="logoutBtn">로그아웃</a>
	                <a href="/user/user_view" id="go_userPage">
	                <div class="comment_user_profile">
	                	<c:if test="${empty userProfile}">
	                	<div class="fake_box">
							<img src="/static/images/pngegg.png" alt="">
						</div>
						</c:if>
						<div class="profile_box">
							<img src="${userProfile}" alt="">
						</div>
					</div>
	                </a>
	            </div>
	        </div>
        </c:if>
        <!-- 로그인 끝 -->
    </div>
</div>

<!-- 모달배경 -->
<div class="modal_back none"></div>


<script>
	$(document).ready(function() {
		
		$('.sign_up').on('click', function() {
            $(".sign_up_modal").removeClass('none');
            $(".modal_back").removeClass('none');
            $(".go_sign_up").removeClass('none');
        });

        $('.modal_back').on('click', function() {
            $(".modal_back").addClass('none');
            $(".sign_up_modal").addClass('none');
            $(".sign_in_modal").addClass('none');
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
        
        $('.sign_up_modal .go_sign_in p a').on('click', function() {
        	$(".sign_in_modal").removeClass('none');
            $(".sign_up_modal").addClass('none');
        });
        
        
        
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
						alert("로그인에 성공하였습니다.");
						window.location.reload();
					} else {
						alert(data.errorMessage);
					}
				}
				, error:function(e) {
					alert("로그인에 실패");
				}
			}); //---ajax
		
		}); //---로그인 버튼
		
		
		$("#searchBtn").on('click', function(e) {
			e.preventDefault();
			
			let title = $("#contentsTitle").val().trim();
			
			// ajax
			$.ajax({
				type: "get"
				, url: "/contents/search_view"
				, data: {"title":title}
			
				, success:function(data) {
					alert("검색결과 조회에 성공하였습니다.");
				}
				, error:function(e) {
					alert("검색 결과 조회에 실패하였습니다");
				}
			}); //---ajax
			
			
		})			
	})
</script>