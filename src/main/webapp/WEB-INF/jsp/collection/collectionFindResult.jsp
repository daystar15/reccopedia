<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:forEach var="result" items="${keywordList}">
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
			<img src="/static/images/plus.png" alt="" data-api-id="${result.poster_path}">
		</div>
	</div>
</li>
</c:forEach>

<script>
	$(document).ready(function() {
		$(".collection_plus img").on('click', function() {
			let id = $(this).data('api-id');
			$.cookie('cookieId', $(this).data('api-id'), {expires: 7, path: '/',  secure: false});

			
			$.ajax({
				type: "GET"
				, url: "/collection/collection_create_view"
				, data: {"id":id}
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