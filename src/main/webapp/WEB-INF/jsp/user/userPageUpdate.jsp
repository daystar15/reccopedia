<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<div class="user_wrap">
	<div class="user_box">
		
		<form action="/user/user_update" id="uploadForm" method="post">
			<input type="hidden" name="_method" value="put"/>

			<!-- 백그라운드이미지 -->
			<%-- 기본 이미지, 유저가 업로드 하면 이미지 변경됨 --%>
			<input type="file" id="user_background_file" class="none" accept=".gif, .jpg, .png, .jpeg">
			<div class="user_background">
				<img src="/static/images/user_page_background.jpg" alt="">
			</div>
			<!-- 백그라운드이미지 끝-->
			<!-- 유저 정보 -->
			<div class="user_info">
				<input type="file" id="user_profile_file" class="none" accept=".gif, .jpg, .png, .jpeg">
				<div class="user_profile_img">
					<img src="/static/images/test.jpg" alt="">
				</div>
				<div class="user_update_name">
					<input type="text" name="name" id="user_name" value="${userInfo.name}">
					<div id="resetNameBtn">
						<img src="/static/images/close.png">
					</div>
				</div>
				<div class="user_update_info">
					<textarea rows="1" name="textInfo" id="user_introduce">${userInfo.info}</textarea>
					<div id="resetInfoBtn">
						<img src="/static/images/close.png">
					</div>
				</div>
				<div>
					<input type="submit" value="저장" id="updateBtn">
				</div>
			</div>
		</form>
		<!-- 유저 정보 끝 -->
			
		
		<!-- 분석 -->
		<div class="analyze">
			<h3 class="analyze_title">나의 list</h3>
			<ul class="analyze_info">
				<li>
					<a href="#">
						<h4>${fn:length(pointList)}</h4>
						<span>평가</span>
					</a>
				</li>
				<li>
					<a href="#">
						<h4>${fn:length(commentList)}</h4>
						<span>코멘트</span>
					</a>
				</li>
				<li>
					<a href="/collection/collection_list_view">
						<h4>{5}</h4>
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
		
		$('#resetNameBtn').on('click',function() {
			$("#user_name").val("");
		});
		
		$('#resetInfoBtn').on('click',function() {
			$("#user_introduce").val("");
		});
		

		$(".user_background").on('click', function() {
			$('#user_background_file').click();
		});
		
		$(".user_profile_img").on('click', function() {
			$('#user_profile_file').click();
		});
		
		$('#user_background_file').on('change', function(e) {
			let fileName = e.target.files[0].name; // 07_30_01.png
			
			// 확장자 유효성 확인
			let ext = fileName.split(".").pop().toLowerCase();
			if (ext != 'jpg' && ext != 'jpeg' && ext != 'gif' && ext != 'png') {
				alert("이미지 파일만 업로드 할 수 있습니다.");
				$('#user_background_file').val(''); // 파일 태그에 실제 파일 제거
				return;
			}
		});
		
		$('#user_profile_file').on('change', function(e) {
			let fileName = e.target.files[0].name; // 07_30_01.png
			//alert(fileName);
			
			// 확장자 유효성 확인
			let ext = fileName.split(".").pop().toLowerCase();
			if (ext != 'jpg' && ext != 'jpeg' && ext != 'gif' && ext != 'png') {
				alert("이미지 파일만 업로드 할 수 있습니다.");
				$('#user_profile_file').val(''); // 파일 태그에 실제 파일 제거
				return;
			}
		});
		
		$("#updateBtn").on('click', function(e) {
			e.preventDefault(e);
			
			let name = $("input[name=name]").val().trim();
			let info = $("#user_introduce").val();
			let backgroundFile = $("#user_background_file").val();
			let profileFile = $("#user_profile_file").val();
			
			if (name.length < 1) {
				alert("이름을 입력해주세요");
				return;
			}
			
			if (info.length < 1) {
				alert("프로필을 입력해주세요");
				return;
			}
			
			// 파일이 업로드 된 경우 확장자 체크
			if (backgroundFile != '') {
				let backgroundFileext = backgroundFile.split(".").pop().toLowerCase();
				if ($.inArray(backgroundFileext, ['jpg', 'jpeg', 'png', 'gif']) == -1) { // 배열안에 포함되지 않았을 때
					alert("이미지 파일만 업로드 할 수 있습니다.");
					$('#user_background_file').val(""); // 파일을 비운다.
					return;
				}
			}
			
			// 파일이 업로드 된 경우 확장자 체크
			if (profileFile != '') {
				let profileFileext = profileFile.split(".").pop().toLowerCase();
				if ($.inArray(profileFileext, ['jpg', 'jpeg', 'png', 'gif']) == -1) { // 배열안에 포함되지 않았을 때
					alert("이미지 파일만 업로드 할 수 있습니다.");
					$('#user_profile_file').val(""); // 파일을 비운다.
					return;
				}
			}

			let form = $("#uploadForm");
			let formData = new FormData(form[0]);
			formData.append("info", info); 
			formData.append("backgroundFile", $("#user_background_file")[0].files[0]); 
			formData.append("profileFile", $("#user_profile_file")[0].files[0]); 
			
			
			// AJAX form 데이터 전송
			$.ajax({
				type: "put"
				, url: "/user/user_update"
				, data: formData
			    , enctype : "multipart/form-data"
				, processData: false
				, contentType: false
				, success: function(data) {
					if (data.code == 1) {
						location.href = "/user/user_view"
					} else if (data.code == 500) { // 비로그인 일 때
						location.href = "/main";
					} else {
						alert(data.errorMessage);
					}
				}
				, error: function(e) {
					alert("사용자 정보 저장에 실패했습니다. 관리자에게 문의해주세요.");
				}
			});  // --- ajax 끝
		})
	});
</script>