
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
        <p>인원 현황 : ${membershipUserCount}/${main.membership.membershipMax}</p>
        <h4>호스트 : ${main.member.nickname} 
            <img id="hostImg" src="${main.member.memberImg}" alt="호스트 이미지">
        </h4>
        <c:if test="${mem.id == main.member.id && membershipUserCount >= main.membership.membershipMax}">
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
								</script>

        <c:forEach items="${allMember}" var="cMember">
            <div class="memberTable">
            
                <c:choose>
                    <c:when test="${cMember.listGrade == 'guest'}">
                        <ul> 
                            <li>${cMember.member.nickname} - 가입 대기중</li>
                            <li><img class="allmemberImg" src="${cMember.member.memberImg}" alt="회원 이미지"></li>
                            <c:if test="${main.member.id == mem.id && !(membershipUserCount >= main.membership.membershipMax)}">
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
                            <li><img class="allmemberImg" src="${cMember.member.memberImg}" alt="회원 이미지"></li>
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
