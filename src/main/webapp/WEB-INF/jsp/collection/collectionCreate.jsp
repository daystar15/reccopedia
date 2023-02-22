<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="nav_box">
	<div>
		<img src="/static/images/right-arrow.png" alt="" onclick="goBack();">
		<h2>새 컬렉션</h2>
	</div>
</div>
<div class="collection_create_box">
	<div class="create_box">
		<form action="" method="post">
			<div class="subject">
				<input type="text" name="collectionSubject" id="collectionSubject" placeholder="컬렉션 제목">
			</div>
			<div class="content">
				<textarea name="collectionContent" id="collectionContent" rows="8" placeholder="설명 입력하기.."></textarea>
			</div>
			<div>
				<h3>작품들</h3>
				<div class="add_collection">
					<div>
						<a href="/collection/collection_find_view">
							<img src="/static/images/plus.png" alt=""> <span>작품추가</span>
						</a>
					</div>
					
				</div>
				<%-- 추가한 목록들 --%>
				<div class="add_collection_list">
					<ul>
						<li class="add_collection_lists">
							<img src="">
						</li>
					</ul>
				</div>
				<%-- 추가한 목록들 --%>
			</div>
			<div class="collection_btn">
				<input type="submit" value="제출하기" id="collectionSubmitBtn">
			</div>
		</form>
	</div>
</div>
<script>
    $('document').ready(function() {
        $('#collectionSubmitBtn').on('click', function(e) {
            e.preventDefault();

            let cookieId = $.cookie('cookieId');
            let subject = $('#collectionSubject').val().trim();
            let content =  $('#collectionContent').val();

            if (collectionSubject == '') {
                alert('제목을 입력해주세요');
                return false;
            }
            if (collectionContent == '') {
                alert('내용을 입력해주세요');
                return false;
            }
            
            if (cookieId == null) {
        		alert("작품을 선택해주세요")
        	}
            
            $.ajax({
            	type: "post" 
            	, url: "/collection/create"
            	, data: {"subject":subject, "content":content}
            	, success:function(data) {
            		if (data.code == 1) {
            			location.href="/collection/collection_list_view";
            		} else {
            			alert(data.errorMessage + "ajax 에러");
            		}
            	}
            	, error:function(e) {
            		alert("컬렉션 생성에 실패했습니다. 관리자에게 문의해주세요")
            	}
            	
            	
            }); //---ajax
            
            
        });
        
    });
    
 	// {cookieId: '/eLbVVIgIoqBxR0ZnxbCXao4ujFP.jpg'}
    let cookieId = $.cookie();
    
    // 쿠키 value 값 - poster path
    let cookiePosterPath = $.cookie("cookieId");
    
	// 빈 배열 생성(쿠키 객체를 저장할 배열)
	var arr = []; 
	    
	// localStorage에 저장할 객체
	const cookies = $.cookie();
	arr.push(cookies);


	const arrString = JSON.stringify(arr);
	window.localStorage.setItem('nums', arrString);
	for (var i = 0; i < 10 - 1; i++) {
		
	 }
	
	
	const numsString = window.localStorage.getItem('nums');
	const numsArr = JSON.parse(numsString);

	
	
    // 배열을 JSON 문자열로 변환
 		
	
	console.log(arr);
	const tagArea = document.getElementsByClassName('add_collection_lists');
	
	
	
	
 	$('<img>', {src: 'https://image.tmdb.org/t/p/w92/' + cookiePosterPath}).appendTo(".add_collection_lists");
	
	let count = 0;
    if (tagArea > 1) {
    	const newNode = tagArea.cloneNode(true);
    	count++;
    	tagArea.after(newNode);
    }
    
 
   
    function goBack(){
		window.history.back();
	}
</script>