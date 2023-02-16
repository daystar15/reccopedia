<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
				<td>{year}</td>
			</tr>
			<tr>
				<td>{countryResult}</td>
			</tr>
			<tr>
				<td>${genre}</td>
			</tr>
			<tr>
				<td>{runningTime}</td>
			</tr>
			<tr>
				<td>{grade}</td>
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