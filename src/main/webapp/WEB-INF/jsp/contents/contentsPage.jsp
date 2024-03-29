<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="contets_wrap" data-api-id="${contents.id}" data-type-id="1">
	<div class="contents_background">
		<div>
			<img src="https://image.tmdb.org/t/p/w1280${contents.backdrop_path}" alt="">
		</div>
	</div>
	<div class="contets_top">
		<div class="contents_short_box">
			<div class="contents_poster">
				<img data-api-img="${contents.poster_path}" src="https://image.tmdb.org/t/p/w500${contents.poster_path}" alt="">
			</div>
			<div class="contents_info"  data-api-id="${contents.id}">
				<h2 class="title" data-api-title="${contents.title}">${contents.title}</h2>
				<h3>${year} &#183; ${genre} &#183; ${countryResult}</h3>
				<h4>평균 &#9733;<fmt:formatNumber value="${contents.vote_average/2}" pattern=".0"/> (<fmt:formatNumber value="${contents.vote_count}" pattern="#,###" />)</h4>
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
						<c:if test="${fillMyComment eq false}">
							<span>코멘트</span>
						</c:if>
						<%-- 코멘트 되어있을 때 --%>
						<c:if test="${fillMyComment eq true}">
							<span class="on">코멘트</span>
						</c:if>
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
					<div class="contents_keeped" id="getCollection" data-user-id="${userinfo.id}">
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
					<c:if test="${not empty userId}">
						<c:if test="${not empty myComment}">
							<div class="my_comment" data-comment-id="${myComment.id}">
								<span class="comment_user_profile"> 
									<div class="profile_box">
										<img src="${userinfo.profileImagePath}" alt="">
									</div>
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
					</c:if>
					<c:if test="${empty myComment}">
					<button id="writeYourComment">댓글을 남겨보세요</button>
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
							평균 &#9733; <fmt:formatNumber value="${contents.vote_average/2}" pattern=".0"/></br> <span><fmt:formatNumber value="${contents.vote_count}" pattern="#,###" /></span>
						</div>
					</div>
					<div id="graph_cover">
						<div id="point_graph">
							<!-- 그래프 -->
						</div>
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
						<c:forEach items="${commentList}" var="list" begin="0" end="2">
							<li>
								<!-- 댓글 하나 -->
								<div class="comment_user">
									<a href="#" class="comment_left">
										<span class="comment_user_profile">
											<c:if test="${userProfile eq null}">
							                	<div class="empty_box" style="width: 90px;">
													<img src="/static/images/pngegg.png" alt="" style="width: 54%; transform: translate(-90%,-79%);">
												</div>
											</c:if>
											<div class="profile_box">
												<img src="${userProfile}" alt="">
											</div>
										</span> <span class="comment_user_name"> ${list.user.name} </span>
									</a>
									<div class="comment_right">&#9733; ${list.pointCount}</div>
								</div>
								<c:if test="${list.comment.spoiler == false}">
									<div class="comment_content" data-spoiler="${list.comment.spoiler}" data-comment-id="${list.comment.id}">
											${list.comment.content}
									</div>
								</c:if>
								<c:if test="${list.comment.spoiler == true}">
									<div class="comment_content" data-spoiler="${list.comment.spoiler}" data-comment-id="${list.comment.id}">
											${list.comment.content}
									</div>
									<p class="spoilerHTML"></p>
								</c:if>
								<%-- <div class="good_box">
									<span class="comment_up"> 
										<img src="/static/images/up.png" alt=""> 
										<em><c:if test="${list.comment.spoiler == true}">보여줘</c:if></em>
									</span>
								</div> --%>
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
				<%-- <div class="contents_right_bottom">
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
					</div>--%>
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
<div class="comment_modal none" data-api-id="${contents.id}">
	<div class="modal_box" data-api-id="${contents.id}">
		<div class="write_comment_top">
			<h6>${contents.title}</h6>
			<span class="comment_close"> <img src="/static/images/close.png" alt="">
			</span>
		</div>
		<form action="" method="post">
			<!-- <input type="hidden" name="_method" value="put"> -->
			<textarea name="write_comment_content" id="write_comment_content" maxlength="10000" rows="10" placeholder="이 작품에 대한 생각을 자유롭게 표현해주세요.">${myComment.content}</textarea>
			<div>
				<div class="write_comment_left">
					<div>
						<input type="checkbox" id="cb1">
   						<label for="cb1"></label>
					</div>
				</div>
				<div class="write_comment_right">
					<div>
						<span class="comment_length">0/10000</span>
						<c:if test="${empty myComment.content}">
						<input type="submit" value="저장" id="submitComment">
						</c:if>
						<c:if test="${not empty myComment.content}">
						<input type="submit" value="수정" id="updateCommentBtn">
						</c:if>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>
