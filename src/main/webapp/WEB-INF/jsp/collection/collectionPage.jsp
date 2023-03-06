<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="collection_page_box">
	<div class="collection_box">
		<div class="collection_list_poster">
			<c:forEach var="list" items="${collectionContentList}">
			<div>
				<img src="http://image.tmdb.org/t/p/w500${list.posterPath}" alt="">
			</div>
			</c:forEach>
		</div>
		<div class="user_info">
			<div>
				<div class="user_profile_img">
					<div class="profile_box">
						<img src="${userProfile}" alt="">
					</div>
				</div>
				<h2 class="user_name">${userName}</h2>
			</div>
			<!-- 타인 컬렉션에서는 안보임 -->
			<a href="/collection/update_view">수정하기</a>
			<!-- 타인 컬렉션에서는 안보임 -->
		</div>
		<div class="collection_contents_box">
			<div class="collection_intro">
				<c:forEach var="list1" items="${collectionContentList}">
				<c:forEach var="list2" items="${collectionList}">
					<c:if test="${list2.id eq list1.collectionId}">
						<div>
							<h3>${list2.subject}</h3>
							<p>${list2.content}</p>
						</div>
					</c:if>
				</c:forEach>
				</c:forEach>
			</div>
			<div class="collection_contents_list">
				<h4>
					작품들 <span>${fn:length(collectionContentList)}개</span>
				</h4>
				<div class="contents_box collection_page_list_box">
				
					<c:forEach var="list1" items="${collectionContentList}">
					<c:forEach var="list2" items="${collectionList}">
					<c:if test="${list2.id eq list1.collectionId}">
					<!-- 컨텐츠 하나 -->
					<a href="#">
						<div>
							<div class="contents_box_poster">
								<img src="http://image.tmdb.org/t/p/w500${list1.posterPath}" alt="">
							</div>
							<h4>${list.title}</h4>
						</div>
					</a>
					</c:if>
					</c:forEach>
					</c:forEach>
					<!-- 컨텐츠 하나 끝 -->
					
				</div>
				<!-- 컨텐츠 박스 끝 -->
			</div>
		</div>
	</div>
</div>