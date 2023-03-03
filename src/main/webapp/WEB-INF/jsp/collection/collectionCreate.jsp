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
					<div class="add_collection_lists">
					
					</div>
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
            	type: "post" 
            	, url: "/collection/create"
            	, data: {"subject":subject, "content":content, "movieList":movieList}
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
            
        
        }); //--- 생성버튼
        
        
        //$.cookie('cookie'); // => "value"
        let cookiePosterPath = $.cookie("cookie");
        let title = $.cookie('title');
        //console.log($.cookie('cookie'));
        
      	//This is not production quality, its just demo code.
        let cookieList = function(cookie) {
        //When the cookie is saved the items will be a comma seperated string
        //So we will split the cookie by comma to get the original array
        let cookies = $.cookie(cookie);
        //Load the items or a new array if null.
        let items = cookies ? cookies.split(/,/) : new Array();

        //Return a object that we can use to access the array.
        //while hiding direct access to the declared items array
        //this is called closures see http://www.jibbering.com/faq/faq_notes/closures.html
        return {
            "add": function(val) {
                //Add to the items.
                items.push(val);
                //Save the items to a cookie.
                //EDIT: Modified from linked answer by Nick see
                //      http://stackoverflow.com/questions/3387251/how-to-store-array-in-jquery-cookie
                $.cookie('cookie', items.join(','));
            },
            "clear": function() {
                items = null;
                //clear the cookie.
                $.cookie('cookie', null);
            },
            "items": function() {
                //Get all the items.
                return items;
            }
          }
        }  
         

        //So on any page you can get the items like this.

        let list = new cookieList("MyItems"); // all items in the array.
        //Adding items to the cookieList

        list.add(cookiePosterPath);
        //Note this value cannot have a comma "," as this will spilt into
        //two seperate values when you declare the cookieList.
        //Getting all the items as an array

        console.log(list.items());
        
        
        $('<img>', {src: 'https://image.tmdb.org/t/p/w500' + cookiePosterPath, alt= "title"}).appendTo(".add_collection_lists");
        
        
        
    }); //---제이쿼리
     	

    function goBack(){
		window.history.back();
	}
</script>