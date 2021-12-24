<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<body id="page-top">
	<sec:authorize access="isAuthenticated()">
		<!-- Masthead-->
		<header class="masthead">
			<!-- Button trigger modal -->

			<div class="container px-4 px-lg-5 h-100">
				<div
					class="row gx-4 gx-lg-5 h-100 align-items-center justify-content-center text-center">
					<div class="col-lg-8 align-self-end">
						<h1 class="text-white font-weight-bold">꼬순넷에 오신것을 환영합니다!</h1>
						<br> <br> <br>
						<hr class="divider" />
					</div>
					<div class="col-lg-8 align-self-baseline">
						<h3 class="text-white-75 mb-5">반려동물을 사랑하는 사람들의 모임</h3>
						<div id="root"></div>
					</div>
				</div>
		</header>
		<!-- About-->
		<section class="page-section bg-primary" id="up-on-scroll">
			<div class="container px-4 px-lg-5">
				<div class="row gx-4 gx-lg-5 justify-content-center"
					id="up-on-scroll">
					<div class="col-lg-8 text-center">
						<h2 class="text-white mt-0">반려동물 용품을 중고거래 하세요!</h2>
						<hr class="divider divider-light" />
						<div
							style="position: relative; animation-name: cat; animation-duration: 3s; animation-timing-function: linear; animation-iteration-count: infinite; animation-direction: alternate;">
							<cat> <img src="/myweb/images/cart.png"
								style="width: 230px;"></cat>
						</div>
						<h3 class="text-white-75 mb-4">위치 기반 중고거래가 가능합니다</h3>
						<a class="btn btn-light btn-xl" href="${path}/second-list"><h5>중고거래하러
								가기</h5></a>
					</div>
				</div>
			</div>
		</section>
		<div id="portfolio">
			<div class="container-fluid p-0" id="up-on-scroll">
				<div class="row g-0">
					<div class="col-lg-4 col-sm-6" id="up-on-scroll">

						<a class="portfolio-box" href="${path}/board/list/1/1"
							style="max-width: 100%; height: 50vh;" title="Project Name">
							<img class="img-fluid"
							src="/myweb/images/img/portfolio/thumbnails/cat.jfif"
							style="max-width: 100%; height: 50vh;" alt="..." />
							<div class="portfolio-box-caption" onclick="location.href='${path}/board/list/1/1';">
								<div class="project-category text-white-50">Category</div>
								<div class="project-name" >
									<h2>CAT</h2>
								</div>
							</div>
						</a>
					</div>
					<div class="col-lg-4 col-sm-6" id="up-on-scroll">
						<a class="portfolio-box" href="${path}/board/list/1/2"
							style="max-width: 100%; height: 50vh;" title="Project Name">
							<img class="img-fluid"
							src="/myweb/images/img/portfolio/thumbnails/dog.jpg"
							style="max-width: 100%; height: 50vh;" alt="..." />
							<div class="portfolio-box-caption" onclick="location.href='${path}/board/list/1/2';">
								<div class="project-category text-white-50">Category</div>
								<div class="project-name">
									<h2>DOG</h2>
								</div>
							</div>
						</a>
					</div>

					<div class="col-lg-4 col-sm-6" id="up-on-scroll">
						<a class="portfolio-box"
							style="max-width: 100%; height: 50vh;" title="Project Name">
							<img class="img-fluid"
							src="/myweb/images/img/portfolio/thumbnails/bird.jpeg"
							style="max-width: 100%; height: 50vh;" alt="..." />
							<div class="portfolio-box-caption" onclick="location.href='${path}/board/list/1/3';">
								<div class="project-category text-white-50">Category</div>
								<div class="project-name">
									<h2>BIRD</h2>
								</div>
							</div>
						</a>
					</div>
					<div class="col-lg-4 col-sm-6" id="up-on-scroll">
						<a class="portfolio-box" href="${path}/board/list/1/4"
							style="max-width: 100%; height: 50vh; overflow: hidden;"
							title="Project Name"> <img class="img-fluid"
							src="/myweb/images/img/portfolio/thumbnails/iguana.jpg"
							style="max-width: 100%; height: 52vh; object-fit: cover; overflow: hidden;"
							alt="..." />
							<div class="portfolio-box-caption" onclick="location.href='${path}/board/list/1/4';">
								<div class="project-category text-white-50">Category</div>
								<div class="project-name">
									<h2>REPTILE</h2>
								</div>
							</div>
						</a>
					</div>
					<div class="col-lg-4 col-sm-6" id="up-on-scroll">
						<a class="portfolio-box" href="${path}/board/list/1/5"
							style="max-width: 100%; height: 50vh;" title="Project Name">
							<img class="img-fluid"
							src="/myweb/images/img/portfolio/thumbnails/fish.jpg"
							style="max-width: 100%; height: 50vh;" alt="..." />
							<div class="portfolio-box-caption" onclick="location.href='${path}/board/list/1/5';">
								<div class="project-category text-white-50">Category</div>
								<div class="project-name">
									<h2>FISH</h2>
								</div>
							</div>
						</a>
					</div>
					<div class="col-lg-4 col-sm-6" id="up-on-scroll">
						<a class="portfolio-box" href="${path}/board/list/1/6"
							style="max-width: 100%; height: 50vh;" title="Project Name">
							<img class="img-fluid"
							src="/myweb/images/img/portfolio/thumbnails/flower.jpg"
							style="max-width: 100%; height: 50vh;" alt="..." />
							<div class="portfolio-box-caption p-3" onclick="location.href='${path}/board/list/1/6';">
								<div class="project-category text-white-50">Category</div>
								<div class="project-name">
									<h2>ETC</h2>
								</div>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>
