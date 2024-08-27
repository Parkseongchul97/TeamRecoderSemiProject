<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
				

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<sec:authorize access="isAuthenticated()" var="principal">
	<sec:authentication property="principal" var="member" />
    <main>
    <!-- ${main}은 멤버쉽관련 정보 + 호스트 정보  타입은 멤버쉽유저리스트임 -->
     <!-- 멤버쉽 이름  -->  
        <h1 >${main.membership.membershipName}</h1>  
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>클럽 회원 페이지</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/membershipPage.css"/>

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.js"></script>     
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <style>
        #calendar{
        margin: auto;
        }
    </style>
</head>
<body>
    <main>
   <sec:authorize access="isAuthenticated()" var="principal">
   <sec:authentication property="principal" var="member" />
        <h1>${main.membership.membershipName}</h1>
        <!-- 멤버쉽 수정 -->
        <div>
       	<h2><a href="/updateMembership">정보 수정하기</a></h2>
       	<a href="/membershipPromotionDetail">membershipPromotionDetail</a>
        </div>
        
        <!-- 멤버쉽 채팅 서버 링크   -->
        <a href="/chatserver?membershipCode=${main.membership.membershipCode}">채팅서버가기</a> 
        
        <a href="/write?membershipCode=${main.membership.membershipCode}">모임게시판작성하러가기</a>
          
        <!--멤버쉽 대표 이미지   -->
        <img id="mainImg" src="http://192.168.10.51:8081/membership/${main.membership.membershipCode}/${main.membership.membershipImg}" alt="클럽 이미지">
        
        <!-- 멤버쉽 소개  -->
        <h2>한줄 소개 : ${main.membership.membershipSimpleText}</h2>
        
           <!-- 멤버쉽 최대 인원과 현재 인원 표기  -->
        <p>인원 현황 : ${main.count}/${main.membership.membershipMax}</p>
        
         <!-- 소개하고 싶은 글 -->
        <p>클럽 소개글: ${main.membership.membershipInfo}</p>
        
         <!--  해당 멤버쉽 호스트 닉네임  -->
        <h4>호스트 : ${main.member.nickname} 
        
        <!--  해당 호스트의 사진이 없을 경우 기본프사 있으면 해당 사진  -->      
        <c:if test="${main.member.memberImg != null}">
            <img id="hostImg" src="http://192.168.10.51:8081/member/${main.member.id}/${main.member.memberImg}" alt="호스트 이미지">
            </c:if>
            <c:if test="${main.member.memberImg == null}">
            <img id="hostImg" src="http://192.168.10.51:8081/%EA%B8%B0%EB%B3%B8%ED%94%84%EC%82%AC.jpg" alt="호스트 이미지">
            </c:if>
           
        </h4>
     
				
        <c:if test="${member.id == main.member.id && main.count >= main.membership.membershipMax}">
                        	<div>최대 인원에 도달하였습니다. 최대 인원을 다시 설정 후 확인해주세요</div>
                        </c:if>
		

 <!-- 지도 만들기(약속장소 보여주기용) -->
                               <div id="map" style="width:500px;height:400px;"></div>
                                <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=026b00a146f92fb6c993f2709b36eee0"></script>
                                <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=LIBRARY"></script>
                                <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services"></script>
                                <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
                                
                             <script>
                               var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스 
								var options = { //지도를 생성할 때 필요한 기본 옵션  
								center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표
								level: 3 //지도의 레벨(확대, 축소 정도) 
								};

								var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴 
								
								
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


  <!-- 멤버쉽 코드를 기반으로 멤버쉽 유저리스트 조회  
  
  유저 등급이 게스트 인경우, 
  닉네임 - 가입대기중 표시   + 이미지 있는 경우 없는 경우 나눠서 처리 
  + 접속한 회원의 아이디와 멤버쉽 호스트의 아이디가 일치하면서 현재 클럽인원이 최대 인원보다 작을 경우 
  폼태그로 id,listGrade,membershipCode, 전송해서 업데이트문 처리해주는 버튼 
  
  그리고 게스트가 아닌 모든 유저들 닉네임 이미지 등급 출력 
  
 
  
   -->
        <c:forEach items="${allMember}" var="listMember">
            <div class="memberTable">
         
                 <c:choose> 
             
                    <c:when test="${listMember.listGrade == 'guest'}">
                        <ul> 
                       
                            <li>${listMember.member.nickname} - 가입 대기중</li>
                            
                           
                            <c:if test="${listMember.member.memberImg != null}">
                            <li><img class="allmemberImg" src="http://192.168.10.51:8081/member/${cMember.member.id}/${cMember.member.memberImg}" alt="회원 이미지"></li>
                            </c:if>
                            <c:if test="${listMember.member.memberImg == null}">
                            <img class="allmemberImg" src="http://192.168.10.51:8081/%EA%B8%B0%EB%B3%B8%ED%94%84%EC%82%AC.jpg" alt="회원 이미지">
                             </c:if>                          
                              <%-- 현제 호스트만 수락버튼 보이게 해둬서 조건 이런데 나중에 바꿔야함 --%>
                            <c:if test="${main.member.id == member.id && !(membershipUserCount >= main.membership.membershipMax)}">
                        	
                                <form id="agreefrm">
                                    <input type="hidden" name="id" value="${listMember.member.id}">
                                    <input type="hidden" name="listGrade" value="regular">
                                    <input type="hidden" name="membershipCode" value="${main.membership.membershipCode}">
                                    <button id="agreeMember">가입 승인</button>
                                </form>
                            </c:if>
                            
                            
                        </ul>
                    </c:when>
                      
                    <c:otherwise>
                        <ul> 
                            <li>${listMember.member.nickname}</li>
                            <c:if test="${listMember.member.memberImg != null}">
                            <li><img class="allmemberImg" src="http://192.168.10.51:8081/member/${cMember.member.id}/${cMember.member.memberImg}" alt="회원 이미지"></li>
                            </c:if>
                            <c:if test="${listMember.member.memberImg == null}">
                            <img class="allmemberImg" src="http://192.168.10.51:8081/%EA%B8%B0%EB%B3%B8%ED%94%84%EC%82%AC.jpg" alt="회원 이미지">
                            </c:if>
                            <li>${listMember.listGrade}</li>
                        </ul>
                    </c:otherwise>
                </c:choose>
                 
            </div>
        </c:forEach>
        <a href="/" id="toIndex">메인페이지로 가기</a>
        </sec:authorize>
        
    </main>
     <div id="calendar" style= "width: 60%"     ></div>
     </sec:authorize>
    
    <script>
    const allDates = [];
    let allMeet = {};
    <c:forEach items="${allmeet}" var="item">
    	allMeet.title = "${item.meetInfo}";
    	allMeet.start = "${item.meetDateStart}";
    	allMeet.end = "${item.meetDateEnd}";
    	allMeet.color = "${item.color}";
    	allMeet.meetCode= "${item.meetCode}";
    	allDates.push(allMeet);
    	allMeet = {};
    </c:forEach>
    console.log(allDates);
    </script>
    
    <script src="${pageContext.request.contextPath}/js/membershipPage.js"></script>
    <script src="${pageContext.request.contextPath}/js/calendar.js"></script>
   
</body>
</html>
