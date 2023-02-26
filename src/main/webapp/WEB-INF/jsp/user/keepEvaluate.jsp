<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="nav_box">
	<div>
		<img src="/static/images/right-arrow.png" alt="" onclick="goBack();">
		<h2>영화</h2>
	</div>
</div>
<div class="keep_box">
	<div class="evaluate_box">
		<div class="keep_title">
			<h3>평가</h3>
			<span>${fn:length(pointList)}</span>
		</div>
		<div class="contents_box">
			
			<c:forEach items="${pointList}" var="list">
			<!-- 컨텐츠 하나 -->
			<a href="#">
				<div class="contents_box_poster">
					<img src="/static/images/test.jpg" alt="">
				</div>
				<h4>${list}</h4>
				<span>{평가함 &#9733; 4.3}</span>
			</a>
			<!-- 컨텐츠 하나 끝 -->
			</c:forEach>
			
		</div>
	</div>
	<div class="go_wish go">
		<a href="/user/wish_view">
			<h4>보고싶어요</h4>
			<span>${fn:length(wishList)}</span>
		</a>
	</div>
	<div class="go_watching go">
		<a href="/user/watching_view">
			<h4>보는중</h4>
			<span>${fn:length(watchingtList)}</span>
		</a>
	</div>
</div>

<script>
	function goBack(){
		window.history.back();
	}
</script>