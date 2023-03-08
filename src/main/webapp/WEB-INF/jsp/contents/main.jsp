<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="main_wrap">
	<div class="section">
		<div class="inner">
			<h2 class="main_title">박스오피스 순위</h2>
			<div class="contents">
				<i id="left" class="fa-solid fa-angle-left"></i>
				<ul class="carousel">
					<c:forEach var="now" items="${nowResult}" varStatus="status">
					<li>
						<a href="/contents/contents_view?id=${now.id}&type=1">
							<div>
								<div class="poster">
									<span class="rank">${status.count}</span> 
									<img src="https://image.tmdb.org/t/p/w500/${now.poster_path}" draggable="false" alt="">
								</div>
							</div>
							<h3 class="content_subject">${now.title}</h3>
							<div class="content_info">
								<span class="year">${fn:substring(now.release_date,0,4)}</span> &middot; <span class="country">${now.original_language}</span>
							</div>
							<div class="point">평균 &starf; <fmt:formatNumber value="${now.vote_average/2}" pattern=".0"/></div>
						</a>
					</li>
					</c:forEach>
				</ul>
				<i id="right" class="fa-solid fa-angle-right"></i>
			</div>
		</div>

	</div>
	<div class="section">
		<div class="inner">
			<h2 class="main_title">넷플릭스 화제작</h2>
			<div class="contents">
				<i id="left" class="fa-solid fa-angle-left"></i>
				<ul class="carousel">
					<c:forEach var="netflix" items="${netflixResult}">
					<li>
						<a href="/contents/contents_view?id=${netflix.id}&type=1">
							<div class="poster">
								<img src="https://image.tmdb.org/t/p/w500/${netflix.poster_path}" alt="">
							</div>
							<h3 class="content_subject">${netflix.title}</h3>
							<div class="point">평균 &starf; <fmt:formatNumber value="${netflix.vote_average/2}" pattern=".0"/></div>
						</a>
					</li>
					</c:forEach>
				</ul>
				<i id="right" class="fa-solid fa-angle-right"></i>
			</div>
		</div>
	</div>
	<div class="section">
		<div class="inner">
			<h2 class="main_title">디즈니 플러스 화제작</h2>
			<div class="contents">
				<i id="left" class="fa-solid fa-angle-left"></i>
				<ul class="carousel">
					<c:forEach var="disneyResult" items="${disney}">
					<li>
						<a href="/contents/contents_view?id=${disneyResult.id}&type=1">
							<div class="poster">
								 <img src="https://image.tmdb.org/t/p/w500/${disneyResult.poster_path}" alt="">
							</div>
							<h3 class="content_subject">${disneyResult.title}</h3>
							<div class="point">평균 &starf; <fmt:formatNumber value="${disneyResult.vote_average/2}" pattern=".0"/></div>
						</a>
					</li>
					</c:forEach>
				</ul>
				<i id="right" class="fa-solid fa-angle-right"></i>
			</div>
		</div>
	</div>
	
	<%-- <div class="section">
		<div class="inner">
			<h2 class="main_title">오늘의 트렌딩</h2>
			<div class="contents">
				<ul>
					<c:forEach var="movieTrending" items="${movieTrending}">
					<li>
						<a href="/contents/contents_view?id=${movieTrending.id}">
							<div class="poster">
								 <img src="https://image.tmdb.org/t/p/w500/${movieTrending.poster_path}" alt="">
							</div>
							<h3 class="content_subject">${movieTrending.title}</h3>
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
	</div> --%>
	
	<div class="section">
		<div class="inner">
			<h2 class="main_title">금주의 Hot</h2>
			<div class="contents">
				<i id="left" class="fa-solid fa-angle-left"></i>
				<ul class="carousel">
					<c:forEach var="movieTrendingWeek" items="${movieTrendingWeek}">
					<li>
						<a href="/contents/contents_view?id=${movieTrendingWeek.id}&type=1">
							<div class="poster">
								 <img src="https://image.tmdb.org/t/p/w500/${movieTrendingWeek.poster_path}" alt="">
							</div>
							<h3 class="content_subject">${movieTrendingWeek.title}</h3>
							<div class="point">평균 &starf; <fmt:formatNumber value="${movieTrendingWeek.vote_average/2}" pattern=".0"/></div>
						</a>
					</li>
					</c:forEach>
				</ul>
				<i id="right" class="fa-solid fa-angle-right"></i>
			</div>
		</div>
	</div>
	
	<div class="section">
		<div class="inner">
			<h2 class="main_title">오늘의 배우</h2>
			<div class="contents">
				<i id="left" class="fa-solid fa-angle-left"></i>
				<ul class="carousel">
					<c:forEach var="personTrending" items="${personTrending}">
					<li>
						<a href="/contents/person_view?id=${personTrending.id}">
							<div class="poster">
								 <img src="https://image.tmdb.org/t/p/w500/${personTrending.profile_path}" alt="">
							</div>
							<h3 class="content_subject">${personTrending.name}</h3>
						</a>
					</li>
					</c:forEach>
				</ul>
				<i id="right" class="fa-solid fa-angle-right"></i>
			</div>
		</div>
	</div>
	
	<!-- <div class="section user_collection">
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
	</div> -->
