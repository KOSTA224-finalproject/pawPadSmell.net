<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>spring ajax</title>
</head>
<body>


	<table border="1" width="900px">
		<tr>
			<td>커뮤니티 카테고리</td>
		</tr>

		<c:forEach var="category" items="${list}">
			<tr>
				<td>
				<form action=
					"${path}/board/list/${board.boardId }/${category.categoryId}" method="get">
						${category.categoryName}</form></td>
						
			</tr>
		</c:forEach>
	</table>
</body>
</html>

