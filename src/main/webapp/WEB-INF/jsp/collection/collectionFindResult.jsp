<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>

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
						<span class="year">{result.release_date}</span> &middot; <span class="country">${result.title}</span>
					</div>
				</div>
			</div>
		</div>
		<div class="collection_plus">
			<img src="/static/images/plus.png" alt="">
		</div>
	</div>
</li>
</c:forEach>
