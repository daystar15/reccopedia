<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="inner">
    <div>
        <h1 class="logo"><a href="/main"><img src="/static/images/logo.png" alt=""></a></h1>
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
                <span><jsp:include page="../user/signIn.jsp"/>로그인</span>
            </div>
            <div class="sign_up">
                <span><jsp:include page="../user/signUp.jsp"/>회원가입</span>
            </div>
        </div>
        <!-- 로그인 된 후 시작 -->
        <div class="after_login none">
            <div class="my_account">
                <a href="/user/evaluate_view" id="go_review">평가하기</a>
                <a href="/user/sign_out" id="logoutBtn">로그아웃</a>
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


<script>
	$(document).ready(function() {
		
		
		$('.sign_up').on('click', function() {
            $(".sign_up_modal").removeClass('none');
            $(".modal_back").removeClass('none');
            $(".go_sign_up").removeClass('none');
        });

        $('.sign_up_modal .go_sign_in p a').on('click', function() {
        	$(".sign_in_modal").removeClass('none');
            $(".sign_up_modal").addClass('none');
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
        
        $('.modal_back').on('click', function() {
            $(".modal_back").addClass('none');
            $(".sign_up_modal").addClass('none');
            $(".sign_in_modal").addClass('none');
        });
	})
</script>