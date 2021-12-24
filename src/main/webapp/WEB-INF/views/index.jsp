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
	SpringBoot Home
	<br>
	<br>
	<a href="getTotalDepartmentCount">부서수</a>
	<%--
			DepartmentController -- DepartmentMapper 
				|
				views/department/dept-count.jsp
				
 --%>
	<table border="1" width="900px">

		<a href="${path}/second-list">중고거래</a>


		<table border="1" width="900px">
			<tr>
				<td>커뮤니티 카테고리</td>
			</tr>

			<c:forEach var="category" items="${list}">
				<tr>
					<td><form
							action="${path}/board/list/${board.boardId}/${category.categoryId}"
							method="get">
							<input type="submit" value="${category.categoryName} 커뮤니티">
						</form></td>
				</tr>
			</c:forEach>




		</table>
</body>
</html>

</body>
</html>