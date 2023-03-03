<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="collection_page_box">
	<div class="collection_box">
		<div class="collection_list_poster">
			<c:forEach var="list" items="${collectionList}">
			<div>
				<img src="${list.movieList}" alt="">
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
				<h3>${collectionMap.subject}</h3>
				<p>${collectionMap.content}</p>
			</div>
			<div class="collection_contents_list">
				<h4>
					작품들 <span>{컬렉션에 담긴 작품 개수}개</span>
				</h4>
				<div class="contents_box collection_page_list_box">
				
					<c:forEach var="list" items="${collectionList}">
					<!-- 컨텐츠 하나 -->
					<a href="#">
						<div>
							<div class="contents_box_poster">
								<img src="${list.movieList}" alt="">
							</div>
							<h4>${list.subject}</h4>
							<span>{평균 &#9733; 4.3}</span>
						</div>
					</a>
					</c:forEach>
					<!-- 컨텐츠 하나 끝 -->
					
				</div>
				<!-- 컨텐츠 박스 끝 -->
			</div>
		</div>
	</div>
</div>