</c:if>
<%-- 댓글창 끝 --%>

<%-- 구글 그래프 --%>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
  google.charts.load('current', {'packages':['bar']});
  google.charts.setOnLoadCallback(drawChart);

  function drawChart() {
    var data = google.visualization.arrayToDataTable([
      ['${contents.title}', 'Point'],
      ['별점', <fmt:formatNumber value="${contents.vote_average/2}" pattern=".0"/>]
    ]);

    var chart = new google.charts.Bar(document.getElementById('point_graph'));
    
    var options = {
      chart: {
        title: '${contents.title}',
        width: "10%",
        margin: "auto"
      }
    };
    

    chart.draw(data, google.charts.Bar.convertOptions(options));
  }
</script>


<script>
    $(document).ready(function () {
    	// 스포일러 상태
    	let status = $(".comment_content").data("spoiler");
    	
    	// 스포일러
    	if (status == true) {
    		let comment = $(".comment_content").text();
    		
    		$(".comment_content").addClass("disappear");
    		$(".spoilerHTML").html("스포일러 댓글입니다.")
    		
    		$(".spoilerHTML").on('click', function(e) {
    			$(this).prev().removeClass("disappear");
    		})
    	}
    	
    	$("#getCollection").on('click', function() {
    		let userId = $(this).data('user-id');
    		
    		if (userId == null) {
    			alert("로그인을 해주세요");
    			location.href="/main";
    		} else {
    			location.href="/collection/collection_list_view";
    		}
    		
    	});
    	
        $('.my_comment_write').on('click', function() {
        	let userId = $(this).data('user-id');
        	
        	if (userId == '') {
        		alert("로그인을 해주세요.")
        		$(".modal_back").addClass('none');
        	} else if (userId != null) {
        		$(".comment_modal").removeClass('none');
                $(".modal_back").removeClass('none');
        	}
            
        });
        
        $("#commentUpdateBtn").on('click', function() {
        	 $(".comment_modal").removeClass('none');
             $(".modal_back").removeClass('none');
        });
        
        $("#writeYourComment").on('click', function() {
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
        	
        	let type = $(".contets_wrap").data('type-id');
        	
        	// 스포일러 됐는지
        	let spoiler = $("#cb1").is(":checked");
        	
        	//console.log(check);
        	
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
        		, data: {"id":id, "content":comment, "spoiler":spoiler, "type": type}
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
        	let type = $(".contets_wrap").data('type-id');
        	let id = $('.my_comment').data('comment-id');
        	
        	// ajax 글 삭제
			$.ajax ({
				// request
				type: "DELETE"
				, url: "/comment/delete"
				, data: {"id":id, "type":type}
				
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
        $("#updateCommentBtn").on('click', function() {
        	let type = $(".contets_wrap").data('type-id');
        	let commentId = $('.my_comment').data('comment-id');
        	let comment = $("#write_comment_content").val();
        	
        	// ajax 댓글 수정
			$.ajax ({
				// request
				type: "put"
				, url: "/comment/update"
				, data: {"commentId":commentId, "content":comment, "type":type}
				
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
        
        
        // 별점 나타내기(누른 직후)
        $("input[name=rating]:radio").change(function () {
            //라디오 버튼 값을 가져온다.
            let mypoint = this.value;
                            
            //alert(mypoint);  
            
            if (mypoint == 1) {
            	$('#1-star').prop('checked', true);
            	$("label[for=1-star]").css("color", "#fc0");
            } 
            if (mypoint == 2) {
            	$('#1-star').prop('checked', true);
            	$("label[for=1-star]").css("color", "#fc0");
            	
            	$('#2-stars').prop('checked', true);
            	$("label[for=2-stars]").css("color", "#fc0");
            } 
    		if (mypoint == 3) {
            	$('#1-star').prop('checked', true);
            	$("label[for=1-star]").css("color", "#fc0");
            	
            	$('#2-stars').prop('checked', true);
            	$("label[for=2-stars]").css("color", "#fc0");
            	
            	$('#3-stars').prop('checked', true);
            	$("label[for=3-stars]").css("color", "#fc0");
            } 
    		if (mypoint == 4) {
            	$('#1-star').prop('checked', true);
            	$("label[for=1-star]").css("color", "#fc0");
            	
            	$('#2-stars').prop('checked', true);
            	$("label[for=2-stars]").css("color", "#fc0");
            	
            	$('#3-stars').prop('checked', true);
            	$("label[for=3-stars]").css("color", "#fc0");
            	
            	$('#4-stars').prop('checked', true);
            	$("label[for=4-stars]").css("color", "#fc0");
            } 
    		 if (mypoint == 5) {
            	$('#1-star').prop('checked', true);
            	$("label[for=1-star]").css("color", "#fc0");
            	
            	$('#2-stars').prop('checked', true);
            	$("label[for=2-stars]").css("color", "#fc0");
            	
            	$('#3-stars').prop('checked', true);
            	$("label[for=3-stars]").css("color", "#fc0");
            	
            	$('#4-stars').prop('checked', true);
            	$("label[for=4-stars]").css("color", "#fc0");
            	
            	$('#5-stars').prop('checked', true);
            	$("label[for=5-stars]").css("color", "#fc0");
            }
    	});
        
        
        
        // 별점 나타내기 버튼(누르고 나서 다시 들어왔을 때)
        let mypoint = $(".star-rating").data('point-id');
        
        //console.log(mypoint);
        
        if (mypoint == 1) {
        	$('#1-star').prop('checked', true);
        	$("label[for=1-star]").css("color", "#fc0");
        } 
        if (mypoint == 2) {
        	$('#1-star').prop('checked', true);
        	$("label[for=1-star]").css("color", "#fc0");
        	
        	$('#2-stars').prop('checked', true);
        	$("label[for=2-stars]").css("color", "#fc0");
        } 
		if (mypoint == 3) {
        	$('#1-star').prop('checked', true);
        	$("label[for=1-star]").css("color", "#fc0");
        	
        	$('#2-stars').prop('checked', true);
        	$("label[for=2-stars]").css("color", "#fc0");
        	
        	$('#3-stars').prop('checked', true);
        	$("label[for=3-stars]").css("color", "#fc0");
        } 
		if (mypoint == 4) {
        	$('#1-star').prop('checked', true);
        	$("label[for=1-star]").css("color", "#fc0");
        	
        	$('#2-stars').prop('checked', true);
        	$("label[for=2-stars]").css("color", "#fc0");
        	
        	$('#3-stars').prop('checked', true);
        	$("label[for=3-stars]").css("color", "#fc0");
        	
        	$('#4-stars').prop('checked', true);
        	$("label[for=4-stars]").css("color", "#fc0");
        } 
		 if (mypoint == 5) {
        	$('#1-star').prop('checked', true);
        	$("label[for=1-star]").css("color", "#fc0");
        	
        	$('#2-stars').prop('checked', true);
        	$("label[for=2-stars]").css("color", "#fc0");
        	
        	$('#3-stars').prop('checked', true);
        	$("label[for=3-stars]").css("color", "#fc0");
        	
        	$('#4-stars').prop('checked', true);
        	$("label[for=4-stars]").css("color", "#fc0");
        	
        	$('#5-stars').prop('checked', true);
        	$("label[for=5-stars]").css("color", "#fc0");
        }
        
        // 별점 버튼
        $("input[name=rating]").on('click', function() {
        	let type = $(".contets_wrap").data('type-id');
        	let apiId = $(".contents_info").data('api-id');
        	let point = $(this).val();
        	let userId = $(".contents_info").data('user-id');
        	let title = $(".contents_info .title").data('api-title');
        	let posterPath = $(".contents_poster img").data('api-img');

        	if (userId == 0) {
        		alert("로그인을 해주세요");
        		return;
        	}

        	$.ajax({
        		type: "post"
        		, url: "/point/contents_point_view"
        		, data: {"point":point, "apiId":apiId, "title":title, "posterPath":posterPath, "userId":userId, "type":type}
        		, success:function(data) {
        			if (data.code == 500) {
        				alert(data.errorMessage)
        			} else {
       					$("#filledPoint").html(data);
        			}
        		} 
        		, error:function(e) {
        			alert("로그인을 해주세요!");
        			$('#1-star').prop('checked', false);
                	$('#2-stars').prop('checked', false);
                	$('#3-stars').prop('checked', false);
                	$('#4-stars').prop('checked', false);
                	$('#5-stars').prop('checked', false);
        		}
        	});//---ajax
        })// ---별점 버튼
        
        
     	// 컬렉션 버튼 토글
        $("#getCollection").on('click', function() {
        	let userId = $(this).data('user-id');
        	//let id = $('.contents_info').data('api-id');
        	//let title = $(".contents_info .title").data('api-title');
        	//let posterPath = $(".contents_poster img").data('api-img');
        	
        	
        	if (userId == '') {
        		alert('로그인을 해주세요!');
        		window.location.replace("/main");
        		
        	} else if (userId != '') {
        		location.href="/collection/collection_list_view"
        	}
        	
        	/* $.ajax({
        		type: "post"
        		, url: "/collection/collection_create_view"
        		, data: {"title":title, "posterPath":posterPath, "id":id, "userId":userId}
        		, success:function(data) {
        			if (data.code == 1) {
        				location.href="/collection/collection_list_view";
        			}
        		}
        		, error: function(e) {
        			alert("추가/해제에 실패했습니다.");
        		}
        	}) *///--ajax
        	
        });//-- 컬렉션 버튼
      
        
        // 보고싶어요 버튼 토글
        $("#wish").on('click', function() {
        	let type = $(".contets_wrap").data('type-id');
        	let userId = $(this).data('user-id');
        	let id = $('.contents_info').data('api-id');
        	let title = $(".contents_info .title").data('api-title');
        	let posterPath = $(".contents_poster img").data('api-img');
        	
        	$.ajax({
        		type: "post"
        		, url: "/wish/" + id
        		, data: {"title":title, "posterPath":posterPath, "type":type}
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

        	let type = $(".contets_wrap").data('type-id');
        	let userId = $(this).data('user-id');
        	let id = $('.contents_info').data('api-id');
        	let title = $(".contents_info .title").data('api-title');
        	let posterPath = $(".contents_poster img").data('api-img');
        	
        	$.ajax({
        		type: "post"
            	, url: "/watching/" + id
        		, data: {"title":title, "posterPath":posterPath, "type":type}
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
    	    let type = $(".contets_wrap").data('type-id');
	       	let userId = $(this).data('user-id');
	       	let id = $('.contents_info').data('api-id');
	
	       	$.ajax({
	 			type: "post"
	       		, url: "/notinterest/" + id
	       		, data:{"type":type}
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
       	
       });//-- 관심없어요 버튼
        
        
    });
</script>