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
	<div class="comment_box" data-comment-id="${list.comment.id}" data-mycomment-id="${myComment.id}" data-user-id="${userInfo.id}" data-api-id="${list.comment.apiId}">
		<div class="comment_user">
			<a class="comment_left">
				<span class="comment_user_profile"> 
					<c:if test="${userProfile eq null}">
	                	<div class="empty_box" style="width: 90px;">
							<img src="/static/images/pngegg.png" alt="" style="width: 54%; transform: translate(-90%,-79%);">
						</div>
					</c:if>
					<div class="profile_box">
						<img src="${userProfile}" alt="">
					</div>
				</span> 
				<span class="comment_user_name">${list.user.name} </span>
			</a>
			<div class="comment_right_box">
				<c:if test="${not empty userId}">
				<div class="report_box">
					<c:if test="${list.user.email ne userInfo.email}">
					<span class="reportBtn">신고</span>
					</c:if>
					<c:if test="${list.user.email eq userInfo.email}">
					<span class="deleteBtn">삭제</span>
					</c:if>
				</div>
				</c:if>
				<div class="comment_right">&#9733; ${list.pointCount}</div>
			</div>
		</div>
		<c:if test="${list.comment.spoiler == false}">
			<div class="comment_content" data-spoiler="${list.comment.spoiler}">
					${list.comment.content}
			</div>
		</c:if>
		<c:if test="${list.comment.spoiler == true}">
			<div class="comment_content" data-spoiler="${list.comment.spoiler}">
					${list.comment.content}
			</div>
			<p class="spoilerHTML"></p>
		</c:if>
		<!-- <div class="good_box">
			<span class="comment_up"> 
				<img src="/static/images/up.png" alt=""> <em>{318}</em>
			</span>
		</div> -->
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

<script>
	$(document).ready(function() {
		
		let status = $(".comment_content").data("spoiler");
    	
    	if (status == true) {
    		let comment = $(".comment_content").text();
    		
    		$(".comment_content").addClass("disappear");
    		$(".spoilerHTML").html("스포일러 댓글입니다.")
    		
    		$(".spoilerHTML").on('click', function(e) {
    			$(this).prev().removeClass("disappear");
    		})
    	}
		
		
		
		// 댓글 삭제
        $(".deleteBtn").on('click', function() {
        	let id = $('.comment_box').data('mycomment-id');
        	
        	// ajax 글 삭제
			$.ajax ({
				// request
				type: "DELETE"
				, url: "/comment/delete"
				, data: {"id":id}
				
				// response
				, success:function(data) {
					if (data.code == 1) {
						alert("삭제 되었습니다.");
						location.reload();
					} else {
						alert(data.errorMessage);
					}
				}
				, error:function(e) {
					alert("댓글을 삭제하는데 실패했습니다.");
				}
			}); // --- ajax
        	
        }); // --댓글 삭제 
        
        
       // 댓글 신고
       $(".reportBtn").on('click', function() {
       	    let apiId = $(this).parent().parent().parent().parent().data('api-id');
       		let userId = $(this).parent().parent().parent().parent().data('user-id');
          	let commentId = $(this).parent().parent().parent().parent().data('comment-id');
          	let content = $(this).parent().parent().parent().siblings().text();
          	let reportConfirm = confirm("정말 신고하시겠습니까?");
          	console.log(content);

	       	// ajax 댓글 신고
			$.ajax ({
				// request
				type: "post"
				, url: "/report/create"
				, data: {"apiId":apiId, "userId":userId, "commentId":commentId, "content":content}
				
				// response
				, success:function(data) {
					if (data.code == 1) {
					 	if (reportConfirm == true) {
						 	alert("신고되었습니다.");
							location.reload();
				        } else if (reportConfirm == false) {
				            alert("신고가 취소되었습니다.");
							location.reload();
				        }
					} else {
						alert(data.errorMessage);
					}
				}
				, error:function(e) {
					alert("댓글을 신고하는데 실패했습니다.");
				}
			}); // --- ajax
       	
       }); // --댓글 신고 
        
	})
</script>

<script type="text/javascript">
	function goBack(){
		window.history.back();
	}
</script>