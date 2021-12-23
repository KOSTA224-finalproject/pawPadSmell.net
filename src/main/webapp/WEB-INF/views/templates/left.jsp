<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- spring security custom tag를 사용하기 위한 선언 --%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript">
	$(document).ready(function() {
		$("#findForm").submit(function() {
			if ($("#findForm :input[name=id]").val() == "") {
				alert("아이디를 입력하세요!");
				return false;
			}
		});
	});
</script>
<form id="findForm" action="/guest/findMemberById">
	<input type="text" name="id" size="5" placeholder="아이디">
	 <input type="submit" value="검색">
</form>
<br>


<%-- 비로그인 상태의 사용자가 보는 메뉴  --%>
<sec:authorize access="isAuthenticated()==false">
	<br>
	<%-- spring security 적용 로그인시에는 반드시 post방식으로 해야 함.  --%>
	<%--
	       Spring Security에서는 보안강화를 위해 
		   post방식 정보전송일때는 반드시 csrf 토큰을 삽입해야 전송이 된다
		   아래 security tag를 쓰면 hidden tag 가 자동 생성된다 
		   csrf 토큰을 명시하지 않으면 인가되지 않아 accessDeniedView가 보인다 
		   
	       로그인 로그아웃은 모두 post 방식 요청으로 해야 하고
	        csrf 해킹방지를 위한  토큰처리가 필요하다 
		   
	--%>
	<form action="/login"
		method="post" id="loginForm">	
		<%-- csrf 토큰 --%>	
		<sec:csrfInput/>
		<input type="text" name="id" size="10" placeholder="아이디"><br>
		<input type="password" name="password" size="10" placeholder="비밀번호"><br>
		<input type="submit" value="로그인">
	</form>
	<%-- 비로그인한 사용자가 접근해야 하므로 guest로 접근한다 
	       org.kosta.myproject.config.security.WebSecurityConfig의 설정을 확인한다 
	 --%>
	<a href="/guest/registerForm">회원가입</a>
	<br>
</sec:authorize>
<%-- 로그인한 사용자가 보는 메뉴 --%>
<sec:authorize access="isAuthenticated()">
	<%-- 
Spring Security를 이용하면 Authentication Bean 이 생성
로그인 한 사용자의 정보는 Authentication 객체의 principal 에 저장된다 
 --%>
	<sec:authentication property="principal.name" />님 <br>
	<a href="/enterCafe">카페가기</a>
	<br>
	<%-- spring security logout은 다음과 같은 처리가 필요하다
	로그인 로그아웃은 모두 post 방식 요청으로 해야 하고  csrf 해킹방지를 위한  토큰처리가 필요하다 --%>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#logoutAction").click(function() {
				$("#logoutForm").submit();
			});
		});
	</script>
	<a href="#" id="logoutAction">로그아웃</a>
	<form id="logoutForm" action="/logout" method="post" style="display: none">
		<sec:csrfInput />
	</form>
	<br>
	<a href="/updateForm">회원정보수정</a>
<br>
<br>
</sec:authorize>
<br>
<br>
	<%-- 아래는 관리자일 때 보이는 메뉴 --%> 
<sec:authorize access="hasRole('ROLE_ADMIN')">
	<a href="/admin/main">관리자모드</a>	
</sec:authorize>
<br><br>
<a href="/guest/testAuth">인증,인가테스트</a>





