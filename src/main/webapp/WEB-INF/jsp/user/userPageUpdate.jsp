<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="user_wrap">
	<div class="user_box">
		<!-- 설정 버튼 -->
		<div class="setting">
			<img src="/static/images/setting.png" alt="">
		</div>
		<form action="" method="post">
			<!-- 설정 버튼 끝-->
			<!-- 백그라운드이미지 -->
			<%-- 기본 이미지, 유저가 업로드 하면 이미지 변경됨 --%>
			<div class="user_background">
				<img src="/static/images/user_page_background.jpg" alt="">
			</div>
			<!-- 백그라운드이미지 끝-->
			<!-- 유저 정보 -->
			<div class="user_info">
				<div class="user_profile_img">
					<img src="/static/images/test.jpg" alt="">
				</div>
				<div class="user_update_name">
					<input type="text" name="user_name" id="user_name">
					<div id="resetNameBtn">
						<img src="/static/images/close.png">
					</div>
				</div>
				<div class="user_update_info">
					<textarea rows="1" name="user_introduce" id="user_introduce"></textarea>
					<div id="resetInfoBtn">
						<img src="/static/images/close.png">
					</div>
				</div>
				<div>
					<input type="submit" value="수정완료" id="updateBtn">
				</div>
			</div>
			<!-- 유저 정보 끝 -->
			
		</form>
		
		<!-- 분석 -->
		<div class="analyze">
			<h3 class="analyze_title">평가수</h3>
			<ul class="analyze_info">
				<li>
					<h4>{5}</h4>
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
					<h4>{5}</h4>
					<span>별점 개수</span>
				</li>
				<li>
					<h4>{5}</h4>
					<span>별점 평균</span>
				</li>
			</ul>
		</div>
		<!-- 분석 끝-->
		<ul class="keep_list">
			<li class="keep_movie_box">
				<a href="#">
					<div class="keep_type">
						<h5>영화</h5>
						<h5 class="keep_list_point">&#9733; {8}</h5>
					</div>
					<div class="keep_bottom_box">
						<span>보고싶어요 102</span>
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
		
		$('#resetNameBtn').on('click',function() {
			$("#user_name").val("");
		});
		
		$('#resetInfoBtn').on('click',function() {
			$("#user_introduce").val("");
		});
	});
</script>