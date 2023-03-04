<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="add_collection_lists">
	<c:forEach var="list" items="${collectionContent}">
		<div class="collection_select_list">
			<div class="collection_select_list_poster">
				<img src="https://image.tmdb.org/t/p/w500/${list.posterPath}" alt="">
			</div>
			<div class="closeBtn" data-select-id="${list.id}">
				<img src="/static/images/close.png" alt="">
			</div>
		</div>
	</c:forEach>			
</div>

<script>
	$(document).ready(function() {
	
		
		
		
		
		
	});//---제이쿼리 끝
</script>