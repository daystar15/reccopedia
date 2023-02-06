<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
	<title>Document</title>
	<!-- 부트스트랩 CDN link -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div id="wrap">
        <div class="d-flex">
            <header class="header col-2 bg-dark text-white">
                <h1 class="logo w-75 text-center">
                    <img src="/static/images/logo.png" alt="" class="w-100">
                </h1>
                <div class="admin_info text-center">
                    <h4>{관리자}님 환영합니다!</h4>
                    <a class=" text-white" href="#">왓챠피디아 사이트 이동</a>
                </div>
                <nav class="nav">
                    <ul class="list-unstyled">
                        <li class="nav-item">
                            <a class="nav-link text-white" href="#">대시보드</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-white" href="#">컨텐츠 업로드</a>
                        </li>
                    </ul>
                </nav>
            </header>
            <div class="contents col-10">
                <h2>컨텐츠 업로드</h2>
                <form action="" method="post">
                    <div class="d-flex input-group align-items-center">
                        <label for="subject">제목</label>
                        <input type="text" name="subject" id="subject" class="form-control">
                    </div>
                    <div class="d-flex input-group align-items-center">
                        <label for="year">개봉년도</label>
                        <input type="text" class="form-control" name="year" id="year">
                    </div>
                    <div class="d-flex input-group align-items-center">
                        <label for="genre">장르</label>
                        <input type="text" class="form-control" name="genre" id="genre">
                    </div>
                    <div class="d-flex input-group align-items-center">
                        <label for="country">국가</label>
                        <input type="text" class="form-control" name="country" id="country">
                    </div>
                    <div class="d-flex input-group align-items-center">
                        <label for="director">감독</label>
                        <input type="text" class="form-control" name="director" id="director">
                    </div>
                    <div class="d-flex input-group align-items-center">
                        <label for="information">기본정보</label>
                        <textarea name="information" class="form-control" id="information" cols="30" rows="10"></textarea>
                    </div>
                    <div class="d-flex input-group align-items-center">
                        <label for="actor">출연배우</label>
                        <textarea name="actor" class="form-control" id="actor" cols="30" rows="10"></textarea>
                    </div>
                    <div class="d-flex input-group align-items-center">
                        <label for="contentVideo">컨텐츠예고편</label>
                        <input type="text" class="form-control" name="contentVideo" id="contentVideo">
                    </div>
                    <div class="d-flex input-group align-items-center">
                        <label for="contentGallery">컨텐츠이미지</label>
                        <input type="text" class="form-control" name="contentGallery" id="contentGallery">
                    </div>
                    <div>
                        등록일
                    </div>
                    <div>
                        수정일
                    </div>
                    <div>
                        <input type="submit" value="등록">
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>