</body>
<script type="text/javascript">
   function isElementUnderBottom(elem, triggerDiff) {
        const { top } = elem.getBoundingClientRect();
        const { innerHeight } = window;
        return top > innerHeight + (triggerDiff || 0);
      }

      function handleScroll() {
        const elems = document.querySelectorAll('#up-on-scroll');
        elems.forEach(elem => {
          if (isElementUnderBottom(elem, -50)) {
            elem.style.opacity = "0";
            elem.style.transform = 'translateY(70px)';
          } else {
            elem.style.opacity = "1";
            elem.style.transform = 'translateY(0px)';
          }
        })
      }

      window.addEventListener('scroll', handleScroll);
   </script>
<!-- Bootstrap core JS-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- SimpleLightbox plugin JS-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.js"></script>
<!-- Core theme JS-->
<!-- <script src="/resources/js/scripts.js"></script> -->
<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
<!-- * *                               SB Forms JS                               * *-->
<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>

</sec:authorize>
<!-- 비회원일 경우 보여지는 메인 화면 -->
<sec:authorize access="isAuthenticated()==false">
	<!-- Masthead-->
	<header class="masthead">
		<!-- Button trigger modal -->

		<div class="container px-4 px-lg-5 h-100">
			<div
				class="row gx-4 gx-lg-5 h-100 align-items-center justify-content-center text-center">
				<div class="col-lg-8 align-self-end">
					<h1 class="text-white font-weight-bold">꼬순넷에 오신것을 환영합니다!</h1>
					<br> <br> <br>
					<hr class="divider" />
				</div>
				<div class="col-lg-8 align-self-baseline">
					<p class="text-white-75 mb-5">반려동물을 사랑하는 사람들의 모임</p>
					<a class="btn btn-primary btn-xl" href="guest/registerForm"><h3>회원가입</h3></a>
					<div id="root"></div>
				</div>
			</div>
	</header>
	<!-- About-->
	<section class="page-section bg-primary" id="up-on-scroll">
		<div class="container px-4 px-lg-5">
			<div class="row gx-4 gx-lg-5 justify-content-center"
				id="up-on-scroll">
				<div class="col-lg-8 text-center">
					<h2 class="text-white mt-0">애완동물 용품을 중고거래 하세요!</h2>
					<hr class="divider divider-light" />
					<div
						style="position: relative; animation-name: cat; animation-duration: 3s; animation-timing-function: linear; animation-iteration-count: infinite; animation-direction: alternate;">
						<cat> <img src="/myweb/images/cart.png"
							style="width: 230px;"></cat>
					</div>
					<p class="text-white-75 mb-4">우리는 위치 기반으로 중고거래가 가능합니다</p>
					<a class="btn btn-light btn-xl" href="${path}/second-list">중고거래하러
						가기</a>
				</div>
			</div>
		</div>
	</section>
	<div id="portfolio">
			<div class="container-fluid p-0" id="up-on-scroll">
				<div class="row g-0">
					<div class="col-lg-4 col-sm-6" id="up-on-scroll">

						<a class="portfolio-box" href="${path}/board/list/1/1"
							style="max-width: 100%; height: 50vh;" title="Project Name">
							<img class="img-fluid"
							src="/myweb/images/img/portfolio/thumbnails/cat.jfif"
							style="max-width: 100%; height: 50vh;" alt="..." />
							<div class="portfolio-box-caption" onclick="location.href='${path}/board/list/1/1';">
								<div class="project-category text-white-50">Category</div>
								<div class="project-name" >
									<h2>CAT</h2>
								</div>
							</div>
						</a>
					</div>
					<div class="col-lg-4 col-sm-6" id="up-on-scroll">
						<a class="portfolio-box" href="${path}/board/list/1/2"
							style="max-width: 100%; height: 50vh;" title="Project Name">
							<img class="img-fluid"
							src="/myweb/images/img/portfolio/thumbnails/dog.jpg"
							style="max-width: 100%; height: 50vh;" alt="..." />
							<div class="portfolio-box-caption" onclick="location.href='${path}/board/list/1/2';">
								<div class="project-category text-white-50">Category</div>
								<div class="project-name">
									<h2>DOG</h2>
								</div>
							</div>
						</a>
					</div>

					<div class="col-lg-4 col-sm-6" id="up-on-scroll">
						<a class="portfolio-box"
							style="max-width: 100%; height: 50vh;" title="Project Name">
							<img class="img-fluid"
							src="/myweb/images/img/portfolio/thumbnails/bird.jpeg"
							style="max-width: 100%; height: 50vh;" alt="..." />
							<div class="portfolio-box-caption" onclick="location.href='${path}/board/list/1/3';">
								<div class="project-category text-white-50">Category</div>
								<div class="project-name">
									<h2>BIRD</h2>
								</div>
							</div>
						</a>
					</div>
					<div class="col-lg-4 col-sm-6" id="up-on-scroll">
						<a class="portfolio-box" href="${path}/board/list/1/4"
							style="max-width: 100%; height: 50vh; overflow: hidden;"
							title="Project Name"> <img class="img-fluid"
							src="/myweb/images/img/portfolio/thumbnails/iguana.jpg"
							style="max-width: 100%; height: 52vh; object-fit: cover; overflow: hidden;"
							alt="..." />
							<div class="portfolio-box-caption" onclick="location.href='${path}/board/list/1/4';">
								<div class="project-category text-white-50">Category</div>
								<div class="project-name">
									<h2>REPTILE</h2>
								</div>
							</div>
						</a>
					</div>
					<div class="col-lg-4 col-sm-6" id="up-on-scroll">
						<a class="portfolio-box" href="${path}/board/list/1/5"
							style="max-width: 100%; height: 50vh;" title="Project Name">
							<img class="img-fluid"
							src="/myweb/images/img/portfolio/thumbnails/fish.jpg"
							style="max-width: 100%; height: 50vh;" alt="..." />
							<div class="portfolio-box-caption" onclick="location.href='${path}/board/list/1/5';">
								<div class="project-category text-white-50">Category</div>
								<div class="project-name">
									<h2>FISH</h2>
								</div>
							</div>
						</a>
					</div>
					<div class="col-lg-4 col-sm-6" id="up-on-scroll">
						<a class="portfolio-box" href="${path}/board/list/1/6"
							style="max-width: 100%; height: 50vh;" title="Project Name">
							<img class="img-fluid"
							src="/myweb/images/img/portfolio/thumbnails/flower.jpg"
							style="max-width: 100%; height: 50vh;" alt="..." />
							<div class="portfolio-box-caption p-3" onclick="location.href='${path}/board/list/1/6';">
								<div class="project-category text-white-50">Category</div>
								<div class="project-name">
									<h2>ETC</h2>
								</div>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>
		</div>
	</div>


	<script type="text/javascript">
   function isElementUnderBottom(elem, triggerDiff) {
        const { top } = elem.getBoundingClientRect();
        const { innerHeight } = window;
        return top > innerHeight + (triggerDiff || 0);
      }

      function handleScroll() {
        const elems = document.querySelectorAll('#up-on-scroll');
        elems.forEach(elem => {
          if (isElementUnderBottom(elem, -50)) {
            elem.style.opacity = "0";
            elem.style.transform = 'translateY(70px)';
          } else {
            elem.style.opacity = "1";
            elem.style.transform = 'translateY(0px)';
          }
        })
      }

      window.addEventListener('scroll', handleScroll);
   </script>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- SimpleLightbox plugin JS-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.js"></script>
	<!-- Core theme JS-->
	<!-- <script src="/resources/js/scripts.js"></script> -->
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<!-- * *                               SB Forms JS                               * *-->
	<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>

	</body>
</sec:authorize>