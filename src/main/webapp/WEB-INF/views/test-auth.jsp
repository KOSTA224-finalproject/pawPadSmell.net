<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%-- spring security custom tag를 사용하기 위한 선언 --%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>   
인증 / 인가 테스트 결과 페이지 <br><br>
<sec:authorize access="isAuthenticated()">
	로그인한 사람이 볼 수 있음 <br><br>
</sec:authorize>
<sec:authorize access="!isAuthenticated()">
	로그인하지 않은 사람이 볼 수 있음 <br><br>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_ADMIN') and hasRole('ROLE_MEMBER')">
<p>ROLE_ADMIN 이자 ROLE_MEMBER인 회원이 볼수 있음  </p>
</sec:authorize>
<%-- 
		  spring-security-taglibs 조건 표현 
        인증 안된(로그인 안한) 사용자 메뉴 : 인증되면 안보여야 하는 메뉴 
<sec:authorize access="!isAuthenticated()">
	<li><a href="login_form">로그인</a></li>
	<li><a href="join_member_form">회원가입</a></li>
</sec:authorize>

인증된(로그인한) 사용자 메뉴 : 인증 안된상태에서 안보여야 하는 메뉴
<sec:authorize access="isAuthenticated()">
	로그아웃
</sec:authorize>
		  
구체적인 ROLE을 판단해야 할 경우 	
<sec:authorize access="hasRole('ROLE_ADMIN')">
<p>Must have ROLE_ADMIN</p>
</sec:authorize>	  
<sec:authorize access="hasRole('ROLE_ADMIN') and hasRole('ROLE_MEMBER')">
<p>Must have ROLE_ADMIN and ROLE_MEMBER</p>
</sec:authorize>
<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_MEMBER')">
<p>Must have ROLE_ADMIN or ROLE_MEMBER</p>
</sec:authorize>
<sec:authorize access="!hasAnyRole('ROLE_ADMIN','ROLE_MEMBER')">
<p>Must not have ROLE_ADMIN or ROLE_MEMBER</p>
</sec:authorize>		
 --%>