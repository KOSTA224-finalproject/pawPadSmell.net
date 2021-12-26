<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<body>
	<script type="text/javascript">
</script>
	<sec:authorize access="isAuthenticated()">

		<button type="button" class="btn btn-primary"
			onclick="location.href='/';">메인페이지</button>
		<h1>${boardname.boardName}<br>
			${categoryname.categoryName}게시판
		</h1>
		<button type="button" value="글쓰기" 
			onclick="location.href='${path}/board/write/${boardId}/${categoryId}'">글쓰기</button>
		<table border="1" width="900px">
			<tr>

				<td>작성자</td>
				<td>제목</td>

				<td>날짜</td>
				<td>조회수</td>
				<td>댓글수</td>

			</tr>

			<c:forEach var="dto" items="${list}">
				<tr>

					<td>${dto.memberDTO.nickname}</td>
					<td><a href="<c:url value='/board/${dto.postId}'/>">

							${dto.title} </a></td>

					<td>${dto.regdate}</td>
					<td>${dto.hits}</td>
					<td>${dto.commentCount}</td>

				</tr>
			</c:forEach>
		</table>
		<%-- 페이징 처리 --%>
		<nav aria-label="Page navigation example">
			<ul class="pagination" style="margin: 20px 0">
				<c:if test="${pagingBean.previousPageGroup}">
					<li class="page-item"><a class="page-link"
						href="${path}/board/list/${boardId}/${categoryId}?pageNo=${pagingBean.startPageOfPageGroup-1}">Previous
					</a></li>
				</c:if>
				<c:forEach begin="${pagingBean.startPageOfPageGroup}"
					end="${pagingBean.endPageOfPageGroup}" var="page">
					<c:choose>
						<c:when test="${page == pagingBean.nowPage}">
							<li class="page-item active"><a class="page-link"
								href="${path}/board/list/${boardId}/${categoryId}?pageNo=${page}">
									${page}</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="${path}/board/list/${boardId}/${categoryId}?pageNo=${page}">${page}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${pagingBean.nextPageGroup}">
					<li class="page-item"><form
							action="${path}/board/list/${boardId}/${categoryId}?pageNo=${pagingBean.endPageOfPageGroup+1}">Next</form></li>
				</c:if>
			</ul>
		</nav>
	</sec:authorize>

</body>
</html>