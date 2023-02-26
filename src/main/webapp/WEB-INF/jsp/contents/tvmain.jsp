<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="main_wrap">
	<div class="section">
		<div class="inner">
			<h2 class="main_title">TV프로그램 인기 순위</h2>
			<div class="contents">
				<ul>
					<c:forEach var="now" items="${popularResult}" varStatus="status">
					<li>
						<a href="/contents/tv_contents_view?id=${now.id}">
							<div>
								<div class="poster">
									<span class="rank">${status.count}</span> <img src="https://image.tmdb.org/t/p/w500/${now.poster_path}" alt="">
								</div>
							</div>
							<h3 class="content_subject">${now.name}</h3>
							<div class="point">평균 &starf; 4.2</div>
						</a>
					</li>
					</c:forEach>
					
				</ul>
			</div>
		</div>
		<div class="left">
			<img src="/static/images/arrow.png" alt="">
		</div>
		<div class="right">
			<img src="/static/images/arrow.png" alt="">
		</div>
	</div>
	
	<div class="section">
		<div class="inner">
			<h2 class="main_title">TV프로그램 화제작</h2>
			<div class="contents">
				<ul>
					<c:forEach var="top" items="${topratedResult}">
					<li>
						<a href="/contents/tv_contents_view?id=${top.id}">
							<div class="poster">
								<img src="https://image.tmdb.org/t/p/w500/${top.poster_path}" alt="">
							</div>
							<h3 class="content_subject">${top.name}</h3>
							<div class="point">평균 &starf; 4.2</div>
						</a>
					</li>
					</c:forEach>
					
				</ul>
			</div>
		</div>
		<div class="left">
			<img src="/static/images/arrow.png" alt="">
		</div>
		<div class="right">
			<img src="/static/images/arrow.png" alt="">
		</div>
	</div>
	
	<div class="section">
		<div class="inner">
			<h2 class="main_title">넷플릭스 TV프로그램</h2>
			<div class="contents">
				<ul>
					<c:forEach var="netflix" items="${netflixResult}">
					<li>
						<a href="/contents/tv_contents_view?id=${netflix.id}">
							<div class="poster">
								<img src="https://image.tmdb.org/t/p/w500/${netflix.poster_path}" alt="">
							</div>
							<h3 class="content_subject">${netflix.name}</h3>
							<div class="point">평균 &starf; 4.2</div>
						</a>
					</li>
					</c:forEach>
					
				</ul>
			</div>
		</div>
		<div class="left">
			<img src="/static/images/arrow.png" alt="">
		</div>
		<div class="right">
			<img src="/static/images/arrow.png" alt="">
		</div>
	</div>
	
	<div class="section">
		<div class="inner">
			<h2 class="main_title">디즈니 플러스 화제작</h2>
			<div class="contents">
				<ul>
					<c:forEach var="toprated" items="${topratedResult}">
					<li>
						<a href="/contents/contents_view?id=${toprated.id}">
							<div class="poster">
								 <img src="https://image.tmdb.org/t/p/w500/${toprated.poster_path}" alt="">
							</div>
							<h3 class="content_subject">${toprated.title}</h3>
							<div class="point">평균 &starf; 4.2</div>
						</a>
					</li>
					</c:forEach>
					
				</ul>
			</div>
		</div>
		<div class="left">
			<img src="/static/images/arrow.png" alt="">
		</div>
		<div class="right">
			<img src="/static/images/arrow.png" alt="">
		</div>
	</div>
	
	<div class="section">
		<div class="inner">
			<h2 class="main_title">오늘의 트렌딩</h2>
			<div class="contents">
				<ul>
					<c:forEach var="tvTrending" items="${tvTrending}">
					<li>
						<a href="/contents/tv_contents_view?id=${tvTrending.id}">
							<div class="poster">
								 <img src="https://image.tmdb.org/t/p/w500/${tvTrending.poster_path}" alt="">
							</div>
							<h3 class="content_subject">${tvTrending.name}</h3>
							<div class="point">평균 &starf; 4.2</div>
						</a>
					</li>
					</c:forEach>
					
				</ul>
			</div>
		</div>
		<div class="left">
			<img src="/static/images/arrow.png" alt="">
		</div>
		<div class="right">
			<img src="/static/images/arrow.png" alt="">
		</div>
	</div>
	
	<div class="section">
		<div class="inner">
			<h2 class="main_title">금주의 Hot</h2>
			<div class="contents">
				<ul>
					<c:forEach var="tvTrendingWeek" items="${tvTrendingWeek}">
					<li>
						<a href="/contents/tv_contents_view?id=${tvTrendingWeek.id}">
							<div class="poster">
								 <img src="https://image.tmdb.org/t/p/w500/${tvTrendingWeek.poster_path}" alt="">
							</div>
							<h3 class="content_subject">${tvTrendingWeek.name}</h3>
						</a>
					</li>
					</c:forEach>
					
				</ul>
			</div>
		</div>
		<div class="left">
			<img src="/static/images/arrow.png" alt="">
		</div>
		<div class="right">
			<img src="/static/images/arrow.png" alt="">
		</div>
	</div>
	
	
	<div class="section user_collection">
		<div class="inner">
			<div class="main_title">
				<a href="#">
					<span class="circle"> <img src="" alt="" class="userProfileImg">
					</span>
				</a>
				<div>
					<span class="user_name"> absdefg님의 컬렉션 </span>
					<h2 class="collection_title">신작 라인업</h2>
				</div>
			</div>
			<div class="contents">
				<ul>
					<li>
						<a href="#">
							<div class="poster">
								<span class="rank">1</span> <img src="/static/images/test.jpg" alt="">
							</div>
							<h3 class="content_subject">더 퍼스트 슬램덩크</h3>
							<div class="point">평균 &starf; 4.2</div>
						</a>
					</li>
					<li>
						<a href="#">
							<div class="poster">
								<span class="rank">1</span> <img src="/static/images/test.jpg" alt="">
							</div>
							<h3 class="content_subject">더 퍼스트 슬램덩크</h3>
							<div class="point">평균 &starf; 4.2</div>
						</a>
					</li>
					<li>
						<a href="#">
							<div class="poster">
								<span class="rank">1</span> <img src="/static/images/test.jpg" alt="">
							</div>
							<h3 class="content_subject">더 퍼스트 슬램덩크</h3>
							<div class="point">평균 &starf; 4.2</div>
						</a>
					</li>
					<li>
						<a href="#">
							<div class="poster">
								<span class="rank">1</span> <img src="/static/images/test.jpg" alt="">
							</div>
							<h3 class="content_subject">더 퍼스트 슬램덩크</h3>
							<div class="point">평균 &starf; 4.2</div>
						</a>
					</li>
					<li>
						<a href="#">
							<div class="poster">
								<span class="rank">1</span> <img src="/static/images/test.jpg" alt="">
							</div>
							<h3 class="content_subject">더 퍼스트 슬램덩크</h3>
							<div class="point">평균 &starf; 4.2</div>
						</a>
					</li>
					<li>
						<a href="#">
							<div class="poster">
								<span class="rank">1</span> <img src="/static/images/test.jpg" alt="">
							</div>
							<h3 class="content_subject">더 퍼스트 슬램덩크</h3>
							<div class="point">평균 &starf; 4.2</div>
						</a>
					</li>
					<li>
						<a href="#">
							<div class="poster">
								<span class="rank">1</span> <img src="/static/images/test.jpg" alt="">
							</div>
							<h3 class="content_subject">더 퍼스트 슬램덩크</h3>
							<div class="point">평균 &starf; 4.2</div>
						</a>
					</li>
					<li>
						<a href="#">
							<div class="poster">
								<span class="rank">1</span> <img src="/static/images/test.jpg" alt="">
							</div>
							<h3 class="content_subject">더 퍼스트 슬램덩크</h3>
							<div class="point">평균 &starf; 4.2</div>
						</a>
					</li>
					<li>
						<a href="#">
							<div class="poster">
								<span class="rank">1</span> <img src="/static/images/test.jpg" alt="">
							</div>
							<h3 class="content_subject">더 퍼스트 슬램덩크</h3>
							<div class="point">평균 &starf; 4.2</div>
						</a>
					</li>
					<li>
						<a href="#">
							<div class="poster">
								<span class="rank">1</span> <img src="/static/images/test.jpg" alt="">
							</div>
							<h3 class="content_subject">더 퍼스트 슬램덩크</h3>
							<div class="point">평균 &starf; 4.2</div>
						</a>
					</li>
				</ul>
			</div>
		</div>
		<div class="left">
			<img src="/static/images/arrow.png" alt="">
		</div>
		<div class="right">
			<img src="/static/images/arrow.png" alt="">
		</div>
	</div>
	<div class="section">
		<div class="inner">
			<h2 class="main_title">왓챠피디아 컬렉션</h2>
			<div class="contents">
				<ul>
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
				</ul>
			</div>
		</div>
		<div class="left">
			<img src="/static/images/arrow.png" alt="">
		</div>
		<div class="right">
			<img src="/static/images/arrow.png" alt="">
		</div>
	</div>
