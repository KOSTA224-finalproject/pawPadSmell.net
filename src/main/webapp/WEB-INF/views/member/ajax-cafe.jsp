<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- spring security custom tag를 사용하기 위한 선언 --%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<sec:authentication var="member" property="principal" />
${member.address}에 사는 ${member.name}님 카페입장 환영!
<br>
<br>
<%-- ajax test --%>
<input type="button" value="총회원수보기(get)" id="countBtn">
<span id="countView"></span>
<br><br>
<input type="text" id="message" placeholder="메세지"> 
<input type="button" value="메세지(post)" id="messageBtn">
<span id="resultView"></span>
<script type="text/javascript">
	//src\main\resources\static\myweb\js\myproject.js 의 $.ajaxSetup 의 error 를 확인한다 
	// 브라우저 F12 애플리케이션 탭에서 jsession id 삭제 후 아래 서비스를 테스트해서 비로그인 상태에서 총회원수 보기 서비스가 되는 지 확인한다 
	$(document).ready(			
	 function() {					
				$("#countBtn").click(function() {
					$.ajax({
						type : "get",
						url : "getMemberTotalCount",
						success : function(result) {
							$("#countView").html(result + "명");
						}
					});//ajax
				});//click

	// post 방식일때 ajax csrf token 처리의 예   
	// spring security 적용시 ajax post 방식은 반드시 아래와 같이 beforeSend property에서 csrf 토큰값을 셋팅해야 함 
	// 그렇지 않으면 403 error 발생함
				$("#messageBtn").click(function() {
					$.ajax({
						type : "post",
						url : "postAjaxTest",
						data:"message="+$("#message").val(),						
						beforeSend : function(xhr){  
		                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		                },									
						success : function(result) {
							$("#resultView").html(result);
						}
					}).always(function() {
						$("#message").val("").focus();
					});//ajax
				});//click
	});//ready
			
</script>




















