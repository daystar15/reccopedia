<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<div class="nav_box">
	<div>
		<img src="/static/images/right-arrow.png" alt="" onclick="goBack();">
		<h2>작품들</h2>
	</div>
</div>
<div class="collection_create_box">
	<div class="plus_box">
		<div class="go_keep">
			<a href="#">보관함에서 추가</a>
		</div>
		<form action="/collection/find" method="get" id="findCollection">
			<div>
				<img src="/static/images/search.png" alt=""> 
				<label> 
					<input type="text" name="title" id="keyword" placeholder="작품을 검색해보세요.">
				</label>
				<input type="submit" value="검색" id="find_contents">
			</div>
		</form>
		<!-- 영화 목록 박스 (검색해서 있을 때 나타남)-->
		<div class="content_list">
			<ul id="content_list_box">
				<c:forEach var="result" items="${keywordList}">
					<li class="findcontent">
					<div class="border_box">
						<div class="review_left">
							<div class="review_poster">
								<img src="/static/images/test.jpg" alt="">
							</div>
							<div class="review_info">
								<div>
									<h4 class="review_subject">${result.title}</h4>
									<div class="content_info">
										<span class="year">${result.title}</span> &middot; <span class="country">${result.title}</span>
									</div>
								</div>
							</div>
						</div>
						<div class="collection_plus">
							<img src="/static/images/plus.png" alt="">
						</div>
					</div>
				</li>
				</c:forEach>
			</ul>
		</div>
		<!-- 영화 목록 박스 끝 -->
	</div>
</div>


<script>
	$(document).ready(function() {
		$("#findCollection #find_contents").on('click', function(e) {
			e.preventDefault();
			
			let title = $('#findCollection input[name=title]').val().trim();

			if (keyword == '') {
				alert('검색어를 입력해주세요');
				return;
			}
			let keywordList = "<c:out value='${keywordList}'/>";
			console.log(keywordList);
			for(var i = 0; i < keywordList.length; i++){
			    (function(i) {
					$.ajax({
						type: "GET"
						, url: "/collection/find"
						, data: {"title":title}
						, dataType: "json"
						, async: false
						, success:function(data) {
							if (data.code == 1) {
								
								
							}
								
							
						}
						, error:function(e) {
							alert("오류입니다.");
						}
					});
			    })(i);
			
		});//--- 검색버튼
	});//--- 제이쿼리
	
	function goBack(){
		window.history.back();
	}
</script>