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


<sec:csrfInput />
<sec:authorize access="isAuthenticated()">

	<body>
		<div class="container px-4 px-lg-5" style="margin-top: 130px;">
			<!-- 파일 업로드를 위한 속성 추가 : enctype="multipart/form-data"  method는 항상 post 방식이어야 한다. -->
			<form action="/board/storewritepro/${boardId}/${categoryId}"
				enctype="multipart/form-data" method="post">
				<sec:csrfInput />
				<div class="card">
					<div class="card-header form-group">
						<span class="badge badge-danger">${boardname.boardName}</span>
						<span class="badge badge-primary">${categoryname.categoryName}</span> <br>
						<span>작성자: ${nick}</span>
						<input name="title" class="form-control" type="text" placeholder="제목을 입력하세요.">
						<input name="price" class="form-control" type="number" placeholder="판매 가격 (원)">
					</div>
					<div class="card-body form-group">
						<textarea name="content" class="form-control" rows="10" placeholder="내용을 입력하세요."></textarea>
					</div>
					<div class="card-footer" >
						<input type="file" class="form-control" name="file">
					</div>
					<div class="card-footer" >
						<div class="text-center">
							<input type="text" class="form-control text-center" id="sample5_address" name="place" placeholder="주소" readonly="readonly"><br>
							<input type="button" class="btn btn-primary  text-center" style="width: 25%; text-align: center;" onclick="sample5_execDaumPostcode()" value="거래 위치 설정"><br><br>	
							<div id="map" class="text-center" style="width:100%;height:350px;margin-top:10px;display:none; text-align: center;"></div>
						</div>
					</div>
				</div>
				<br>
				<button id="btn_boardwrite" class="btn btn-primary" style="position: relative; float:right; margin-top: 15px;  margin-left: 10px;" type="submit">작성</button>
				<button id="btn_boardwrite" class="btn btn-danger" style="position: relative; float:right; margin-top: 15px;" type="button" onclick="closeBtn()">취소</button>
				<br><br><br><br>
				<input type="hidden" id="xinfo" name="locinfoX" value="" readonly="readonly">
				<input type="hidden" id="yinfo" name="locinfoY" value="" readonly="readonly">
			</form>
		</div>
	</body>
	<script type="text/javascript">
		function closeBtn(){
			console.log("${path}/board/list/${boardId}/${categoryId}")
			location.href="${path}/board/list/${boardId}/${categoryId}";
			//${path}/board/list/${boardId}/${categoryId}
		}
	</script>
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
</sec:authorize>
</html> 