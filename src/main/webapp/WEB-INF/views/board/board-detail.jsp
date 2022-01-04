<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<html>
<head>
<meta charset="UTF-8">
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<title>상세보기</title>
</head>
<body>

	<sec:authorize access="isAuthenticated()">
		<div class="container col-9" style="margin-top: 130px; margin-bottom: 100px;">
			<div class="card" style="margin-bottom: 20px;">
				<div class="card-header">
					<table class="table table-borderless">
						<tr style="height: 35px;">
							<td colspan="2" style="padding: 0 10px;"><span
								class="badge badge-primary">${list.categoryDTO.categoryName}</span>
							</td>
						</tr>
						<tr style="height: 60px;">
							<td colspan="2" style="padding: 0 12px"><h3
									style="position: relative; top: 7px;">${list.title}</h3></td>
						</tr>
						<tr style="height: 20px;">
							<td style="padding: 0 12px; padding-bottom: 5px;">Post by <span
								style="font-weight: bold; font-size: 20px;">
								<a href="<c:url value='/member/memberpage/${list.memberDTO.memberId}'/>">${list.memberDTO.nickname}</a></span>
								<br><span id="realPriLoc">가격: ${list.price} 원<br></span></td>
						</tr>
						<tr style="height: 20px;">
							<td width="18%" style="padding: 0 12px">${list.regdate }</td>
							<td style="padding: 0 12px"><span
								class="label label-primary">조회 &nbsp;${list.hits}</span></td>
						</tr>

					</table>
				</div>

				<div class="card-body" style="min-height: 220px;">

					${list.content }<br> <%-- <img src="${list.filepath}"
						style="width: 350px;"> --%> 
						<c:set var="name" value="${list.filename}"/>
						<c:if test="${name ne null}">
						    <img src="${pageContext.request.contextPath}/newfiles/${list.filename}" style="width: 350px;">

						</c:if>
						<%-- <jsp:include page="../../include/AdminTopFixMenu.jsp" /> --%>
				</div>

				<div class="card-footer" id="invisible">
						<div class="text-center">
						  <div>
							<div id="x" style="display: none;">${list.locinfoX}</div>
							<div id="y" style="display: none;">${list.locinfoY}</div>
							<div id="place" style="display: none;">${list.place}</div>	
								위치: <span id="priLoc">${list.place}</span>
								<div id="map" class="text-center" style="width:100%;height:350px;margin-top:10px; text-align: center;"></div>
							</div>
						</div>
					</div>
					</div>
					<br>
				<form name="detailForm">
				<!-- script에서 user_pwd에 접근하기 위한 폼 -->
				<div
					style="text-align: right; position: relative; right: 0%; top: 50%;">
					<c:if test="${nick==list.memberDTO.nickname}">
						<input type="button" value="삭제" class="btn btn-danger"
							onclick="location.href='${path}/board/delete/${list.postId}/${list.boardTypeDTO.boardId}/${list.categoryDTO.categoryId}/';" />
						<input type="button" value="수정" class="btn btn-primary"
							onclick="location.href='${path}/board/modify/${list.postId}/${list.boardTypeDTO.boardId}/${list.categoryDTO.categoryId}/';" />
					</c:if>
					<input type="button" value="목록" class="btn btn-secondary"
						onclick="location.href='${path}/board/list/${list.boardTypeDTO.boardId}/${list.categoryDTO.categoryId}/';" />
				</div>
			</form>

			
			<div class="card mb-2 mt-5">
				<div class="card-header bg-light">
					<i class="fa fa-comment fa">댓글&nbsp;[${list.commentCount }]</i>
				</div>
				<form>
					<div class="card-body">
						<input type="hidden" id="postId" value="${list.postId}">
						<ul class="list-group list-group-flush">
							<li class="list-group-item"><textarea class="form-control"
									id="commentContent" rows="1"></textarea>
								<button id="comment-btn-save" type="button"
									class="btn btn-outline-dark mt-3">등록</button></li>
						</ul>
					</div>
				</form>
			</div>
			<br />

			<div class="card">
				<c:forEach items="${comment}" var="li">
					<div class="card-header">
						<div class="text-monospace">
							<a href='/member/memberpage/${li.memberDTO.memberId}'><c:out value="${li.memberDTO.nickname}"/></a>
						</div>
					</div>
					<%-- <input type="hidden" id="commentId" value="${li.commentId}"> --%>
					<ul id="commentbox${li.commentId}" class="list-group">
						<li class="list-group-item d-flex justify-content-between">
							<div style="position: relative; top: 3px;">
								<c:out value="${li.commentContent }" />
							</div>
							<div class="d-flex">

								<div style="margin-right: 8px; position: relative; top: 3px;">
									<c:out value="${li.regdate}" />
								</div>
								<c:set var="userid" value="${userMemberId}" />
								<c:if test="${li.memberDTO.memberId eq userMemberId }">
									<button id=""
										class="btn btn-sm btn-outline-primary comment-btn-update"
										data_cid="${li.commentId}"
										data_content="${li.commentContent }"
										data_cname="${li.memberDTO.nickname}">수정</button>
									<span style="margin: 0 3px;"> </span>
									<button id=""
										class="btn btn-sm btn-outline-danger comment-btn-delete"
										value="${li.commentId}">삭제</button>
								</c:if>
							</div>
						</li>
					</ul>
				</c:forEach>
			</div>
		</div>
	</sec:authorize>
	<script type="text/javascript">
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		$(document).ajaxSend(function(e, xhr, options) {
			xhr.setRequestHeader(header, token);
		});
		//댓글 수정
