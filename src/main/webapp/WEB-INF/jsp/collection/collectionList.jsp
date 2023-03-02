<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="nav_box">
	<div>
		<div>
			<img src="/static/images/right-arrow.png" alt="" onclick="goBack();">
			<h2>컬렉션</h2>
		</div>
		<a href="/collection/collection_create_view" class="createCollectionBtn">새 컬렉션</a>
	</div>
</div>
<div class="collection_list_box">
	
	
	<%-- 작성한 컬렉션이 없을 때 --%>
	<div class="no_collection_box">
		<img src="/static/images/no-comment.png" alt="">
		<p>작성한 컬렉션이 없어요.</p>
	</div>
	<%-- 작성한 컬렉션이 없을 때 --%>
	
	<ul class="list_box">
		<li>
			<a href="/collection/collection_view">
				<div class="setting">
					<img src="/static/images/setting.png" alt="">
				</div>
				<!-- 컬렉션 포스터들 시작 -->
				<div class="collection_list_poster">
					<div>
						<img src="/static/images/test.jpg" alt="">
					</div>
					<div>
						<img src="/static/images/test.jpg" alt="">
					</div>
					<div>
						<img src="/static/images/test.jpg" alt="">
					</div>
					<div>
						<img src="/static/images/test.jpg" alt="">
					</div>
					<div>
						<img src="/static/images/test.jpg" alt="">
					</div>
				</div>
				<!-- 컬렉션 포스터들 끝 -->
				<div class="collection_user user_info">
					<div>
						<div class="user_profile_img">
							<div class="profile_box">
								<img src="${userProfile}" alt="">
							</div>
						</div>
						<h2 class="user_name">${userName}</h2>
					</div>
					<div class="collection_count">
						<span>{9}</span>
					</div>
				</div>
				<div class="collection_info">
					<h3>{컬렉션 제목}</h3>
					<p>{컬렉션 설명}</p>
				</div>
			</a>
		</li>
	</ul>
</div>
<script type="text/javascript">
	function goBack(){
		window.history.back();
	}
</script>