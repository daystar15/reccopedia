<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:if test="${fillPoint eq false}">
	<div class="star-ratings" data-point-id="${pointList[0].point}">
		<input type="radio" id="5-stars" name="rating" value="5" />
		<label for="5-stars" class="star">&#9733;</label>
		<input type="radio" id="4-stars" name="rating" value="4" />
		<label for="4-stars" class="star">&#9733;</label>
		<input type="radio" id="3-stars" name="rating" value="3" />
		<label for="3-stars" class="star">&#9733;</label>
		<input type="radio" id="2-stars" name="rating" value="2" />
		<label for="2-stars" class="star">&#9733;</label>
		<input type="radio" id="1-star" name="rating" value="1" />
		<label for="1-star" class="star">&#9733;</label>
	</div>
</c:if>

<script>
	$(document).ready(function() {
		
		$('input[name="rating"]').on('change', function() {
			let value = $(this).val();  
	        let checked = $(this).prop('checked');
	        var $label = $(this).next();
	        
	        if(checked)
	            $label.css('color', '#fc0');
		})
	})
</script>