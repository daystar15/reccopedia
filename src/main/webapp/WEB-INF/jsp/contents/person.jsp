<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="main_wrap">
	<div class="section">
		<div class="inner">
			<div class="contents person">
				<ul>
					<c:forEach var="list" items="${list}">
					<li>
					<c:if test="${list.media_type eq 'movie'}">
						<a href="/contents/contents_view?id=${list.id}">
							<div>
								<div class="poster">
									<img src="https://image.tmdb.org/t/p/w500${list.poster_path}" alt="">
								</div>
							</div>
							<h3 class="content_subject">${list.title}</h3>
							<div class="point">평균 &starf; <fmt:formatNumber value="${list.vote_average/2}" pattern=".0"/></div>
						</a>
					</c:if>
					</li>
					
					<li style="margin-left: 0;">
					<c:if test="${list.media_type eq 'tv'}">
						<a href="/contents/tv_contents_view?id=${list.id}">
							<div>
								<div class="poster">
									<img src="https://image.tmdb.org/t/p/w500/${list.poster_path}" alt="">
								</div>
							</div>
							<h3 class="content_subject">${list.original_name}</h3>
							<div class="point">평균 &starf; <fmt:formatNumber value="${list.vote_average/2}" pattern=".0"/></div>
						</a>
					</c:if>
					</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
</div>