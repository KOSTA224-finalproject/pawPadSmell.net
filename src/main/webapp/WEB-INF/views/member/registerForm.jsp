<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- spring security custom tag를 사용하기 위한 선언 --%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>

<!-- ajax 통신을 위한 meta tag -->
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap Icons -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Google fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic"
	rel="stylesheet" type="text/css" />
<!-- SimpleLightbox plugin CSS -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap) -->
<link href="/myweb/css/styles.css" rel="stylesheet" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Single+Day&display=swap"
	rel="stylesheet">
<head>
<meta charset="UTF-8">

<title>loginForm</title>

</head>

<body>
	<div class="container">
		<div class="row pt-5 h-100">
			<div class="col-lg-7 mx-auto text-center mt-7 mb-5">
				<a href="/"><img src="/myweb/images/logo-2.png"
					style="width: 350px;"></a>
				<form action="/guest/register" method="post" id="registerForm">
					<div class="form-floating mb-3">
						<sec:csrfInput />
						<input class="form-control" name="email" type="email"
							id="input_id" /> <label for="id">이메일</label> <span
							style="margin-left: 5px; font-weight: 200; font-size: 20px; float: left;"
							id="idck"></span>
					</div>

					<div class="form-floating mb-3">
						<input class="form-control" name="password" type="password"
							onkeyup="passwordStrength()" placeholder="name@example.com"
							data-sb-feedback="name:required" id="password" /> <label for="name">비밀번호
						</label>

						<div class="invalid-feedback" data-sb-feedback="email:required">An
							email is required.</div>
						<div class="invalid-feedback" data-sb-feedback="email:email">Email
							is not valid.</div>
					</div>

					<div class="form-floating mb-3">
						<input class="form-control" name="joinPwck" type="password"
							id="pwCheck" placeholder="name@example.com"
							data-sb-feedback="name:required" /> <label for="name">비밀번호
							재확인</label> <span
							style="margin-left: 5px; font-weight: 200; font-size: 20px; float: left;"
							id="checkPwd"></span>

						<div class="invalid-feedback" data-sb-feedback="email:required">An
							email is required.</div>
						<div class="invalid-feedback" data-sb-feedback="email:email">Email
							is not valid.</div>
					</div>
					<div class="form-floating mb-3">
						<input class="form-control" name="name" type="text"
							placeholder="name@example.com"
							data-sb-validations="required,password" /> <label for="password">이름
						</label>

					</div>
					<div class="form-floating mb-3">
						<input class="form-control" name="nickname" type="text"
							placeholder="name@example.com" id="input_id1"
							data-sb-validations="required,password" /> <label for="password">닉네임
						</label>
							<span style="margin-left: 5px; font-weight: 200; font-size: 20px; float: left;"
							id="idck1"></span>

						<div class="invalid-feedback" data-sb-feedback="email:required">An
							email is required.</div>
						<div class="invalid-feedback" data-sb-feedback="email:email">Email
							is not valid.</div>
					</div>
					<div class="form-floating mb-3">
						<!-- 밑에가 주소 들어가는 input -->
						<br> <input class="form-control"
							style="font-family: 'Jua'; font-weight: 500; width: 70%; display: inline-block; float: left; margin-bottom: 20px; background-color: white;"
							type="text" name="address1" id="sample2_postcode"
							placeholder="우편번호" readonly="readonly"> <br> 
							<input class="btn btn-light btn-xl bg-primary"
							style="position: relative; margin: 0; padding: 0; height: 42px; width: 25%; left: 2%; top:-17px; font-weight: bold;"
							type="button" onclick="sample2_execDaumPostcode()"
							value="우편번호 찾기"> <br> 
							<input class="form-control  input-box bg-100"
							style="background-color: white; font-weight: 500;" type="text"
							name="address2" id="sample2_address" placeholder="주소"
							readonly="readonly"><br> <input
							class="form-control input-box bg-100"
							style="font-family: 'Jua'; font-weight: 500; width: 48%; display: inline-block; float: left; margin-bottom: 20px; margin-right: 4%;"
							type="text" name="address3" id="sample2_detailAddress"
							placeholder="상세주소"> <input
							class="form-control  input-box bg-100"
							style="background-color: white; font-weight: 500; width: 48%; display: inline-block; float: left; margin-bottom: 20px;"
							type="text" name="address4" id="sample2_extraAddress"
							placeholder="참고항목" readonly="readonly">
						<!-- ******************** -->
						<div class="invalid-feedback" data-sb-feedback="email:required">An
							email is required.</div>
						<div class="invalid-feedback" data-sb-feedback="email:email">Email
							is not valid.</div>
					</div>
					<br> <br> <br>
					<div class="form-floating mb-3">

						<input class="form-control" name="phonenum" type="tel"
							placeholder="01012345678" data-sb-validations="required" required="required" /> <label
							for="password">전화번호 </label>

						<div class="invalid-feedback" data-sb-feedback="email:required">An
							email is required.</div>
						<div class="invalid-feedback" data-sb-feedback="email:email">Email
							is not valid.</div>
					</div>
					<div class="form-floating mb-3">
						<input class="form-control" name="birth" type="date"
							placeholder="name@example.com" data-sb-validations="required" />
						<label for="password">생일 </label>

						<div class="invalid-feedback" data-sb-feedback="email:required">An
							email is required.</div>
						<div class="invalid-feedback" data-sb-feedback="email:email">Email
							is not valid.</div>
					</div>
					<br>
					<div class="d-grid gap-2">
						<button class="btn btn-light btn-xl bg-primary" type="submit" id="reg_submit">
							<h5>가입하기</h5>
						</button>

					</div>
				</form>
				<br>


			</div>
		</div>
	</div>
	<br>
	<div id="layer"
		style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
		<img src="//t1.daumcdn.net/postcode/resource/images/close.png"
			id="btnCloseLayer"
			style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"
			onclick="closeDaumPostcode()" alt="닫기 버튼">
	</div>
