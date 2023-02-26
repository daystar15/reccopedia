<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="contets_wrap">
	<div class="contents_background">
		<div>
			<img src="https://image.tmdb.org/t/p/w1280${contents.backdrop_path}" alt="">
		</div>
	</div>
	<div class="contets_top">
		<div class="contents_short_box">
			<div class="contents_poster">
				<img src="https://image.tmdb.org/t/p/w500${contents.poster_path}" alt="">
			</div>
			<div class="contents_info"  data-api-id="${contents.id}">
				<h2>${contents.name}</h2>
				<h3>${year} &#183; ${genre} &#183; ${countryResult}</h3>
				<h4>평균 &#9733;{3.8} ({44만명})</h4>
				<div>
					<div class="star-rating" data-point-id="${pointList[0].point}" data-user-id="${userinfo.id}">
						<input type="radio" id="5-stars" name="rating" value="5" />
						<label for="5-stars" class="star">&#9733;</label>
						<input type="radio" id="4-stars" name="rating" value="4" />
						<label for="4-stars" class="star">&#9733;</label>
						<input type="radio" id="3-stars" name="rating" value="3" />
						<label for="3-stars" class="star">&#9733;</label>
						<input type="radio" id="2-stars" name="rating" value="2" />
						<label for="2-stars" class="star">&#9733;</label>
						<input type="radio" id="1-star" name="rating" value="1" />
						<label for="1-star" class="star">&#9733;</label>
					</div>
					
					<%-- 별점 눌려있을 때 --%>
					<div id="filledPoint" >
					
					</div>
					<%-- 별점 눌려있을 때 --%>

					<div class="contents_keeped" id="wish" data-user-id="${userinfo.id}">
						<div class="icon">
							<img src="/static/images/plus.png" alt="">
						</div>
						<%-- 보고싶어요 안되어있을 때 --%>
						<c:if test="${fillWish eq false}">
							<span>보고싶어요</span>
						</c:if>
						<%-- 보고싶어요 되어있을 때 --%>
						<c:if test="${fillWish eq true}">
							<span class="on">보고싶어요</span>
						</c:if>
					</div>
					<div class="contents_keeped my_comment_write" data-user-id="${userinfo.id}">
						<div class="icon">
							<img src="/static/images/pencil.png" alt="">
						</div>
						<%-- 코멘트 안되어있을 때 --%>
						<%--<c:if test="${ .filledWish eq false}">  --%>
						<span>코멘트</span>
						<%--</c:if> --%>
						<%-- 코멘트 되어있을 때 --%>
						<%--<c:if test="${ .filledWish eq true}">  --%>
						<%-- <span class="on">코멘트</span>--%>
						<%--</c:if> --%>
					</div>
					<div class="contents_keeped" id="watching" data-user-id="${userinfo.id}">
						<div class="icon">
							<img src="/static/images/eye.png" alt="">
						</div>
						<%-- 보는중 안되어있을 때 --%>
						<c:if test="${fillWatching eq false}">
							<span>보는중</span>
						</c:if>
						<%-- 보는중 되어있을 때 --%>
						<c:if test="${fillWatching eq true}">
							<span class="on">보는중</span>
						</c:if>
					</div>
					<div class="contents_keeped" id="notInterest" data-user-id="${userinfo.id}">
						<div class="icon">
							<img src="/static/images/block.png" alt="">
						</div>
						<%-- 관심없어요 안되어있을 때 --%>
						<c:if test="${fillNotinterest eq false}">
						<span>관심없어요</span>
						</c:if>
						<%-- 관심없어요 되어있을 때 --%>
						<c:if test="${fillNotinterest eq true}">
						<span class="on">관심없어요</span>
						</c:if>
					</div>
					<div class="contents_keeped" id="getCollection">
						<div class="icon">
							<img src="/static/images/add_collection.png" alt="">
						</div>
						<span>컬렉션 담기</span></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="contents_bottom">
		<div class="contents_info_box">
			<div class="contents_left">
				<!-- 내가 쓴 댓글은 여기서 바로 확인할 수 있음 -->
				<!-- c:if 내가 댓글을 남겼으면 -->
				<div class="write_comment">
					<c:if test="${not empty myComment}">
						<div class="my_comment" data-comment-id="${myComment.id}">
							<span class="comment_user_profile"> <img src="/static/images/test.jpg" alt="">
							</span>
							<p>${myComment.content}</p>
						</div>
						<div>
							<em class="delete" id="deleteBtn"> 
								<img src="/static/images/bin.png" alt=""> 
								<span id="myCommentDeleteBtn">삭제</span>
							</em> 
							<em class="update" id="commentUpdateBtn"> 
								<img src="/static/images/update.png" alt=""> 
								<span id="myCommentUpdateBtn">수정</span>
							</em>
						</div>
					</c:if>
					<c:if test="${empty myComment}">
					<button>댓글을 남겨보세요</button>
					</c:if>
				</div>
				<!-- 내가 쓴 댓글은 여기서 바로 확인할 수 있음 -->
				<div class="basic_info contents_comm">
					<div class="basic_info_top">
						<h5 class="contents_title">기본 정보</h5>
						<a href="/contents/overview_view?id=${contents.id}">더보기</a>
					</div>
					<div class="basic_info_bottom">
						<p>${contents.title}</p>
						<p>${year} &#183; ${countryResult} &#183; ${genre}</p>
						
						<p>
							<fmt:parseNumber value="${contents.runtime div 60}" integerOnly="true"/>시간
							<c:out value="${contents.runtime mod 60}" />분
						 	
						 	<c:if test="${contents.adult ne false}">
						 		&#183;  청소년관람불가
						 	</c:if>
						 </p>
						<p class="summary">
							${contents.overview}
						</p>
					</div>
				</div>
				<div class="contents_cast contents_comm">
					<h5 class="contents_title">출연/제작</h5>
					<ul class="contents_cast_box">
					
						<%-- <c:if test="${crews.department eq 'Directing'}">
							<li>
								<p class="name">${crews.name}</p>
								<p class="job">${crews.department}</p>
							</li>
						</c:if> --%>
						<c:forEach var="crew" items="${crews}">	
							<li>
								<p class="name">${crew.name}</p>
								<p class="job">${crew.character}</p>
							</li>
						</c:forEach>
						
					</ul>
					<button id="moreCrew">더보기</button>
				</div>
				<div class="contents_point_graph contents_comm">
					<div>
						<h5 class="contents_title">별점 그래프</h5>
						<div class="point_count">
							평균 &#9733;{평균} </br> <span>{user.id}</span>
						</div>
					</div>
					<div class="point_graph">
						<!-- 그래프 -->
					</div>
				</div>
				<div class="contents_comment contents_comm">
					<div class="contents_comment_top">
						<div>
							<h5 class="contents_title">코멘트</h5>
							<span>${fn:length(commentList)}</span>
						</div>
						<a href="/comment_view?id=${contents.id}">더보기</a>
					</div>
					<div class="comments">
						<ul>
						<c:forEach items="${commentList}" var="list">
							<li>
								<!-- 댓글 하나 -->
								<div class="comment_user">
									<a href="#" class="comment_left">
										<span class="comment_user_profile"> <img src="/static/images/test.jpg" alt="">
										</span> <span class="comment_user_name"> ${list.user.name} </span>
									</a>
									<div class="comment_right">&#9733; ${list.pointCount}</div>
								</div>
								<div class="comment_content">${list.comment.content}</div>
								<div class="good_box">
									<span class="comment_up"> <img src="/static/images/up.png" alt=""> <em>${list.comment.id}</em>
									</span>
								</div>
								<!-- 댓글 하나 끝 -->
							</li>
						</c:forEach>
							
							
						</ul>
					</div>
				</div>
			</div>
			<div class="contents_right">
				<div class="contents_right_top">
					<div class="gallery">
						<h5 class="contents_title">갤러리</h5>
						<ul>
							<c:forEach var="image" items="${images}">
							<li>
								<img src="https://image.tmdb.org/t/p/w154/${image} " alt="">
							</li>
							</c:forEach>
						</ul>
					</div>
					<div class="video">
						<h5 class="contents_title">동영상</h5>
						<ul>
							<c:forEach var="video" items="${yutube}">
							<li>
								<a href="https://www.youtube.com/watch?v=${video}">
									<img src="https://img.youtube.com/vi/${video}/mqdefault.jpg" alt="">
								</a>
							</li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div class="contents_right_bottom">
					<div class="contain_collection">
						<h5 class="contents_title">이 작품이 담긴 컬렉션</h5>
						<ul>
							<!-- 컬렉션 하나 시작 -->
							<li>
								<a href="#">
									<div class="box">
										<div>
											<div>
												<div class="mini_poster">
													<img src="/static/images/test.jpg" alt="">
												</div>
											</div>
											<div>
												<div class="mini_poster">
													<img src="/static/images/test.jpg" alt="">
												</div>
											</div>
											<div>
												<div class="mini_poster">
													<img src="/static/images/test.jpg" alt="">
												</div>
											</div>
											<div>
												<div class="mini_poster">
													<img src="/static/images/test.jpg" alt="">
												</div>
											</div>
										</div>
									</div>
								</a>
							</li>
							<!-- 컬렉션 하나 끝 -->
						</ul>
					</div>
					<!-- 비슷한 작품 -->
					<div class="similar">
						<h5 class="contents_title">비슷한 작품</h5>
						<ul>
						<c:forEach var="similar" items="${similars}">
							<li>
								<a href="/contents/contents_view?id=${similar.id}">
									<div class="poster simi">
										<img src="https://image.tmdb.org/t/p/w154/${similar.poster_path}" alt="">
									</div>
									<h3 class="content_subject">${similar.title}</h3>
									<div class="point">평균 &starf; 4.2</div>
								</a>
							</li>
						</c:forEach>
						</ul>
					</div>
					<!-- 비슷한 작품 끝 -->
				</div>
			</div>
		</div>
	</div>