</div>


<script>
	const carousel_1 = document.querySelectorAll(".carousel")[0] //첫번째 슬라이드 영역
	const carousel_2 = document.querySelectorAll(".carousel")[1] //두번째 슬라이드 영역
	const carousel_3 = document.querySelectorAll(".carousel")[2] //세번쨰 슬라이드 영역
	const carousel_4 = document.querySelectorAll(".carousel")[3] //네번째 슬라이드 영역
	const carousel_5 = document.querySelectorAll(".carousel")[4] //다섯번째 슬라이드 영역
	
	firstImg1 = carousel_1.querySelectorAll("li")[0]; //첫번째 슬라이드 첫번째 이미지
	firstImg2 = carousel_2.querySelectorAll("li")[0]; //두번째 슬라이드 첫번째 이미지
	firstImg3 = carousel_3.querySelectorAll("li")[0]; //세번째 슬라이드 첫번째 이미지
	firstImg4 = carousel_4.querySelectorAll("li")[0]; //네번째 슬라이드 첫번째 이미지
	firstImg5 = carousel_5.querySelectorAll("li")[0]; //네번째 슬라이드 첫번째 이미지
	
	//arrowIcons = document.querySelectorAll(".contents i");
	contents_slide = document.querySelectorAll(".contents i"),
	arrowIcons_1 = [contents_slide[0],contents_slide[1]],
	arrowIcons_2 = [contents_slide[2],contents_slide[3]],
	arrowIcons_3 = [contents_slide[4],contents_slide[5]],
	arrowIcons_4 = [contents_slide[6],contents_slide[7]];
	arrowIcons_5 = [contents_slide[8],contents_slide[9]];
	
	
	let isDragStart = false, isDragging= false, prevPageX, prevScrollLeft, positionDiff;
	
	const showHideIcons = () => {
	    // showing and hiding prev/next icon according to carousel scroll left value
	    let scrollWidth = carousel_1.scrollWidth - carousel_1.clientWidth; // getting max scrollable width
		arrowIcons_1[0].style.display = carousel_1.scrollLeft == 0 ? "none" : "block";
		arrowIcons_1[1].style.display = carousel_1.scrollLeft == scrollWidth ? "none" : "block";
		
		arrowIcons_2[0].style.display = carousel_2.scrollLeft == 0 ? "none" : "block";
		arrowIcons_2[1].style.display = carousel_2.scrollLeft == scrollWidth ? "none" : "block";
		
		arrowIcons_3[0].style.display = carousel_3.scrollLeft == 0 ? "none" : "block";
		arrowIcons_3[1].style.display = carousel_3.scrollLeft == scrollWidth ? "none" : "block";
		
		arrowIcons_4[0].style.display = carousel_4.scrollLeft == 0 ? "none" : "block";
		arrowIcons_4[1].style.display = carousel_4.scrollLeft == scrollWidth ? "none" : "block";
		
		arrowIcons_5[0].style.display = carousel_5.scrollLeft == 0 ? "none" : "block";
		arrowIcons_5[1].style.display = carousel_5.scrollLeft == scrollWidth ? "none" : "block";
	}
	
	arrowIcons_1.forEach((icon =>{
		icon.addEventListener("click", () => {
			let firstImgWidth = firstImg1.clientWidth + 14;
			carousel_1.scrollLeft += icon.id == "left" ? -firstImgWidth : firstImgWidth;
			setTimeout(() => showHideIcons(), 60); // calling showHideIcons after 60ms
		});
	}));
	
	arrowIcons_2.forEach((icon =>{
		//console.log(icon);
		icon.addEventListener("click", () => {
			let firstImgWidth = firstImg2.clientWidth + 14;
			carousel_2.scrollLeft += icon.id == "left" ? -firstImgWidth : firstImgWidth;
			setTimeout(() => showHideIcons(), 60); // calling showHideIcons after 60ms
		});
	}));
	
	
	arrowIcons_3.forEach((icon =>{
		icon.addEventListener("click", () => {
			let firstImgWidth = firstImg3.clientWidth + 14;
			carousel_3.scrollLeft += icon.id == "left" ? -firstImgWidth : firstImgWidth;
			setTimeout(() => showHideIcons(), 60); // calling showHideIcons after 60ms
		});
	}));
	
	
	arrowIcons_4.forEach((icon =>{
		icon.addEventListener("click", () => {
			let firstImgWidth = firstImg4.clientWidth + 14;
			carousel_4.scrollLeft += icon.id == "left" ? -firstImgWidth : firstImgWidth;
			setTimeout(() => showHideIcons(), 60); // calling showHideIcons after 60ms
		});
	}));
	
	arrowIcons_5.forEach((icon =>{
		icon.addEventListener("click", () => {
			let firstImgWidth = firstImg5.clientWidth + 14;
			carousel_5.scrollLeft += icon.id == "left" ? -firstImgWidth : firstImgWidth;
			setTimeout(() => showHideIcons(), 60); // calling showHideIcons after 60ms
		});
	}));
</script>