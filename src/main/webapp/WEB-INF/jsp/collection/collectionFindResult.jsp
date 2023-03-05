<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<c:forEach var="result" items="${keywordList}">
	<c:forEach items="${collectionList}" var="list" varStatus="status">
		<c:if test="${status.last}">
	
		<li class="findcontent">
			<div class="border_box">
				<div class="review_left">
					<div class="review_poster">
						<img src="https://image.tmdb.org/t/p/w500/${result.poster_path}" alt="">
					</div>
					<div class="review_info">
						<div>
							<h4 class="review_subject">${result.title}</h4>
							<div class="content_info">
								<span class="year">
								<c:set var="year" value="${result.release_date}"/>
								${fn:substring(year,0,4)}
								</span>
							</div>
						</div>
					</div>
				</div>
				<div class="collection_plus">
					<img src="/static/images/plus.png" alt="" data-collection-id="${list.id + 1}" data-image-path="${result.poster_path}" data-api-id="${result.id}" data-api-title="${result.title}">
				</div>
			</div>
		</li>
		
	</c:if>
</c:forEach>
</c:forEach>


<script>
	$(document).ready(function() {
		$(".collection_plus img").on('click', function() {
			let apiId = $(this).data('api-id');
			let title = $(this).data('api-title');
			let posterPath = $(this).data('image-path');
			let collectionId = $(this).data('collection-id');
			
			alert(apiId + " ," + title + " ," + posterPath + " ," + collectionId);
			
			$.ajax({
				type: "POST"
				, url: "/collection/collection_content_create"
				, data: {"apiId":apiId, "title":title, "posterPath":posterPath, "collectionId":collectionId}
				, success:function(data) {
					location.href="/collection/collection_create_view"
				}
				, error:function(e) {
					alert("오류입니다.");
				}
				
			});//--- ajax
			
			
		});
	});
</script>