</div>

<script>
	$(document).ready(function() {
		$(".contents ul li a").on('click', function() {
			
		}); // -- 컨텐츠 클릭 시 
	})
</script>


<!-- 모달배경 -->
<!-- <div class="modal_back none"></div> -->

<!-- 회원가입 -->
<!-- <div class="sign_up_modal none">
	<div class="modal_box">
		<div class="modal_top">
			<h1 class="modal_logo">
				<img src="/static/images/logo.png" alt="">
			</h1>
			<p>회원가입</p>
		</div>
		<form action="" method="post">
			<div>
				<input type="text" name="name" id="name" placeholder="이름">
			</div>
			<div>
				<input type="text" name="email" id="email" placeholder="이메일">
			</div>
			<div>
				<input type="password" name="password" id="password" placeholder="비밀번호">
			</div>
			<div class="sign_up_submit">
				<input type="submit" value="회원가입">
			</div>
		</form>
		<div class="go_sign_in">
			<p>
				이미 가입하셨나요?
				<a href="#" class="link">로그인</a>
			</p>
		</div>
	</div>
</div> -->

<!-- 로그인 -->
<!--<div class="sign_in_modal none">
	<div class="modal_box">
		<div class="modal_top">
			<h1 class="modal_logo">
				<img src="/static/images/logo.png" alt="">
			</h1>
			<p>로그인</p>
		</div>
		<form action="" method="post">
			<div>
				<input type="text" name="email" id="email" placeholder="이메일">
			</div>
			<div>
				<input type="password" name="password" id="password" placeholder="비밀번호">
			</div>
			<div class="sign_up_submit">
				<input type="submit" value="로그인">
			</div>
		</form>
		<!-- 비밀번호 찾기 나중에 처리
                <div class="forget_password">
                    <a href="#">비밀번호를 잊어버리셨나요?</a>
                </div> 
                
		<div class="go_sign_up">
			<p>
				계정이 없으신가요?
				<a href="#" class="link">회원가입</a>
			</p>
		</div>
	</div>
</div> -->

<!-- <script>
    $(document).ready(function () {
        $('.sign_up').on('click', function() {
            $(".sign_up_modal").removeClass('none');
            $(".modal_back").removeClass('none');
            $(".go_sign_up").removeClass('none');
        });

        $('.sign_up_modal .go_sign_in p a').on('click', function() {
            $(".sign_in_modal").removeClass('none');
            $(".sign_up_modal").addClass('none');
        });

        $('.sign_in').on('click', function() {
            $(".sign_in_modal").removeClass('none');
            $(".modal_back").removeClass('none');
            $(".go_sign_in").removeClass('none');
        });

        $('.sign_in_modal .go_sign_up p a').on('click', function() {
            $(".sign_up_modal").removeClass('none');
            $(".sign_in_modal").addClass('none');
        });

        $('.modal_back').on('click', function() {
            $(".modal_back").addClass('none');
            $(".sign_up_modal").addClass('none');
            $(".sign_in_modal").addClass('none');
        });
    });
</script> -->