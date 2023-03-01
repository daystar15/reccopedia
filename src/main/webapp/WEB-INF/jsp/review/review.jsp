<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="review_wrap">
	<div class="review_box">
		<h3 class="review_count">92</h3>
		<p class="pharse">평가를 해주세요</p>
		<!-- 영화, TV 선택탭 -->
		<div class="review_menu_tab">
			<ul>
				<li class="on">영화</li>
				<li>TV 프로그램</li>
			</ul>
		</div>
		<!-- 영화, TV 선택탭 끝 -->
		<!-- 랜덤영화 선택 탭 -->
		<div class="select_tab">
			<div>
				<img src="" alt=""> <span>랜덤 영화</span>
			</div>
		</div>
		<!-- 랜덤영화 선택 탭 끝 -->
		<!-- 영화 목록 박스 -->
		<div class="content_list" data-user-id="${userinfo.id}">
			<ul>
				<c:forEach var="movieTrending" items="${movieTrending}" >
				<li>
					<!-- 영화 목록 하나 -->
					<div class="border_box" data-api-id="${movieTrending.id}" id="movieList">
						<div class="review_left">
							<div class="review_poster">
								<img src="https://image.tmdb.org/t/p/w500/${movieTrending.poster_path}" alt="">
							</div>
							<div class="review_info">
								<div>
									<h4 class="review_subject" data-title="${movieTrending.title}">${movieTrending.title}</h4>
									<div class="content_info">
										<span class="year">${fn:substring(movieTrending.release_date,0,4)}</span> &middot; <span class="country">${movieTrending.original_language}</span>
									</div>
								</div>
								<div class="star-rating" data-img="${movieTrending.poster_path}" data-api="${movieTrending.id}" data-title="${movieTrending.title}">
									<label class="star"><input type="radio" name="rating" value="5" onclick="button5_click();"/>&#9733;</label>
									<label class="star"><input type="radio" name="rating" value="4" onclick="button4_click();"/>&#9733;</label>
									<label class="star"><input type="radio" name="rating" value="3" onclick="button3_click();" />&#9733;</label>
									<label class="star"><input type="radio" name="rating" value="2" onclick="button2_click();"/>&#9733;</label>
									<label class="star"><input type="radio" name="rating" value="1" onclick="button1_click();"/>&#9733;</label>
								</div>
								
								<%-- 별점 눌려있을 때 --%>
								<div class="filledPoint" >
								
								</div>
								<%-- 별점 눌려있을 때 --%>
							</div>
						</div>
					</div>
					<div class="review_more" data-api-id="${movieTrending.id}">
						<div data-api-title="${movieTrending.title}">
							<span class="more_circle"></span> 
							<span class="more_circle"></span> 
							<span class="more_circle"></span>
						</div>
					</div>
					<!-- 영화 목록 하나 끝 -->
				</li>
				</c:forEach>
				
			</ul>
		</div>
		<!-- 영화 목록 박스 끝 -->
	</div>
</div>


<%--모달배경 --%>
<div class="modal_back none"></div>
<%-- 코멘트창 클릭 시 시작 --%>
<div class="comment_modal none">
	<div class="modal_box">
		<div class="write_comment_top">
			<h6></h6>
			<span class="comment_close"> <img src="/static/images/close.png" alt="">
			</span>
		</div>
		<form action="" method="post">
			<textarea name="write_comment_content" id="write_comment_content" maxlength="10000" rows="10" placeholder="이 작품에 대한 생각을 자유롭게 표현해주세요.">${myComment.content}</textarea>
			<div>
				<div class="write_comment_left">
					<!-- sns 공유
                                <span></span> 
                            -->
					<span class="no_spoiler"> <img src="/static/images/hide.png" alt="">
					</span>
				</div>
				<div class="write_comment_right">
					<span class="comment_length">0/10000</span>
					<input type="submit" value="저장" id="submitComment">
				</div>
			</div>
		</form>
	</div>
</div>

