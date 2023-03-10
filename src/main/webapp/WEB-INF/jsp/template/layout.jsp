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
    <meta name="og:site_name" content="Recopedia" />
    <meta name="og:title" content="Recopedia" />
    <meta name="og:description" content="영화 및 TV프로그램 추천 사이트"/>
    <meta name="og:type" content="website" />
    <meta name="og:image" content="/static/images/logo.png"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@2.0/nanumsquare.css">
	<link rel="stylesheet" href="/static/css/style.css">
	<!-- 파비콘 -->
	<link rel="icon" href="/static/images/favicon/favicon.ico" type="image/x-icon" sizes="16x16"> 
	<link rel="apple-touch-icon" sizes="57x57" href="/static/images/favicon/apple-icon-57x57.png">
	<link rel="apple-touch-icon" sizes="60x60" href="/static/images/favicon/apple-icon-60x60.png">
	<link rel="apple-touch-icon" sizes="72x72" href="/static/images/favicon/apple-icon-72x72.png">
	<link rel="apple-touch-icon" sizes="76x76" href="/static/images/favicon/apple-icon-76x76.png">
	<link rel="apple-touch-icon" sizes="114x114" href="/static/images/favicon/apple-icon-114x114.png">
	<link rel="apple-touch-icon" sizes="120x120" href="/static/images/favicon/apple-icon-120x120.png">
	<link rel="apple-touch-icon" sizes="144x144" href="/static/images/favicon/apple-icon-144x144.png">
	<link rel="apple-touch-icon" sizes="152x152" href="/static/images/favicon/apple-icon-152x152.png">
	<link rel="apple-touch-icon" sizes="180x180" href="/static/images/favicon/apple-icon-180x180.png">
	<link rel="icon" type="image/png" sizes="192x192"  href="/static/images/favicon/android-icon-192x192.png">
	<link rel="icon" type="image/png" sizes="32x32" href="/static/images/favicon/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="96x96" href="/static/images/favicon/favicon-96x96.png">
	<link rel="icon" type="image/png" sizes="16x16" href="/static/images/favicon/favicon-16x16.png">
	<link rel="manifest" href="/static/images/favicon/manifest.json">
	<meta name="msapplication-TileColor" content="#ffffff">
	<meta name="msapplication-TileImage" content="/static/images/favicon/ms-icon-144x144.png">
<meta name="theme-color" content="#ffffff">
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