</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	var result = true;
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(header, token);
	}); 
	$(function() {
		$("#input_id").keyup(function() {
							var id = $("#input_id").val();
									$.ajax({
										type : "POST",
										url : "idcheck",
										data : "userId=" + id,
										success : function(result) {
											if (result == 1) {
												document.getElementById("idck").style.color = "red";
												document.getElementById("idck").innerHTML = "이미 사용중인 이메일입니다.";

												$("#reg_submit").attr("disabled",true);
												i = 1;
											} else {
												document.getElementById("idck").style.color = "green";
												document.getElementById("idck").innerHTML = "사용 가능한 이메일입니다.";
												$("#reg_submit").attr("disabled",false);
												i = 0;

											}
										}
									});
						});
	});
	$(function() {
		if(i==1){
			alert("아이디가 중복되었습니다.");
			document.getElementById("input_id").focus();
			return false;
		}
		let joinId=document.getElementById("input_id").value;
		if(joinId==""){
			alert("아이디를 입력하셔야 합니다.");
			return false;
		}
	});
	$(function() {
		$("#input_id1").keyup(function() {
							var nickname = $("#input_id1").val();
									$.ajax({
										type : "POST",
										url : "nickcheck",
										data : "userNickname=" + nickname,
										success : function(result) {
											if (result == 1) {
												document.getElementById("idck1").style.color = "red";
												document.getElementById("idck1").innerHTML = "이미 사용중인 닉네임입니다.";

												$("#reg_submit").attr("disabled",true);
												return result=false;
											} else {
												document.getElementById("idck1").style.color = "green";
												document.getElementById("idck1").innerHTML = "사용 가능한 닉네임입니다.";
												$("#reg_submit").attr("disabled",false);
												return result=true;

											}
										}
									});
						});
	});

	// 패스워드 일치 확인
	$(function() {
		$("#pwCheck").keyup(function(){
			let password = document.forms[0];
			let pass1 = password.password.value;
			let pass2 = password.joinPwck.value;
			if (pass1 != pass2) {
				document.getElementById("checkPwd").style.color = "red";
				document.getElementById("checkPwd").innerHTML = "비밀번호가 일치하지 않습니다.";
				return false;
			} else {
				document.getElementById("checkPwd").style.color = "green";
				document.getElementById("checkPwd").innerHTML = "비밀번호가 일치합니다.";
				
			}
		});

		$("#reg_submit").click(function(){
			let password = document.forms[0];
			let pass1 = password.password.value;
			let pass2 = password.joinPwck.value;
			if(pass1 != pass2){
				alert("비밀번호가 일치하지 않습니다");
				document.getElementById("password").focus();
				return false
			}
		});
	});



</script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function input_email() {

		document.frm.e2.value = document.frm.email_server.value;

	}

	// 우편번호 찾기 화면을 넣을 element
	var element_layer = document.getElementById('layer');

	function closeDaumPostcode() {
		// iframe을 넣은 element를 안보이게 한다.
		element_layer.style.display = 'none';
	}

	function sample2_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("sample2_extraAddress").value = extraAddr;

						} else {
							document.getElementById("sample2_extraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample2_postcode').value = data.zonecode;
						document.getElementById("sample2_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample2_detailAddress")
								.focus();

						// iframe을 넣은 element를 안보이게 한다.
						// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
						element_layer.style.display = 'none';
					},
					width : '100%',
					height : '100%',
					maxSuggestItems : 5
				}).embed(element_layer);

		// iframe을 넣은 element를 보이게 한다.
		element_layer.style.display = 'block';

		// iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
		initLayerPosition();
	}

	// 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
	// resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
	// 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
	function initLayerPosition() {
		var width = 300; //우편번호서비스가 들어갈 element의 width
		var height = 400; //우편번호서비스가 들어갈 element의 height
		var borderWidth = 5; //샘플에서 사용하는 border의 두께

		// 위에서 선언한 값들을 실제 element에 넣는다.
		element_layer.style.width = width + 'px';
		element_layer.style.height = height + 'px';
		element_layer.style.border = borderWidth + 'px solid';
		// 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
		element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width) / 2 - borderWidth)
				+ 'px';
		element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height) / 2 - borderWidth)
				+ 'px';
	}
</script>
<script src="vendors/@popperjs/popper.min.js"></script>
<script src="vendors/bootstrap/bootstrap.min.js"></script>
<script src="vendors/is/is.min.js"></script>
<script
	src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
<script src="vendors/fontawesome/all.min.js"></script>
<script src="assets/js/theme.js"></script>