</div>

<c:if test="${not empty userId}">
<%--모달배경 --%>
<div class="modal_back none"></div>
<%-- 코멘트창 클릭 시 시작 --%>
<div class="comment_modal none">
	<div class="modal_box" data-api-id="${contents.id}">
		<div class="write_comment_top">
			<h6>${contents.title}</h6>
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
</c:if>
<%-- 댓글창 끝 --%>
<script>
    $(document).ready(function () {
    	
    	$("#getCollection").on('click', function() {
    		location.href="/collection/collection_list_view";
    	});
    	
        $('.my_comment_write').on('click', function() {
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
        
        // 댓글 삭제
        $("#deleteBtn").on('click', function() {
        	let commentId = $('.my_comment').data('comment-id');
        	
        	// ajax 글 삭제
			$.ajax ({
				// request
				type: "DELETE"
				, url: "/comment/delete"
				, data: {"commentId":commentId}
				
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
        
        // 댓글 수정
        $("#commentUpdateBtn").on('click', function() {
        	let commentId = $('.my_comment').data('comment-id');
        	let comment = $("#write_comment_content").val();
        	$(".comment_modal").removeClass('none');
        	$(".modal_back").removeClass('none');
        	
        	// ajax 댓글 수정
			$.ajax ({
				// request
				type: "put"
				, url: "/comment/update"
				, data: {"commentId":commentId, "content":comment}
				
				// response
				, success:function(data) {
					if (data.code == 1) {
						alert("수정 되었습니다.");
						location.reload();
					} else {
						alert(data.errorMessage);
					}
				}
				, error:function(e) {
					alert("댓글을 수정하는데 실패했습니다.");
				}
			}); // --- ajax
        	
        }); // --댓글 수정 
        
        
        // 출연/제작 더보기 버튼
        $("#moreCrew").on('click', function() {
        	$('.contents_cast_box').css("height", "auto");
        }); //-- 출연/제작 더보기 버튼
        
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
        
        // 별점 버튼
        $("input[name=rating]").on('click', function() {
        	let apiId = $(".contents_info").data('api-id');
        	let point = $(this).val();
        	let userId = $(".contents_info").data('user-id');

        	if (userId == 0) {
        		alert("로그인을 해주세요");
        		return;
        	}
			
        	$.ajax({
        		type: "post"
        		, url: "/point/contents_point_view"
        		, data: {"point":point, "apiId":apiId}
        		, success:function(data) {
       				$("#filledPoint").html(data);
        		} 
        		, error:function(e) {
        			alert("에러");
        		}
        	});//---ajax
        })// ---별점 버튼
      
        
        // 보고싶어요 버튼 토글
        $("#wish").on('click', function() {
        	let userId = $(this).data('user-id');
        	let id = $('.contents_info').data('api-id');

        	
        	$.ajax({
        		type: "post"
        		, url: "/wish/" + id
        		, success:function(data) {
        			if (data.code == 1) {
        				location.reload(true);
        			} else {
        				alert(data.errorMessage);
        			}
        		}
        		, error: function(e) {
        			alert("추가/해제에 실패했습니다.");
        		}
        	})//--ajax
        	
        });//--보고싶어요 버튼
        

        // 보는중 버튼 토글
        $("#watching").on('click', function() {
        	let userId = $(this).data('user-id');
        	let id = $('.contents_info').data('api-id');
        	
        	$.ajax({
  				type: "post"
        		, url: "/watching/" + id
        		, success:function(data) {
        			if (data.code == 1) {
        				location.reload(true);
        			} else {
        				alert(data.errorMessage);
        			}
        		}
        		, error: function(e) {
        			alert("추가/해제에 실패했습니다.");
        		}
        	})//--ajax
        	
        });//-- 보는중 버튼
        
        
       // 관심없어요 버튼 토글
       $("#notInterest").on('click', function() {
	       	let userId = $(this).data('user-id');
	       	let id = $('.contents_info').data('api-id');
	
	       	$.ajax({
	 			type: "post"
	       		, url: "/notinterest/" + id
	       		, success:function(data) {
	       			if (data.code == 1) {
	       				location.reload(true);
	       			} else {
	       				alert(data.errorMessage);
	       			}
	       		}
	       		, error: function(e) {
	       			alert("추가/해제에 실패했습니다.");
	       		}
	       	})//--ajax
       	
       });//-- 보는중 버튼
        
        
    });
</script>