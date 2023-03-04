<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="add_collection_lists">
	<c:forEach var="list" items="${collectionContent}">
		${list}
		<%-- <img src="https://image.tmdb.org/t/p/w500/${list.posterPath}" alt=""> --%>
	</c:forEach>			
</div>
테스트용