<script> 
	function button1_click(e) {
		let target = event.target;
		let parent = target.parentElement;
	    console.log(parent);
	    parent.style.color="#fc0";
	}
	function button2_click() {
		let target = event.target;
		let parent = target.parentElement;
	    console.log(parent);
	    parent.style.color="#fc0";
	}
	function button3_click() {
		let target = event.target;
		let parent = target.parentElement;
	    console.log(parent);
	    parent.style.color="#fc0";
	}
	function button4_click() {
		let target = event.target;
		let parent = target.parentElement;
	    console.log(parent);
	    parent.style.color="#fc0";
	}
	function button5_click() {
		let target = event.target;
		let parent = target.parentElement;
	    console.log(parent);
	    parent.style.color="#fc0";
	}
	$(document).ready(function() {
		

		// 별점 나타내기 버튼
        let mypoint = $(".star-rating").data('point-id');
        if (mypoint == 1) {
        	$('#1-star').prop('checked', true);
        } else if (mypoint == 2) {
        	$('#1-star').prop('checked', true);
        	$('#2-stars').prop('checked', true);
        } else if (mypoint == 3) {
        	$('#1-star').prop('checked', true);
        	$('#2-stars').prop('checked', true);
        	$('#3-stars').prop('checked', true);
        } else if (mypoint == 4) {
        	$('#1-star').prop('checked', true);
        	$('#2-stars').prop('checked', true);
        	$('#3-stars').prop('checked', true);
        	$('#4-stars').prop('checked', true);
        } else if (mypoint == 5) {
        	$('#1-star').prop('checked', true);
        	$('#2-stars').prop('checked', true);
        	$('#3-stars').prop('checked', true);
        	$('#4-stars').prop('checked', true);
        	$('#5-stars').prop('checked', true);
        }
        
       	$('.review_more > div').on('click', function(e) {
           	let apiId = $('.review_more').data('api-id');
			let title = e.target.attributes[0].value;
			$(".write_comment_top h6").text(title);
           	$(".comment_modal").removeClass('none');
            $(".modal_back").removeClass('none');
        });

        $('.modal_back').on('click', function() {
            $(".modal_back").addClass('none');
            $(".comment_modal").addClass('none');
        });

        $('.comment_close').on('click', function() {
            $(".modal_back").addClass('none');
            $(".comment_modal").addClass('none');
        });
        
     	// 댓글 작성
        $("#submitComment").on('click', function(e) {
        	e.preventDefault();
        	
        	// 댓글을 작성할 작품 api 번호
        	let id = $(".modal_box").data('api-id');
        	
        	// 작성한 댓글
        	let comment = $("#write_comment_content").val();
        	
        	if (comment == '') {
        		alert("댓글을 작성해주세요.")
        		return;
        	}
        	
        	$.ajax({
        		type:'POST'
        		, url:'/comment/create'
        		, data: {"id":id, "content":comment}
        		, success: function(data) {
        			if (data.code == 1) {
        				alert('댓글이 작성되었습니다!');
        				location.reload();
        			} else if (data.code == 500) {
        				alert("로그인을 해주세요.");
        				location.href = "/main";
        			}
        		}
        		, error:function(jqXHR, textStatus, errorThrown) {
        			var errorMsg = jqXHR.responseJSON.status;
					alert(errorMsg + ":" + textStatus + "에러");
        		}
        		
        		
        	}); //---ajax 끝
        	
        	
        }); //---댓글 작성


        
        // 별점 버튼
        $("input[name=rating]").on('click', function(e) {
        	let apiId = e.target.parentElement.parentElement.dataset.api;
        	let point = $(this).val();
        	let userId = $(".content_list").data('user-id');
			let title = e.target.parentElement.parentElement.dataset.title;
			let posterPath = e.target.parentElement.parentElement.dataset.img;
        	//console.log(apiId + title + img);
		
        	if (userId == 0) {
        		alert("로그인을 해주세요");
        		return;
        	}
        	
        	$.ajax({
        		type: "post"
        		, url: "/point/contents_point_view"
        		, data: {"point":point, "apiId":apiId, "title":title, "posterPath":posterPath, "userId":userId}
        		, success:function(data) {
        			$(".filledPoint").html(data);
        		} 
        		, error:function(e) {
        			alert("에러");
        		}
        	});//---ajax
        	
        })// ---별점 버튼
		
		$(".review_more").on('click', function() {
			
			
		})
	})
</script>