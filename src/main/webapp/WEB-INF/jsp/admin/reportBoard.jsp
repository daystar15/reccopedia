<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="p-5">
	<h2>신고목록</h2>
	<div class="w-90 mt-4">
		<div class="d-flex justify-content-between mb-5">
			
			<div class="bg-light p-4" style="width: 100%">
				<div class="d-flex justify-content-between mb-2">
					<h5>댓글 신고 목록</h5>
				</div>
				<table class="table">
					<thead class="text-center">
						<tr>
							<th>번호</th>
							<th>api번호</th>
							<th>사용자번호</th>
							<th>댓글번호</th>
							<th>내용</th>
							<th>신고이유</th>
							<th>삭제여부</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody class="text-center">
						<c:forEach items="${reportList}" var="list" varStatus="status">
							<tr>
								<td style="vertical-align: middle">${fn:length(reportList) - status.index}</td>
								<td style="vertical-align: middle">${list.apiId}</td>
								<td style="vertical-align: middle">${list.userId}</td>
								<td class="commentId" data-comment="${list.commentId}" style="vertical-align: middle">${list.commentId}</td>
								<td style="vertical-align: middle">${list.content}</td>
								<td style="vertical-align: middle">${list.reason}</td>
								<td style="vertical-align: middle">
								<c:forEach items="${commentList}" var="comment">
									<c:if test="${comment.id eq list.commentId}">
							      		삭제완료
							      	</c:if>
								</c:forEach>
								</td>
								<td><button type="button" class="deleteBtn btn btn-danger">삭제</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>