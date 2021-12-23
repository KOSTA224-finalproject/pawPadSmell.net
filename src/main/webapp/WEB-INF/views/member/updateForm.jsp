<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- spring security custom tag를 사용하기 위한 선언 --%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<sec:authentication var="member" property="principal" />
<form method="post" action="updateMemberAction">
	<%-- 
  		csrf 토큰 : csrf 공격을 막기 위한 1회성 인증키인 
  		             csrf토큰을 함께 전달해야 수정이 가능하다
 
  --%>
	<sec:csrfInput />
	아이디 : <input type="text" name="id" placeholder="아이디" value="${member.id}" readonly>
	<br>패스워드 : <input type="text" name="password" placeholder="패스워드" required="required">
	<br>이름 : <input type="text" name="name" 	value="${member.name}" placeholder="이름" required="required"> 
	<br>주소 : <input type="text" 	name="address" 	value="${member.address}" placeholder="주소" required="required"> 
	<br><input type="submit" value="회원정보수정">
</form>


