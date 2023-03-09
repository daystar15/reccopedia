<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.6.3.js"
        integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
        
	<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>
    <title>Reccopedia</title>
    <meta name="og:site_name" content="Reccopedia" />
    <meta name="og:title" content="Reccopedia" />
    <meta name="og:description" content="영화 및 TV프로그램 추천 사이트"/>
    <meta name="og:type" content="website" />
    <meta name="og:image" content="#"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@2.0/nanumsquare.css">
	<link rel="stylesheet" href="/static/css/style.css">
</head>
<body>
	<div id="wrap">
		<header class="header">
			<jsp:include page="../include/header.jsp" />
		</header>
		<div class="container">
			<jsp:include page="../${viewName}.jsp" />
		</div>
		<footer class="footer">
			
			<jsp:include page="../include/footer.jsp" />
		</footer>
	</div>
</body>
</html>