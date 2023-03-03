<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="nav_box">
	<div>
		<img src="/static/images/right-arrow.png" alt="">
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
					<a href="#">수정하기</a>
				</div>
				<div class="added_collection">
					<div>
						<img src="/static/images/test.jpg" alt="">
					</div>
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
        });
        
    });
</script>