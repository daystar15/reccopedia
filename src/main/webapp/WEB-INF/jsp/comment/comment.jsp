<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="nav_box">
	<div>
		<img src="/static/images/right-arrow.png" alt="" onclick="goBack();">
		<h2>코멘트</h2>
	</div>
</div>
<div class="comment_wrap">
	<!-- 댓글 박스 하나 -->
	<c:forEach items="${commentList}" var="list">
	<div class="comment_box">
		<div class="comment_user">
			<a class="comment_left">
				<span class="comment_user_profile"> <img src="/static/images/test.jpg" alt="">
				</span> <span class="comment_user_name">${list.user.name} </span>
			</a>
			<div class="comment_right">&#9733; ${list.pointCount}</div>
		</div>
		<div class="comment_content">
			${list.comment.content}
		</div>
		<div class="good_box">
			<span class="comment_up"> 
				<img src="/static/images/up.png" alt=""> <em>{318}</em>
			</span>
		</div>
	</div>
	</c:forEach>
	<!-- 댓글 박스 하나 끝 -->
	
	<c:if test="${fn:length(commentList) == 0}">
	<div class="no_comment_box">
		<img src="/static/images/no-comment.png" alt="">
		<p>
			작성된 댓글이 없습니다 <br>
			댓글을 작성해보세요!
		</p>
	</div>
	</c:if>
</div>

<script type="text/javascript">
	function goBack(){
		window.history.back();
	}
</script>