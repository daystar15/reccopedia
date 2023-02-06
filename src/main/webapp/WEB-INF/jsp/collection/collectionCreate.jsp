<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="nav_box">
	<div>
		<img src="/static/images/right-arrow.png" alt="">
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
						<img src="/static/images/plus.png" alt=""> <span>작품추가</span>
					</div>
				</div>
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