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
                <a href="#" id="go_review">평가하기</a>
                <a href="#" id="go_userPage">
                    <span class="comment_user_profile">
                        <img src="/static/images/test.jpg" alt="">
                    </span>
                </a>
            </div>
        </div>
        <!-- 로그인 된 후 끝 -->
    </div>
</div>