<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="nav_box">
	<div>
		<img src="/static/images/right-arrow.png" alt="" onclick="goBack();">
		<h2>보는중</h2>
	</div>
</div>
<div class="keep_box">
	<div class="evaluate_box">
		<div class="keep_title wish_title">
			<img src="/static/images/down-arrow.png" alt=""> <em>담은 순</em>
		</div>
		<!-- 컨텐츠 박스 시작 -->
		<div class="contents_box wish_box">
		
			<c:forEach items="${watchingtList}" var="list">
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
		<!-- 컨텐츠 박스 끝 -->
	</div>
</div>

<script>
	function goBack(){
		window.history.back();
	}
</script>