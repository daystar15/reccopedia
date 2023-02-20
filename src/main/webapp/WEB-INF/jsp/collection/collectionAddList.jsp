<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<ul class="add_collection_list">
<c:forEach var="result" items="${addList}">
	<li class="">
		<div class="">
			<!-- <img src="https://image.tmdb.org/t/p/w500/${result.poster_path}" alt=""> -->
		
				<h4 class="review_subject">${result.title}</h4>
				
		</div>
	</li>					
</c:forEach>
</ul>

<p class="test">test</p>
<script>
	$(document).ready(function() {
		$.ajax({
			type: "get"
			, url: "/collection/collection_create_view"
			, success:function(data) {
				
			}
			, error:function() {
				
			}
		})
	})
</script>