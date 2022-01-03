<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!DOCTYPE html>
<html lang="en">
<head>
<title>게시글 리스트</title>
<meta charset="utf-8">
</head>

<body>
	<sec:authorize access="isAuthenticated()">
	
		<div class="container col-10 px-4 px-lg-5" style="margin-top: 130px; margin-bottom: 140px;">
			<!-- <button type="button" class="btn btn-primary"
			onclick="location.href='/';">메인페이지</button> -->
			<form action="/board/search/${boardId}/${categoryId}">
				<input type="text" name="search">
				<button><img src="https://w7.pngwing.com/pngs/509/879/png-transparent-google-search-keyword-research-company-search-miscellaneous-company-logo.png"
				 height ="20px" width="30px" style="border: none;"></button>
			</form>
				<div style="margin-bottom: 20px; display: inline-block;">
					<h5 style="display: inline-block; position: relative; top: 7px;">
						<span class="badge badge-danger">${boardname.boardName}</span> <span
							class="badge badge-primary">${categoryname.categoryName}</span>&nbsp;
						게시판
					</h5>
				</div>
				<button class="btn btn-primary btn-xl" type="button" value="글쓰기"
					style="float: right;"
					onclick="location.href='${path}/board/write/${boardId}/${categoryId}'">글쓰기</button>
				<table class="table table-hover" style="text-align: center;">
					<thead>
						<tr>
							<th>No</th>
							<th>작성자</th>
							<th width="60%">제목</th>
							<th>날짜</th>
							<th>조회수</th>
							<th>댓글수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="dto" items="${list}">
							<tr>
								<td>${dto.postId}</td>
								<td>${dto.memberDTO.nickname}</td>
								<td><a style="color: #000; text-decoration: none;" href="<c:url value='/board/${dto.postId}'/>"> ${dto.title} </a></td>
								<td>${dto.regdate}</td>
								<td>${dto.hits}</td>
								<td>${dto.commentCount}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
      		</div>
		<%-- 페이징 처리 --%>
		<c:choose>
		<c:when test="${search != null}">
			<nav aria-label="Page navigation example">
			<ul class="pagination" style="margin: 20px 0">
				<c:if test="${pagingBean.previousPageGroup}">
					<li class="page-item" style="display: inline-block;"><a
							style="" class="page-link"
							href="${path}/board/search/${boardId}/${categoryId}?pageNo=${pagingBean.startPageOfPageGroup-1}&&search=${search}">이전
						</a></li>
				</c:if>
				<c:forEach begin="${pagingBean.startPageOfPageGroup}"
					end="${pagingBean.endPageOfPageGroup}" var="page">
					<c:choose>
						<c:when test="${page == pagingBean.nowPage}">
							<li class="page-item active"><a class="page-link"
								href="${path}/board/search/${boardId}/${categoryId}?pageNo=${page}&&search=${search}">
									${page}</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="${path}/board/search/${boardId}/${categoryId}?pageNo=${page}&&search=${search}">${page}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${pagingBean.nextPageGroup}">
				<li class="page-item" style="display: inline-block;"><a
							class="page-link"
							href="${path}/board/search/${boardId}/${categoryId}?pageNo=${pagingBean.endPageOfPageGroup+1}&&search=${search}">다음</a></li>
				</c:if>
			</ul>
		</nav>
		</c:when>
		<c:otherwise>

			<%-- 페이징 처리 --%>
			<nav aria-label="Page navigation example" style="">
				<ul class="pagination"
					style="margin: 20px 0; display: block; text-align: center;">
					<c:if test="${pagingBean.previousPageGroup}">
						<li class="page-item" style="display: inline-block;"><a
							style="" class="page-link"
							href="${path}/board/list/${boardId}/${categoryId}?pageNo=${pagingBean.startPageOfPageGroup-1}">이전
						</a></li>
					</c:if>
					<c:forEach begin="${pagingBean.startPageOfPageGroup}"
						end="${pagingBean.endPageOfPageGroup}" var="page">
						<c:choose>
							<c:when test="${page == pagingBean.nowPage}">
								<li class="page-item active" style="display: inline-block;"><a
									class="page-link"
									href="${path}/board/list/${boardId}/${categoryId}?pageNo=${page}">
										${page}</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item" style="display: inline-block;"><a
									class="page-link"
									href="${path}/board/list/${boardId}/${categoryId}?pageNo=${page}">${page}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${pagingBean.nextPageGroup}">
						<li class="page-item" style="display: inline-block;"><a
							class="page-link"
							href="${path}/board/list/${boardId}/${categoryId}?pageNo=${pagingBean.endPageOfPageGroup+1}">다음</a></li>
					</c:if>
				</ul>
			</nav>
		</c:otherwise>
		</c:choose>
		<button class="btn btn-primary btn-xl" type="button" value="글쓰기" style="float: right;"
			onclick="location.href='${path}/board/write/${boardId}/${categoryId}'">글쓰기</button>
	</sec:authorize>
	
</body>

</html>