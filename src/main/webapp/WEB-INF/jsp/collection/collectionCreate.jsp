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


<form action="#">
        <input type="text" name="txtName" id="txtName">
        <input type="button" name="btnSubmit" id="btnSubmit" value="로그인">
        <hr>
        <span id="lstCookies"></span>
    </form>

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

 	
 	// 전체 쿠키
    let cookies = $.cookie();
 	
    // 쿠키 value 값 - poster path
    let cookiePosterPath = $.cookie("cookieId");
    
 	$('<img>', {src: 'https://image.tmdb.org/t/p/w92/' + cookiePosterPath}).appendTo(".add_collection_lists");

    

    
 	// 페이지 로드 이벤트 잡기
    window.onload = Page_Load;
     
    function Page_Load() {
        // 저장된 쿠키 읽어오기
        displayCookie();
 
        // 여러개의 쿠키 리스트를 <span> 태그에 출력
        displayCookieList();
 
    }   
 
    // 쿠키 읽어오는 함수
    function displayCookie() {
        var txtName = "";
        // 쿠키 여부 확인
        if (document.cookie != "") {
            // 여러개의 쿠키 읽어오기
            var cookies = document.cookie.split("; ");
            // 쿠키 개수만큼 반복
            for (var i=0; i<cookies.length; i++) {
                if (cookies[i].split("=")[0] == "txtName")  {
                    //alert(document.cookie);  // txtName=red;
                    txtName = cookies[i].split("=")[1];             
                }
            }
        }
        document.getElementById("txtName").value = txtName;
    }
 
    function btnSubmit_Click() {
        // txtName에 저장된 값을 쿠키에 저장
        setCookie();
        setCookies("txtemail", "test@a.com", 1); //테스트 쿠키 저장
    }
 
    // 쿠키 저장 함수
    function setCookie() {
        // 쿠키 소멸시기
        var expireDate = new Date();
        expireDate.setMonth(expireDate.getMonth() + 1);
        var txtName = document.getElementById("txtName").value;
        // 쿠키 저장
        document.cookie = "txtName=" + txtName + "; path=/; expires=" + expireDate.toGMTString();
        alert("쿠키 저장");
    }
 
    // 쿠키 저장 함수
    function setCookies(cookieName, cookieValue, expireDays) {
        var expireDate = new Date();
        expireDate.setDate(expireDate.getDate() + expireDays);  // 넘겨온 일자 값: 1
        document.cookie = name + "=" + cookiePosterPath + "; path=/; expires=" + expireDate.toGMTString();     
    }
 
    // 쿠키 리스트 출력 함수
    function displayCookieList() {
        var str = "";
        if (document.cookie == "") {
            str = "입력된 쿠키가 없습니다!";
        }
        else {
            // 여러개의 쿠키를 읽어온다. 
            var cookies = document.cookie.split("; ");
            for (var i=0; i<cookies.length; i++) {
            	const tagArea = document.getElementsByClassName('add_collection_lists');
            	
            	let count = 0;
                if (tagArea > 1) {
                	const newNode = tagArea.cloneNode(true);
                	count++;
                	tagArea.after(newNode);
                }
                str += "name : " + cookies[i].split("=")[0] + 
                    ", cookiePosterPath: " + cookies[i].split("=")[1] + "<br />";              
            }
        }
         
        document.getElementById("lstCookies").innerHTML = str;
    }
    
    
    
   
    function goBack(){
		window.history.back();
	}
</script>