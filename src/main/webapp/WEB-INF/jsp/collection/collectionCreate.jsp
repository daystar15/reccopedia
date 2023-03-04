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
				<input type="text" name="subject" id="subject" placeholder="컬렉션 제목">
			</div>
			<div class="content">
				<textarea name="content" id="content" rows="8" placeholder="설명 입력하기.."></textarea>
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
					<jsp:include page="./collectionSelect.jsp"></jsp:include>
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
    	
    	$(".add_collection_list").html();
    	
        $('#collectionSubmitBtn').on('click', function(e) {
            e.preventDefault();
            
            let subject = $('#subject').val().trim();
            let content =  $('#content').val();
            let movieList =  $(".add_collection_lists img").attr("src");
            let title =  $(".add_collection_lists img").attr("alt");
            alert(movieList);

            if (subject == '') {
                alert('제목을 입력해주세요');
                return false;
            }
            if (content == '') {
                alert('내용을 입력해주세요');
                return false;
            }
            
            if (movieList == null) {
        		alert("작품을 선택해주세요")
        	}
            
            $.ajax({
            	type: "get" 
            	, url: "/collection/create"
            	, data: {"subject":subject, "content":content, "movieList":movieList}
            	, success:function(data) {
            		if (data.code == 1) {
            			
            		} else {
            			alert(data.errorMessage + "ajax 에러");
            		}
            	}
            	, error:function(e) {
            		alert("컬렉션 생성에 실패했습니다. 관리자에게 문의해주세요")
            	}
            	
            	
            }); //---ajax
            
        
        }); //--- 생성버튼
        
        
        
        
        
        
        
    }); //---제이쿼리
     	

    function goBack(){
		window.history.back();
	}
</script>