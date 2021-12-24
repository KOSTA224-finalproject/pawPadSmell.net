<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<style>
@
keyframes cat { 0% {
	left: 0px;
	top: 0px;
}

100


%
{
left


:


200px
;


top


:


0px
;


}
}
#up-on-scroll {
	transition: transform 0.7s, opacity 1s;
}

.masthead {
	animation: fadeInAnimation ease 2s;
	animation-iteration-count: 1;
	animation-fill-mode: forwards;
}

@
keyframes fadeInAnimation { 0% {
	opacity: 0;
}
100


%
{
opacity


:


1
;


}
}
</style>
<head>
<meta charset="UTF-8">
<title>spring ajax</title>
</head>
<body>
	<sec:authorize access="isAuthenticated()">
	<div id="portfolio">
			<div class="container-fluid p-0" id="up-on-scroll">
				<div class="row g-0">
					<div class="col-lg-4 col-sm-6" id="up-on-scroll">
						<c:forEach var="category" items="${list}">
						<a class="portfolio-box"
							href="${path}/board/list/2/1"
							style="max-width: 100%; height: 50vh;" title="Project Name">
							<img class="img-fluid"
							src="/myweb/images/img/portfolio/thumbnails/cat.jfif"
							style="max-width: 100%; height: 50vh;" alt="..." />
							<div class="portfolio-box-caption">
								<div class="project-category text-white-50">Category</div>
								<div class="project-name">
									<h2>CAT</h2>
								</div>
							</div>
						</a>
					</div>
					<div class="col-lg-4 col-sm-6" id="up-on-scroll">
						<a class="portfolio-box"
							href="${path}/board/list/2/2"
							style="max-width: 100%; height: 50vh;" title="Project Name">
							<img class="img-fluid"
							src="/myweb/images/img/portfolio/thumbnails/dog.jpg"
							style="max-width: 100%; height: 50vh;" alt="..." />
							<div class="portfolio-box-caption">
								<div class="project-category text-white-50">Category</div>
								<div class="project-name">
									<h2>DOG</h2>
								</div>
							</div>
						</a>
					</div>

					<div class="col-lg-4 col-sm-6" id="up-on-scroll">
						<a class="portfolio-box"
							href="${path}/board/list/${board.boardId}/${category.categoryId}"
							style="max-width: 100%; height: 50vh;" title="Project Name">
							<img class="img-fluid"
							src="/myweb/images/img/portfolio/thumbnails/bird.jpeg"
							style="max-width: 100%; height: 50vh;" alt="..." />
							<div class="portfolio-box-caption">
								<div class="project-category text-white-50">Category</div>
								<div class="project-name">
									<h2>BIRD</h2>
								</div>
							</div>
						</a>
					</div>
					<div class="col-lg-4 col-sm-6" id="up-on-scroll">
						<a class="portfolio-box"
							href="${path}/board/list/1/4"
							style="max-width: 100%; height: 50vh; overflow: hidden;"
							title="Project Name"> <img class="img-fluid"
							src="/myweb/images/img/portfolio/thumbnails/iguana.jpg"
							style="max-width: 100%; height: 52vh; object-fit: cover; overflow: hidden;"
							alt="..." />
							<div class="portfolio-box-caption">
								<div class="project-category text-white-50">Category</div>
								<div class="project-name">
									<h2>REPTILE</h2>
								</div>
							</div>
						</a>
					</div>
					<div class="col-lg-4 col-sm-6" id="up-on-scroll">
						<a class="portfolio-box"
							href="${path}/board/list/1/5"
							style="max-width: 100%; height: 50vh;" title="Project Name">
							<img class="img-fluid"
							src="/myweb/images/img/portfolio/thumbnails/fish.jpg"
							style="max-width: 100%; height: 50vh;" alt="..." />
							<div class="portfolio-box-caption">
								<div class="project-category text-white-50">Category</div>
								<div class="project-name">
									<h2>FISH</h2>
								</div>
							</div>
						</a>
					</div>
					<div class="col-lg-4 col-sm-6" id="up-on-scroll">
						<a class="portfolio-box"
							href="${path}/board/list/1/6"
							style="max-width: 100%; height: 50vh;" title="Project Name">
							<img class="img-fluid"
							src="/myweb/images/img/portfolio/thumbnails/flower.jpg"
							style="max-width: 100%; height: 50vh;" alt="..." />
							<div class="portfolio-box-caption p-3">
								<div class="project-category text-white-50">Category</div>
								<div class="project-name">
									<h2>ETC</h2>
								</div>
							</div>
							</c:forEach>
						</a>
					</div>
				</div>
			</div>
		</div>
		</sec:authorize>
</body>
</html>

