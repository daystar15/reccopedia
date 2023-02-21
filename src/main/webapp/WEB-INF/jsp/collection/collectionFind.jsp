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
		<form action="/collection/collection_find_result_view" method="get" id="findCollection">
			<div>
				<img src="/static/images/search.png" alt=""> 
				<label> 
					<input type="text" name="title" id="title" placeholder="작품을 검색해보세요.">
				</label>
				<input type="submit" value="검색" id="find_contents">
			</div>
		</form>
		<!-- 영화 목록 박스 (검색해서 있을 때 나타남)-->
		<div class="content_list">
			<ul id="content_list_box">
				
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
				, url: "/collection/collection_find_result_view"
				, data: {"title":title}
				, success:function(data) {
					$("#content_list_box").html(data)
				}
				, error:function(e) {
					alert("오류입니다.");
				}
				
			});//--- ajax
			
		});//--- 검색버튼
		
		
		
	});//--- 제이쿼리
	

	
	function goBack(){
		window.history.back();
	}
</script>