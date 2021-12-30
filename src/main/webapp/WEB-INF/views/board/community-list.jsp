<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>spring ajax</title>
</head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="/myweb/css/styles.css">
<body style="background-color: #ededed;">
	<c:import url="../templates/header.jsp"/>
	<div class="container px-4 px-lg-5" style="padding-top: 118px;">
	<table border="1" width="900px">
		<tr>
			<td>커뮤니티 카테고리</td>
		</tr>

		<c:forEach var="category" items="${list}">
			<tr>
				<td>
				<a href=
					"${path}/board/list/${board.boardId}/${category.categoryId}">
						${category.categoryName}</a></td>
						
			</tr>
		</c:forEach>
	</table>
	</div>
</body>
</html>

