
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
				

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
          rel="stylesheet"
          href="${pageContext.request.contextPath}/css/reset.css"
        />
          <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/css/membershipPage.css"
    />
         <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
         
</head>
<body>
    <main>
        <h1>${main.membership.membershipName}</h1>
        <a href="chatserver?membershipName=${main.membership.membershipName}">채팅서버가기</a>
        <img id="mainImg" src="${main.membership.membershipImg}" alt="클럽 이미지">
        <h2>한줄 소개 : ${main.membership.splitInfo[1]}</h2>
        <a href="/chatserver?membershipCode=${main.membership.membershipCode}">채팅서버가기</a>
        <img id="mainImg" src="http://192.168.10.51:8081/membership/${main.membership.membershipCode}/${main.membership.membershipImg}" alt="클럽 이미지">
        <h2>${main.membership.membershipInfo}</h2>
        <p>인원 현황 : ${membershipUserCount}/${main.membership.membershipMax}</p>
        <h4>호스트 : ${main.member.nickname} 
            <img id="hostImg" src="http://192.168.10.51:8081/member/${main.member.id}/${main.member.memberImg}" alt="호스트 이미지">
        </h4>
     
				
        <c:if test="${member.id == main.member.id && membershipUserCount >= main.membership.membershipMax}">
                        	<div>최대 인원에 도달하였습니다. 최대인원을 다시 설정후 확인해줏비시오</div>
                        </c:if>

 <!-- 지도 만들기(약속장소 보여주기용) -->
                               <div id="map" style="width:500px;height:400px;"></div>
                                <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=026b00a146f92fb6c993f2709b36eee0"></script>
                                <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=LIBRARY"></script>
                                <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services"></script>
                                <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
                                
                             <script>
                               var container = document.getElementById('map'); <!-- //지도를 담을 영역의 DOM 레퍼런스 -->
								var options = { <!--//지도를 생성할 때 필요한 기본 옵션  -->
								center: new kakao.maps.LatLng(33.450701, 126.570667), <!--//지도의 중심좌표 -->
								level: 3 <!--//지도의 레벨(확대, 축소 정도)  -->
								};

								var map = new kakao.maps.Map(container, options); <!--//지도 생성 및 객체 리턴  -->
								
								
								var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
							    mapOption = { 
							        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
							        level: 3 // 지도의 확대 레벨
							    };

							var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

							// 지도에 클릭 이벤트를 등록합니다
							// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
							kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
							    
							    // 클릭한 위도, 경도 정보를 가져옵니다 
							    var latlng = mouseEvent.latLng;
							    
							    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
							    message += '경도는 ' + latlng.getLng() + ' 입니다';
							    
							    var resultDiv = document.getElementById('result'); 
							    resultDiv.innerHTML = message;
							    
							});
								
							var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						    mapOption = { 
						        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
						        level: 3 // 지도의 확대 레벨
						    };

						var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

						// 지도를 클릭한 위치에 표출할 마커입니다
						var marker = new kakao.maps.Marker({ 
						    // 지도 중심좌표에 마커를 생성합니다 
						    position: map.getCenter() 
						}); 
						// 지도에 마커를 표시합니다
						marker.setMap(map);

						// 마커가 드래그 가능하도록 설정합니다 
						marker.setDraggable(true); 
						
						// 지도에 클릭 이벤트를 등록합니다
						// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
						kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
						    
						    // 클릭한 위도, 경도 정보를 가져옵니다 
						    var latlng = mouseEvent.latLng; 
						    
						    // 마커 위치를 클릭한 위치로 옮깁니다
						    marker.setPosition(latlng);
						    
						    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
						    message += '경도는 ' + latlng.getLng() + ' 입니다';
						    
						    var resultDiv = document.getElementById('clickLatlng'); 
						    resultDiv.innerHTML = message;
						    
						});
								
								
								
								</script>

        <c:forEach items="${allMember}" var="cMember">
            <div class="memberTable">
            
                <c:choose>
                    <c:when test="${cMember.listGrade == 'guest'}">
                        <ul> 
                            <li>${cMember.member.nickname} - 가입 대기중</li>
                            <li><img class="allmemberImg" src="${cMember.member.memberImg}" alt="회원 이미지"></li>
                            <c:if test="${main.member.id == member.id && !(membershipUserCount >= main.membership.membershipMax)}">
                                <form id="agreefrm">
                                    <input type="hidden" name="id" value="${cMember.member.id}">
                                    <input type="hidden" name="listGrade" value="regular">
                                    <input type="hidden" name="membershipCode" value="${main.membership.membershipCode}">
                                    <button id="agreeMember">가입 승인</button>
                                </form>
                            </c:if>
                        </ul>
                    </c:when>
                    <c:otherwise>
                        <ul> 
                            <li>${cMember.member.nickname}</li>
                            <li><img class="allmemberImg" src="http://192.168.10.51:8081/member/${cMember.member.id}/${cMember.member.memberImg}" alt="회원 이미지"></li>
                            <li>${cMember.listGrade}</li>
                        </ul>
                    </c:otherwise>
                </c:choose>
                 
            </div>
        </c:forEach>
        <a href="/" id="toIndex">메인페이지로 가기</a>

    </main>
    <script src="${pageContext.request.contextPath}/js/membershipPage.js"></script>
   
</body>
</html>
