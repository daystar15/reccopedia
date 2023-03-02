<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<header class="header col-2 bg-dark text-white px-3 py-4">
	<h1 class="logo w-75 m-auto">
	    <img src="/static/images/logo.png" alt="" class="w-100">
	</h1>
	<div class="admin_info text-center my-3">
	    <h5 class="mt-4 mb-4">${adminName}님 환영합니다!</h5>
        <a class=" text-white" href="/main">왓챠피디아 사이트 이동</a>
    </div>
	    <nav class="nav ml-5">
	        <ul class="list-unstyled">
	            <li class="nav-item mb-2">
	                <a class="nav-link text-white" href="/admin/main">대시보드</a>
	            </li>
	            <li class="nav-item mb-2">
	            	<a class="nav-link text-white" href="/admin/user_view">회원관리</a>
	            </li>
	            <li class="nav-item">
	            	<a class="nav-link text-white" href="/admin/report_view">신고댓글목록</a>
	            </li>
	        </ul>
	    </nav>
</header>