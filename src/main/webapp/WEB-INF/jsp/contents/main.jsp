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
						<a href="/contents/contents_view?id=${now.id}">
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
							<div class="point">평균 &starf; 4.2</div>
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
						<a href="/contents/contents_view?id=${netflix.id}">
							<div class="poster">
								<img src="https://image.tmdb.org/t/p/w500/${netflix.poster_path}" alt="">
							</div>
							<h3 class="content_subject">${netflix.title}</h3>
							<div class="point">평균 &starf; 4.2</div>
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
						<a href="/contents/contents_view?id=${disneyResult.id}">
							<div class="poster">
								 <img src="https://image.tmdb.org/t/p/w500/${disneyResult.poster_path}" alt="">
							</div>
							<h3 class="content_subject">${disneyResult.title}</h3>
							<div class="point">평균 &starf; 4.2</div>
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
						<a href="/contents/contents_view?id=${movieTrendingWeek.id}">
							<div class="poster">
								 <img src="https://image.tmdb.org/t/p/w500/${movieTrendingWeek.poster_path}" alt="">
							</div>
							<h3 class="content_subject">${movieTrendingWeek.title}</h3>
							<div class="point">평균 &starf; 4.2</div>
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
			<h2 class="main_title">오늘의 배우</h2>
			<div class="contents">
				<ul>
					<c:forEach var="personTrending" items="${personTrending}">
					<li class="">
						<a href="/contents/person_view?id=${personTrending.id}">
							<div class="poster">
								 <img src="https://image.tmdb.org/t/p/w500/${personTrending.profile_path}" alt="">
							</div>
							<h3 class="content_subject">${personTrending.name}</h3>
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
	</div> -->
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
	const carousel = document.querySelector(".carousel"),
	firstImg = carousel.querySelectorAll("li")[0],
	arrowIcons = document.querySelectorAll(".contents i");
	let isDragStart = false, isDragging = false, prevPageX, prevScrollLeft, positionDiff;
	
	const showHideIcons = () => {
	    // showing and hiding prev/next icon according to carousel scroll left value
	    let scrollWidth = carousel.scrollWidth - carousel.clientWidth; // getting max scrollable width
	    arrowIcons[0].style.display = carousel.scrollLeft == 0 ? "none" : "block";
	    arrowIcons[1].style.display = carousel.scrollLeft == scrollWidth ? "none" : "block";
	}
	
	arrowIcons.forEach(icon => {
	    icon.addEventListener("click", () => {
	        let firstImgWidth = firstImg.clientWidth + 14; // getting first img width & adding 14 margin value
	        // if clicked icon is left, reduce width value from the carousel scroll left else add to it
	        carousel.scrollLeft += icon.id == "left" ? -firstImgWidth : firstImgWidth;
	        setTimeout(() => showHideIcons(), 60); // calling showHideIcons after 60ms
	        console.log(arrowIcons.index);
	    });
	});
	
	const autoSlide = () => {
	    // if there is no image left to scroll then return from here
	    if(carousel.scrollLeft - (carousel.scrollWidth - carousel.clientWidth) > -1 || carousel.scrollLeft <= 0) return;
	    positionDiff = Math.abs(positionDiff); // making positionDiff value to positive
	    let firstImgWidth = firstImg.clientWidth + 14;
	    // getting difference value that needs to add or reduce from carousel left to take middle img center
	    let valDifference = firstImgWidth - positionDiff;
	    if(carousel.scrollLeft > prevScrollLeft) { // if user is scrolling to the right
	        return carousel.scrollLeft += positionDiff > firstImgWidth / 3 ? valDifference : -positionDiff;
	    }
	    // if user is scrolling to the left
	    carousel.scrollLeft -= positionDiff > firstImgWidth / 3 ? valDifference : -positionDiff;
	}
	
	const dragStart = (e) => {
	    // updatating global variables value on mouse down event
	    isDragStart = true;
	    prevPageX = e.pageX || e.touches[0].pageX;
	    prevScrollLeft = carousel.scrollLeft;
	}
	
	const dragging = (e) => {
	    // scrolling images/carousel to left according to mouse pointer
	    if(!isDragStart) return;
	    e.preventDefault();
	    isDragging = true;
	    carousel.classList.add("dragging");
	    positionDiff = (e.pageX || e.touches[0].pageX) - prevPageX;
	    carousel.scrollLeft = prevScrollLeft - positionDiff;
	    showHideIcons();
	}
	
	const dragStop = () => {
	    isDragStart = false;
	    carousel.classList.remove("dragging");
	    if(!isDragging) return;
	    isDragging = false;
	    autoSlide();
	}
	
	carousel.addEventListener("mousedown", dragStart);
	carousel.addEventListener("touchstart", dragStart);
	document.addEventListener("mousemove", dragging);
	carousel.addEventListener("touchmove", dragging);
	document.addEventListener("mouseup", dragStop);
	carousel.addEventListener("touchend", dragStop);
</script>