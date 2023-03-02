<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="p-5">
	<h2>회원관리</h2>
	<div class="w-90 mt-4">
		<div class="d-flex justify-content-between mb-5">
			<div class="bg-light p-4" style="width: 100%">
				<div class="d-flex justify-content-between mb-2">
					<h5>회원관리</h5>
				</div>
				<table class="table">
					<thead class="text-center">
						<tr>
							<th>No.</th>
							<th>이름</th>
							<th>소개</th>
							<th>이메일</th>
							<th>유저페이지</th>
							<th>회원탈퇴</th>
						</tr>
					</thead>
					<tbody class="text-center">
						<c:forEach items="${userList}" var="list" varStatus="status">
							<tr>
								<td style="vertical-align: middle">${fn:length(userList) - status.index}</td>
								<td style="vertical-align: middle">${list.name}</td>
								<td style="vertical-align: middle">${list.info}</td>
								<td style="vertical-align: middle">${list.email}</td>
								<td style="vertical-align: middle"> 
									<a href="/user/user_view?id=${list.id}"></a> 
								</td>
								<td style="vertical-align: middle"><button type="button" class="btn btn-danger">회원탈퇴</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			
			
			
		</div>
	</div>
</div>