<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<div class="contets_wrap">
	<div class="contents_background">
		<div>
			<img src="https://image.tmdb.org/t/p/w500${contents.backdrop_path}" alt="">
		</div>
	</div>
	<div class="contets_top">
		<div class="contents_short_box">
			<div class="contents_poster">
				<img src="https://image.tmdb.org/t/p/original${contents.poster_path}" alt="">
			</div>
			<div class="contents_info">
				<h2>${contents.title}</h2>
				<h3>${year} &#183; ${genre} &#183; ${countryResult}</h3>
				<h4>평균 &#9733;{3.8} ({44만명})</h4>
				<div>
					<div class="star-rating">
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
					<div class="contents_keeped">
						<div class="icon">
							<img src="/static/images/plus.png" alt="">
						</div>
						<span>보고싶어요</span>
					</div>
					<div class="contents_keeped my_comment_write">
						<div class="icon">
							<img src="/static/images/pencil.png" alt="">
						</div>
						<span>코멘트</span>
					</div>
					<div class="contents_keeped">
						<div class="icon">
							<img src="/static/images/eye.png" alt="">
						</div>
						<span>보는중</span>
					</div>
					<div class="contents_keeped">
						<div class="icon">
							<img src="/static/images/block.png" alt="">
						</div>
						<span>관심없어요</span>
					</div>
					<div class="contents_keeped">
						<div class="icon">
							<img src="/static/images/add_collection.png" alt="">
						</div>
						<span>컬렉션 담기</span>
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
					<div class="my_comment">
						<span class="comment_user_profile"> <img src="/static/images/test.jpg" alt="">
						</span>
						<p>{내가 쓴 댓글 내용}</p>
					</div>
					<div>
						<em class="delete"> <img src="/static/images/bin.png" alt=""> <span id="myCommentDeleteBtn">삭제</span>
						</em> <em class="update"> <img src="/static/images/update.png" alt=""> <span id="myCommentUpdateBtn">수정</span>
						</em>
					</div>
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
						<p>${contents.runtime} &#183; ${contents.adult}</p>
						<p class="summary">
							${contents.overview}
						</p>
					</div>
				</div>
				<div class="contents_cast contents_comm">
					<h5 class="contents_title">출연/제작</h5>
					<ul class="contents_cast_box">
					
					<%-- <c:if ${crews.department} eq 'Directing'>
						<li>
							<p class="name">${crews.name}</p>
							<p class="job">${crews.job}</p>
						</li>
					</c:if> --%>
					<c:forEach var="crew" items="${crews}">	
						<li>
							<p class="name">${crew.name}</p>
							<p class="job">${crew.character}</p>
						</li>
					</c:forEach>
						
					</ul>
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
							<span>{comment.id}</span>
						</div>
						<a href="/comment_view?id=${contents.id}">더보기</a>
					</div>
					<div class="comments">
						<ul>
							<li>
								<!-- 댓글 하나 -->
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
								</div>
								<!-- 댓글 하나 끝 -->
							</li>
							<li>
								<!-- 댓글 하나 -->
								<div class="comment_user">
									<a href="#" class="comment_left">
										<span class="comment_user_profile"> <img src="/static/images/test.jpg" alt="">
										</span> <span class="comment_user_name"> {테스트 이름} </span>
									</a>
									<div class="comment_right">&#9733; {5.0}</div>
								</div>
								<div class="comment_content">{말도 안되는 미모 뽐내는 파릇파릇한 톰 크루즈가 비행/사랑/고뇌하는 와중에도 있는대로 반짝거리며 온 몸으로 사나이! 청춘! 애국!을 외쳐대는 본격 미군홍보영화}</div>
								<div class="good_box">
									<span class="comment_up"> <img src="/static/images/up.png" alt=""> <em>{318}</em>
									</span>
								</div>
								<!-- 댓글 하나 끝 -->
							</li>
							<li>
								<!-- 댓글 하나 -->
								<div class="comment_user">
									<a href="#" class="comment_left">
										<span class="comment_user_profile"> <img src="/static/images/test.jpg" alt="">
										</span> <span class="comment_user_name"> {테스트 이름} </span>
									</a>
									<div class="comment_right">&#9733; {5.0}</div>
								</div>
								<div class="comment_content">{말도 안되는 미모 뽐내는 파릇파릇한 톰 크루즈가 비행/사랑/고뇌하는 와중에도 있는대로 반짝거리며 온 몸으로 사나이! 청춘! 애국!을 외쳐대는 본격 미군홍보영화}</div>
								<div class="good_box">
									<span class="comment_up"> <img src="/static/images/up.png" alt=""> <em>{318}</em>
									</span>
								</div>
								<!-- 댓글 하나 끝 -->
							</li>
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
							<li>
								<a href="#">
									<div class="poster">
										<img src="/static/images/test.jpg" alt="">
									</div>
									<h3 class="content_subject">{비슷한작품이름}</h3>
									<div class="point">평균 &starf; 4.2</div>
								</a>
							</li>
						</ul>
					</div>
					<!-- 비슷한 작품 끝 -->
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 모달배경 -->
<div class="modal_back none"></div>
<!-- 코멘트창 클릭 시 시작 -->
<!-- 회원가입 -->
<div class="comment_modal none">
	<div class="modal_box">
		<div class="write_comment_top">
			<h6>${contents.title}</h6>
			<span class="comment_close"> <img src="/static/images/close.png" alt="">
			</span>
		</div>
		<form action="" method="post">
			<textarea name="write_comment_content" id="write_comment_content" maxlength="10000" rows="10" placeholder="이 작품에 대한 생각을 자유롭게 표현해주세요."></textarea>
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
					<input type="submit" value="저장">
				</div>
			</div>
		</form>
	</div>
</div>
<script>
    $(document).ready(function () {
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
    });
</script>
