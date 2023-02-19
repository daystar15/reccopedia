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
				<!--<c:forEach var="result" items="${keywordList}">
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
				</c:forEach>-->
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
			
			$.ajax({
				type: "GET"
				, url: "/collection/find"
				, data: {"title":title}
				, dataType: "html"
				, success:function(data) {
					if (data.code == 1) {
						let rows = data['title']
	                    //i에 0을 입력; i의 숫자가 rows의 리스트 요소 개수보다 낮을 때까지 반복; i는 1씩 커짐
			            for(let i = 0; i < rows.length; i++){
			                let title = rows[i]['title'];
			                            //`(백틱)을 이용해서 변수로 HTML구조 변경
			                let tempHTML = `
			                    <li class="findcontent">
								<div class="border_box">
									<div class="review_left">
										<div class="review_poster">
											<img src="/static/images/test.jpg" alt="">
										</div>
										<div class="review_info">
											<div>
												<h4 class="review_subject">${title}</h4>
												<div class="content_info">
													<span class="year">${title}</span> &middot; <span class="country">${title}</span>
												</div>
											</div>
										</div>
									</div>
									<div class="collection_plus">
										<img src="/static/images/plus.png" alt="">
									</div>
								</div>
							</li>
			                    `;
			                            //card-columns 라는 id를 가진 태그에 작성해준 tempHTML 변수에 담긴 코드를 붙여주기
			                $('#content_list_box').append(tempHTML);
			            }
							
							
							
						}
						
					
				}
				, error:function(e) {
					alert("오류입니다.");
				}
			});
			
		})
	})
	
	function goBack(){
		window.history.back();
	}
</script>