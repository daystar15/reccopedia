<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="nav_box">
	<div>
		<div>
			<img src="/static/images/right-arrow.png" alt="" onclick="goBack();">
			<h2>컬렉션</h2>
		</div>
		<a href="/collection/collection_create_view?id=${num+1}" class="createCollectionBtn">새 컬렉션</a>
	</div>
</div>
<div class="collection_list_box">
	
	
	<%-- 작성한 컬렉션이 없을 때 --%>
	<c:if test="${empty collectionList}">
	<div class="no_collection_box">
		<img src="/static/images/no-comment.png" alt="">
		<p>작성한 컬렉션이 없어요.</p>
	</div>
	</c:if>
	<%-- 작성한 컬렉션이 없을 때 --%>
	
	<ul class="list_box">
		<c:forEach var="list" items="${collectionList}">
		<li data-collection-id="${list.id}">
			<a href="/collection/collection_view?id=${list.id}">
				<div class="setting">
					<img src="/static/images/setting.png" alt="">
				</div>
				
				<!-- 컬렉션 포스터들 시작 -->
				<div class="collection_list_poster">
					<div>
						<c:forEach items="${collectionContentList}" var="list1">
						<c:if test="${list.id eq list1.collectionId + 1}">
							<img src="http://image.tmdb.org/t/p/w500${list1.posterPath}" alt="">
						</c:if>
						</c:forEach>
					</div>
				</div>
				<!-- 컬렉션 포스터들 끝 -->
				
				<div class="collection_user user_info">
					<div>
						<div class="user_profile_img" style="border-radius:inherit">
							<div class="comment_user_profile">
			                	<c:if test="${userProfile eq null}">
			                	<div class="empty_box" style="width: 90px;">
									<img src="/static/images/pngegg.png" alt="" style="width: 54%; transform: translate(-90%,-79%);">
								</div>
								</c:if>
								<div class="profile_box">
									<img src="${userProfile}" alt="">
								</div>
							</div>
						</div>
						<h2 class="user_name">${userName}</h2>
					</div>
				</div>
				
				<div class="collection_info">
					<h3>${list.subject}</h3>
					<p>${list.content}</p>
				</div>
			</a>
		</li>
		</c:forEach>
	</ul>
</div>
<script type="text/javascript">

	$(document).ready(function() {
		$("#createCollectionBtn").on('click', function() {
			
			$.ajax({
            	type: "post" 
            	, url: "/collection/cash_create"
            	, data: {}
            	
            	, success:function(data) {
            		if (data.code == 1) {
            			alert("컬렉션이 임시로 생성되었습니다");
            		} else {
            			alert(data.errorMessage + "ajax 에러");
            		}
            	}
            	, error:function(e) {
            		alert("컬렉션 생성에 실패했습니다. 관리자에게 문의해주세요")
            	}
            }); //---ajax
		})
	})

	function goBack(){
		window.history.back();
	}
</script>