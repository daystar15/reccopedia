<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="collection_page_box" data-collection-id="${num}">
	<div class="collection_box">
		<div class="collection_list_poster">
			<c:forEach var="list" items="${collectionContetByCollectionId}">
			<div>
				<img src="http://image.tmdb.org/t/p/w500${list.posterPath}" alt="">
			</div>
			</c:forEach>
		</div>
		<div class="user_info">
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
			<!-- 타인 컬렉션에서는 안보임 -->
			<!-- <a href="/collection/update_view?id=${num}">수정하기</a> -->
			<a href="#" id="collectionDeleteBtn">삭제하기</a>
			<!-- 타인 컬렉션에서는 안보임 -->
		</div>
		<div class="collection_contents_box">
			<div class="collection_intro">
				<div>
					<h3>${collectionSubjectContent.subject}</h3>
					<p>${collectionSubjectContent.content}</p>
				</div>
			</div>
			<div class="collection_contents_list">
				<h4>
					작품들 <span>${fn:length(collectionContetByCollectionId)}개</span>
				</h4>
				<div class="contents_box collection_page_list_box">
				
					<c:forEach var="list1" items="${collectionContetByCollectionId}">
					<!-- 컨텐츠 하나 -->
					<a href="/contents/contents_view?id=${list1.apiId}">
						<div>
							<div class="contents_box_poster">
								<img src="http://image.tmdb.org/t/p/w500${list1.posterPath}" alt="">
							</div>
							<h4>${list1.title}</h4>
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

<script>
	$(document).ready(function(){
		$("#collectionDeleteBtn").on('click', function() {
			
			let id = $(".collection_page_box").data('collection-id');
			
			$.ajax ({
				// request
				type: "DELETE"
				, url: "/collection/delete"
				, data: {"id":id}
				
				// response
				, success:function(data) {
					if (data.code == 1) {
						alert("삭제 되었습니다.");
						location.href="/collection/collection_list_view"
					} else {
						alert(data.errorMessage);
					}
				}
				, error:function(e) {
					alert("컬렉션 삭제에 실패했습니다.");
				}
			}); // --- ajax
			
			$.ajax ({
				// request
				type: "DELETE"
				, url: "/collection/delete"
				, data: {"id":id}
				
				// response
				, success:function(data) {
					if (data.code == 1) {
						alert("삭제 되었습니다.");
						location.href="/collection/collection_list_view"
					} else {
						alert(data.errorMessage);
					}
				}
				, error:function(e) {
					alert("컬렉션 삭제에 실패했습니다.");
				}
			}); // --- ajax
			
			$.ajax({
				type: "DELETE"
				, url: "/collection/collection_content_delete"
				, data: {"id":id}
				, success:function(data) {
					if (data.code == 1) {
						location.reload();
					} else {
						alert(data.errorMessage);
					}
				}
				, error:function(e) {
					alert('오류입니다');
				}
			}); //---ajax
			
			
			
		})
	})

</script>
