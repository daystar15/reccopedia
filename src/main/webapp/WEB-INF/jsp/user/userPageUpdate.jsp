<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<div class="user_wrap">
	<div class="user_box">
		<!-- 설정 버튼 -->
		<div class="setting">
			<img src="/static/images/setting.png" alt="">
		</div>
		<form action="/user/user_update"  method="post">
			<input type="hidden" name="_method" value="put"/>
			<!-- 설정 버튼 끝-->
			<!-- 백그라운드이미지 -->
			<%-- 기본 이미지, 유저가 업로드 하면 이미지 변경됨 --%>
			<input type="file" id="user_background_file" class="none" accept=".gif, .jpg, .png, .jpeg"  value="put">
			<div class="user_background">
				<img src="/static/images/user_page_background.jpg" alt="">
			</div>
			<!-- 백그라운드이미지 끝-->
			<!-- 유저 정보 -->
			<div class="user_info">
				<input type="file" id="user_profile_file" class="none" accept=".gif, .jpg, .png, .jpeg"  value="put">
				<div class="user_profile_img">
					<img src="/static/images/test.jpg" alt="">
				</div>
				<div class="user_update_name">
					<input type="text" name="user_name" id="user_name" value="${userInfo.name}">
					<div id="resetNameBtn">
						<img src="/static/images/close.png">
					</div>
				</div>
				<div class="user_update_info">
					<textarea rows="1" name="user_introduce" id="user_introduce" value="put">${userInfo.info}</textarea>
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
			alert("파일 선택");
			let fileName = e.target.files[0].name; // 07_30_01.png
			//alert(fileName);
			
			// 확장자 유효성 확인
			let ext = fileName.split(".").pop().toLowerCase();
			if (ext != 'jpg' && ext != 'jpeg' && ext != 'gif' && ext != 'png') {
				alert("이미지 파일만 업로드 할 수 있습니다.");
				$('#user_background_file').val(''); // 파일 태그에 실제 파일 제거
				return;
			}
		});
		
		$('#user_profile_file').on('change', function(e) {
			alert("파일 선택");
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
			e.preventDefault();
			let name = $("#user_name").val().trim();
			let info = $("#user_introduce").val();
			
			if (name.length < 1) {
				alert("이름을 입력해주세요");
				return;
			}
			
			if (info.length < 1) {
				alert("프로필 정보를 입력해주세요");
				return;
			}
			
			let backgroundFile = $('#user_background_file').val();
			let profileFile = $('#user_profile_file').val();

			// 파일이 업로드 된 경우 확장자 체크
			let backgroundFileExt = backgroundFile.split('.').pop().toLowerCase(); // 파일 경로를 .으로 나누고 확장자가 있는 마지막 문자열을 가져온 후 모두 소문자로 변경
			let profileFileExt = profileFile.split('.').pop().toLowerCase(); // 파일 경로를 .으로 나누고 확장자가 있는 마지막 문자열을 가져온 후 모두 소문자로 변경
			if ($.inArray(backgroundFileExt, ['gif', 'png', 'jpg', 'jpeg']) == -1 && $.inArray(profileFileExt, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
				alert("gif, png, jpg, jpeg 파일만 업로드 할 수 있습니다.");
				$('#file').val(''); // 파일을 비운다.
				return;
			}
			
			// AJAX form 데이터 전송
			$.ajax({
				type: "put"
				, url: "/user/user_update"
				, data: {"name":name, "info":info, "backgroundFile":backgroundFile, "profileFile":profileFile}  // 파일 업로드를 위한 필수 설정
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