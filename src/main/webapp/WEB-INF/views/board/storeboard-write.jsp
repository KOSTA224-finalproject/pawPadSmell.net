<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jquery.min.js  <- 제이쿼리 사용시 꼭 필요 -->
<title>게시물 작성폼</title>
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style>
.layout {
	width: 500px;
	margin: 0 auto;
	margin-top: 40px;
}

.layout input {
	width: 100%;
	box-sizing: border-box
}

.layout textarea {
	width: 100%;
	margin-top: 10px;
	min-height: 300px;
}
</style>
<sec:authorize access="isAuthenticated()">

	<body>
		<div class="layout">

			<!-- 파일 업로드를 위한 속성 추가 : enctype="multipart/form-data"  method는 항상 post 방식이어야 한다. -->
			<form action="/board/storewritepro/${boardId}/${categoryId}" 
				 method="post" enctype="multipart/form-data">
				 <sec:csrfInput />
				<span class="label label-danger">${boardname.boardName}</span>
				<span
					class="label label-primary">${categoryname.categoryName}</span><br>
				작성자: ${nick} <input name="title" type="text"
					placeholder="제목을 입력하세요.">
				<br>
				<input name="price" type="number" placeholder="판매 가격 (원)"><br>
				<textarea name="content" placeholder="내용을 입력하세요."></textarea><br>
				
				<input type="file" name="file"><br>
				거래를 원하는 위치를 표시해주세요!<br>
				<input type="text" id="sample5_address" name="place" placeholder="주소" readonly="readonly">
				<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
				<div id="map" style="width:500px;height:300px;margin-top:10px;display:none"></div>
				<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=433417bfd6e1fa6506b99a2e8d9b205f&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };
    var ouyputtest = document.getElementById("zline");
    var test3;
    var coords;
    var coordx;
    var coordy;
    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });
    var x = 35.85659647224101;    // 현재 GPS x좌표
    var y = 128.53115388420585;  // 현재 GPS y좌표
    var radius = 2000;                 // 반경 미터(m), 2km
	
    var latlngyo = new daum.maps.LatLng(x, y);
	x=37.537187;
	y=127.005476;
	var test2 = new daum.maps.LatLng(x, y);
    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        coords = new daum.maps.LatLng(result.y, result.x);
                        test3 = coords;
                        coordx=result.y;
                        coordy=result.x;
                        
                        document.getElementById("xinfo").value=result.x;
                        document.getElementById("yinfo").value=result.y;
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                        console.log(test3);
                    }
                });
            }
        }).open();
    }
    var linePath;
    var lineLine = new daum.maps.Polyline({
    	path:[
    		test3, latlngyo
    	]
    });
    console.log(latlngyo);
    var distance = lineLine.getLength();
    console.log(distance/1000);
    ouyputtest.innerHTML=distance;
</script>
<input type="hidden" id="xinfo" name="locinfoX" value="" readonly="readonly">
<input type="hidden" id="yinfo" name="locinfoY" value="" readonly="readonly">

				<br> 
				<!-- 
            name 값이름 지정 시 서버에서 이 이름으로 데이터를 얻게 된다. 
            accept는 전송 허용 가능한 파일의 타입을 지정하는 것 -> 악성 파일 공격 대비
            ex)
             accept="image/png, image/jpeg"
            -->
				<button id="btn_boardwrite" type="submit">작성</button>
			</form>
		</div>
	
	




</body>	
</sec:authorize>
</html>