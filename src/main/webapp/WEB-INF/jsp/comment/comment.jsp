<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="nav_box">
	<div>
		<img src="/static/images/right-arrow.png" alt="" onclick="goBack();">
		<h2>코멘트</h2>
	</div>
</div>
<div class="comment_wrap">
	<!-- 댓글 박스 하나 -->
	<div class="comment_box">
		<div class="comment_user">
			<a class="comment_left">
				<span class="comment_user_profile"> <img src="/static/images/test.jpg" alt="">
				</span> <span class="comment_user_name"> {테스트 이름} </span>
			</a>
			<div class="comment_right">&#9733; {5.0}</div>
		</div>
		<div class="comment_content">{그럼에도, 영화는 참으로 마법 같은 것이기에 사랑할 수밖에. 시대는 변해도 영화는 함께 했고, 하고 있고, 할 것이다.}</div>
		<div class="good_box">
			<span class="comment_up"> <img src="/static/images/up.png" alt=""> <em>{318}</em>
			</span>
			<!-- 마지막에 하기(대댓글)
                        <span class="nested_reply">
                            <img src="/static/images/nested_reply.png" alt="">
                            <em>{7}</em>
                        </span> 
                        -->
		</div>
	</div>
	<!-- 댓글 박스 하나 끝 -->
	<!-- 댓글 박스 하나 -->
	<div class="comment_box">
		<div class="comment_user">
			<a href="#" class="comment_left">
				<span class="comment_user_profile"> <img src="/static/images/test.jpg" alt="">
				</span> <span class="comment_user_name"> {테스트 이름} </span>
			</a>
			<div class="comment_right">&#9733; {5.0}</div>
		</div>
		<div class="comment_content">{그럼에도, 영화는 참으로 마법 같은 것이기에 사랑할 수밖에. 시대는 변해도 영화는 함께 했고, 하고 있고, 할 것이다.}</div>
		<div class="good_box">
			<span class="comment_up"> <img src="/static/images/up.png" alt=""> <em>{318}</em>
			</span>
			<!-- 마지막에 하기(대댓글)
                        <span class="nested_reply">
                            <img src="/static/images/nested_reply.png" alt="">
                            <em>{7}</em>
                        </span> 
                        -->
		</div>
	</div>
	<!-- 댓글 박스 하나 끝 -->
</div>

<script type="text/javascript">
	function goBack(){
		window.history.back();
	}
</script>