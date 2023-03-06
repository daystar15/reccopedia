<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="user_wrap">
	<div class="user_box">
		<!-- 설정 버튼 -->
		<div class="setting" data-user-id="${userInfo.id}">
			<img src="/static/images/setting.png" alt="">
		</div>
		<!-- 설정 버튼 끝-->
		<!-- 백그라운드이미지 -->
		<%-- 기본 이미지, 유저가 업로드 하면 이미지 변경됨 --%>
		<div class="user_background">
			<c:if test="${empty userInfo.backgroundImagePath}">
			<img src="/static/images/user_page_background.jpg" alt="">
			</c:if>
			<div>
				<img src="${userInfo.backgroundImagePath}" alt="">
			</div>
		</div>
		<!-- 백그라운드이미지 끝-->
		<!-- 유저 정보 -->
		<div class="user_info">
			<div class="user_profile_img">	
				<c:if test="${empty userInfo.profileImagePath}">
				<img src="${userInfo.profileImagePath}" alt="">
				</c:if>
				<div class="profile_box">
					<img src="${userInfo.profileImagePath}" alt="">
				</div>
			</div>
			<h2 class="user_name">${userInfo.name}</h2>
			<p class="user_introduce">${userInfo.info}</p>
		</div>
		<!-- 유저 정보 끝 -->
		<!-- 분석 -->
		<div class="analyze">
			<h3 class="analyze_title">나의 list</h3>
			<ul class="analyze_info">
				<li>
					<h4>${fn:length(pointList)}</h4>
					<span>평가</span>
				</li>
				<li>
					<h4>${fn:length(commentList)}</h4>
					<span>코멘트</span>
				</li>
				<li>
					<a href="/collection/collection_list_view">
						<h4>${fn:length(collectionList)}</h4>
						<span>컬렉션</span>
					</a>
				</li>
			</ul>
		</div>
		<div class="analyze">
			<h3 class="analyze_title">평가수</h3>
			<ul class="analyze_info">
				<li>
					<h4>${fn:length(pointList)}</h4>
					<span>영화</span>
				</li>
				<li>
					<h4>{5}</h4>
					<span>TV</span>
				</li>
			</ul>
		</div>
		
		<div class="point_distribution analyze">
			<h3 class="analyze_title">별점 분포</h3>
			<div></div>
			<ul class="analyze_info">
				<li>
					<h4>{5}</h4>
					<span>별점 평균</span>
				</li>
				<li>
					<h4>${fn:length(pointList)}</h4>
					<span>별점 개수</span>
				</li>
			</ul>
		</div>
		<!-- 분석 끝-->
		<ul class="keep_list">
			<li class="keep_movie_box">
				<a href="/user/evaluate_view">
					<div class="keep_type">
						<h5>영화</h5>
						<h5 class="keep_list_point">&#9733; ${fn:length(pointList)}</h5>
					</div>
					<div class="keep_bottom_box">
						<span>보고싶어요 ${fn:length(wishList)}</span>
					</div>
				</a>
			</li>
			<li class="keep_tv_box">
				<a href="#">
					<div class="keep_type">
						<h5>TV</h5>
						<h5 class="keep_list_point">&#9733; {8}</h5>
					</div>
					<div class="keep_bottom_box">
						<span>보고싶어요 102</span>
					</div>
				</a>
			</li>
		</ul>
	</div>
</div>

<script>
	$(document).ready(function() {
		$('.setting').on('click',function() {
			let id = $(this).data('user-id');
			location.href = "/user/user_update_view?id=" + id;
		});
		
	});
</script>