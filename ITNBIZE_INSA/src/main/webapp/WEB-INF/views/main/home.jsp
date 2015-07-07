<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Home</title>
	<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<style>

</style>
<link rel="stylesheet" href="<c:url value='/resources/css/MainTop.css'/>">
<script>
$(function($){//기본 bdleft 높이 설정
	var winHeight =$(window).height();
	var navHeight =$("nav").height();
	$("#bdLeft").height((winHeight - navHeight)+"px");
});

</script>
</head>
<body>
<jsp:include page="../common/top.jsp"/>
<div id="body">
	<div id="bdLeft">
		left
	</div>
	<div>
		main
	</div>
</div>
</body>
</html>
