<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav>
	<ul>
		<li><a href="<c:url value='/empinfo/list'/>">직원관리</a></li>
		<li><a href="<c:url value='/empinfo/view'/>">직원상세정보</a></li>
		<li>업체관리</li>
		<li class="floatnone">업체상세정보</li>
	</ul>
</nav>