<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="nav_box">
	<div>
		<img src="/static/images/right-arrow.png" alt="" onclick="goBack();">
		<h2>기본정보</h2>
	</div>
</div>
<div class="overview">
	<table>
		<thead>
			<tr>
				<th>원제</th>
				<th>제작 연도</th>
				<th>국가</th>
				<th>장르</th>
				<th>상영시간</th>
				<th>연령 등급</th>
				<th>내용</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${contents.title}</td>
			</tr>
			<tr>
				<td>${fn:substring(contents.release_date,0,4)}</td>
			</tr>
			<tr>
				<td>${countryResult}</td>
			</tr>
			<tr>
				<td>${genre}</td>
			</tr>
			<tr>
				<td>
				<fmt:parseNumber value="${contents.runtime div 60}" integerOnly="true"/>시간
				<c:out value="${contents.runtime mod 60}" />분
				</td>
			</tr>
			<tr>
				<td>
				<c:if test="${contents.adult == true}">
					청소년 관람불가
				</c:if>
				<c:if test="${contents.adult == false}">
					15세 이하 시청가능
				</c:if>
				</td>
			</tr>
			<tr>
				<td>${contents.overview}</td>
			</tr>
		</tbody>
	</table>
</div>

<script type="text/javascript">
	function goBack(){
		window.history.back();
	}
</script>