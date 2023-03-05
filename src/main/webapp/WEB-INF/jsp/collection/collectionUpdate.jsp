<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="nav_box">
	<div>
		<img src="/static/images/right-arrow.png" alt=""  onclick="goBack();">
		<h2>컬렉션 수정</h2>
	</div>
</div>
<div class="collection_create_box">
	<div class="create_box">
		<form action="" method="post">
			<div class="subject">
				<input type="text" name="collectionSubject" id="collectionSubject" placeholder="컬렉션 제목" value="${collectionMap.subject}">
			</div>
			<div class="content">
				<textarea name="collectionContent" id="collectionContent" rows="8" placeholder="설명 입력하기..">${collectionMap.content}</textarea>
			</div>
			<div>
				<div>
					<h3>작품들</h3>
					<a href="/collection/collection_find_view">수정하기</a>
				</div>
				<div class="added_collection">
					<c:forEach var="list" items="${collectionContent}">
						<div class="collection_select_list">
							<div class="collection_select_list_poster" data-content-id="${list.id}">
								<img src="https://image.tmdb.org/t/p/w500/${list.posterPath}" alt="">
							</div>
							<div class="closeBtn" data-select-id="${list.id}">
								<img src="/static/images/close.png" alt="">
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="collection_btn">
				<input type="submit" value="수정하기" id="collectionSubmitBtn">
			</div>
		</form>
	</div>
</div>
<script>
    $('document').ready(function() {
    	
    	let arr1 = new Array();
    	<c:forEach items="${collectionContent}" var="list">
    		arr1.push({
    			id: "${list.id}"
    			, title: "${list.title}"
    			, posterPath: "${list.posterPath}"
    		});
    	</c:forEach>
		let arr2 = JSON.stringify(arr1);
    	console.log(arr2);
    	
    	// 삭제버튼
		$(".closeBtn img").on('click', function() {
			let id = $(".closeBtn").data('select-id');
			alert(id);
			
			// ajax 컨텐츠 삭제
			$.ajax({ 
				type: "DELETE"
				, url: "/collection/collection_content_delete"
				, data: {"id":id}
				, success:function(data) {
					if (data.code == 1) {
						alert("삭제 되었습니다.");
						location.reload();
					} else {
						alert(data.errorMessage);
					}
				}
				, error:function(e) {
					alert('오류입니다');
				}
			}); //---ajax
			
		}); //--- 삭제버튼 끝
    	
        $('#collectionSubmitBtn').on('click', function(e) {
            e.preventDefault();

            let collectionSubject = $('#collectionSubject').val().trim();
            let collectionContent =  $('#collectionContent').val();

            if (collectionSubject == '') {
                alert('제목을 입력해주세요');
                return false;
            }
            if (collectionContent == '') {
                alert('내용을 입력해주세요');
                return false;
            }
            
         // ajax 댓글 수정
			$.ajax ({
				// request
				type: "put"
				, url: "/collection/update"
				, data: {"subject":subject, "content":content, "arr2[]":arr2}
			
            	, success:function(data) {
            		if (data.code == 1) {
            			alert("컬렉션 생성에 성공했습니다");
            			location.href="/collection/collection_list_view"
            		} else {
            			alert(data.errorMessage + "ajax 에러");
            		}
            	}
				, error:function(e) {
					alert("컬렉션을 수정하는데 실패했습니다.");
				}
			}); // --- ajax
            
            
        });
        
    });
    
    function goBack(){
		window.history.back();
	}
</script>