/* 		$(document).ready(function() {
			$("#boardwrite").click(function() {

			});
			});
		}); */
		$(document).ready(function() {
			$(".comment-btn-update").click("click",function() {
				let cId = $(this).attr(
				"data_cid");
				let cName = $(this).attr(
				"data_cname");
				let content = $(this).attr(
				"data_content");
				console.log(cId);
				console.log(cName);
				console.log(content);
				let updateForm = '';
				updateForm += '<ul id="commentbox'+cId+'" class="list-group" >';
				updateForm += '<li class="list-group-item d-flex justify-content-between">';
				updateForm += '<textarea class="form-control" id="updateContent" rows="1" style="width:90%;">'
				+ content
				+ '</textarea>';
				updateForm += '<div class="d-flex">';
				updateForm += '<div class="text-monospace">';
				updateForm += '</div>';
				updateForm += '<button id="" class="btn btn-sm btn-outline-primary update-comment">수정</button>';
				updateForm += '<span style="margin: 0 3px;"></span>';
				updateForm += '<button id="" class="btn btn-sm btn-outline-danger update-close">취소</button>';
				updateForm += '</div>';
				updateForm += '</li>';
				updateForm += '</ul>';
				$("#commentbox" + cId).replaceWith(updateForm);
				$("#updateContent").focus();
				$(".update-close").click(function() {
							console.log("되니?");
							location.reload();
							});
							$(".update-comment").click(function() {
								let updateContent = $("#updateContent").val();
									console.log(cId);
									console.log(updateContent);
									$.ajax({
											type : "POST",
											url : '/commentUpdate',
											data : JSON.stringify({
												commentId : cId,
												commentContent : updateContent
												}),
												contentType : "application/json; charset=utf-8",
												dataType : "text",
												}).done(
													function(res) {
													alert("댓글수정이 완료되었습니다.");
													window.location.reload();
													}).fail(function(err) {
															alert(JSON.stringify(err));
													});
										});
						});

		});
		</script>
		
		</body>
		<script type="text/javascript">
	$(document).ready(function() {
		gBno = '${postId}';
		gBoardWriter = '${nick}';
		gIsDirect = true;
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		$(document).ajaxSend(function(e, xhr, options) {
			xhr.setRequestHeader(header, token);
		});
		let postId = $("#postId").val();
		$('#comment-btn-save').on('click', function(evt) {
			evt.preventDefault();
			if (socket.readyState !== 1)
				return;
			let msg = $('textarea#commentContent').val();
			socket.send(msg);
			let data = {
	            commentContent: $("#commentContent").val()
	        }
	        console.log(data);
	        console.log(postId);
	       $.ajax({
	            type: "POST",
	            url: '/commentSave/${postId}',
	            data: JSON.stringify(data),
	            contentType: "application/json; charset=utf-8",
	            //dataType: "json"
	        }).done(function (res) {
	        	
	        	if (socket) {
					// websocket에 보내기!! (reply,댓글작성자,게시글작성자,글번호)
					let socketMsg = "reply," + "${nick}" + "," + "${list.memberDTO.nickname}" + "," + ${postId};
					socket.send(socketMsg);
				}
	        	
	            alert("댓글작성이 완료되었습니다.");
	            location.href = "/board/${postId}";
	            
	            
	        }).fail(function (err) {
	            alert(JSON.stringify(err));
	        });

		});
	});
	$(document).ready(function() {
		$(".comment-btn-delete").click(function(){
			let commentId=$(this).val();
			console.log(commentId);
			console.log(postId);
		    $.ajax({
				type:"DELETE",
				url:'/commentDelete/${postId}/'+commentId,
			}).done(function (res) {
	            alert("댓글삭제가 완료되었습니다.");
	            location.href = '/board/${postId}';
	        }).fail(function (err) {
	            alert(JSON.stringify(err));
	        });
		});
	});

	// (가격 : , 위치 : ) 커뮤니티에서 안보이게 하기 -> 공백이 있으면 아예 싹다 숨겨버리도록 설계
	$(function(){
		if( $('#priLoc').html() == "" ) {
            	$("#realPriLoc").hide();
            	$("#invisible").hide();
            	
    	} else {
            	$("#realPriLoc").show();
            	$("#invisible").show();
    	}
	});
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=433417bfd6e1fa6506b99a2e8d9b205f&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

var placeinfo = $('#place').html();
// 주소로 좌표를 검색합니다
geocoder.addressSearch( placeinfo , function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">거래 장소</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>

    
</html>