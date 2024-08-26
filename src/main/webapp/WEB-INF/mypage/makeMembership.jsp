<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>클럽 생성</title>
      <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css" />
 	  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/makeMembership.css" />
 	  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/locationType.css" />
	  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
      
    <style>
      select {
        display: block;
        width: 200px;
        padding: 10px;
        margin: 10px 0;
        border: 2px solid #333;
        border-radius: 5px;
        background-color: #f0f0f0;
      }
    </style>
  </head>
  <body>
  	<sec:authorize access="isAuthenticated()" var="principal">
				<sec:authentication property="principal" var="member" />
				
     
     
<form action="/makeMembership" method="post" enctype="multipart/form-data" onsubmit="return validate()">

<label for ="membershipName"> 클럽이름 : <span class="name" id="name"></span></label>
  <input type="text" id="membershipName" name="membershipName" maxlength="50"><br>
  
   사진첨부: <input type="file" name="file" accept="image/*"><br>
   클럽 가입조건 :<input type="text" name="memershipAccessionText" ><br>
   클럽 간단한 설명:<input type="text" name="memershipSimpleText" ><br>
  
  
   최대 인원 : <span class="max" id="max"></span>
   <input type="number" for="membershipMax" id="membershipMax" name="membershipMax"><br>
   
 
  <!-- 08-20 채승훈 -->
	<select id="locationLaNameSelect">
		<option>전체보기</option>
		<c:forEach items="${locLaNameList}" var="locLaName">
			<option>${locLaName}</option>
		</c:forEach>
	</select>
	<c:if test="${locSNameList.size()!=0}">
		<form id="locationSNameForm">
			<input type="checkbox" value="전체보기" id="locSNameAll" /> <label
				for="locSNameAll">전체보기</label>
			<c:forEach items="${locSNameList}" var="locSName">
				<input type="checkbox" value="${locSName}" id="${locSName}"
					name="locationSName">
				<label for="${locSName}">${locSName}</label>
			</c:forEach>
			<input type="submit" value="지역 검색" id="locSNameBtn">
		</form>
	</c:if>
	<br>
	<select id="typeLaNameSelect">
		<option>전체보기</option>
		<c:forEach items="${typeLaNameList}" var="typeLaName">
			<option>${typeLaName}</option>
		</c:forEach>
	</select>
	<c:if test="${typeSNameList.size()!=0}">
		<form id="typeSNameForm">
			<input type="checkbox" value="지역 보기" id="typeSNameAll"><label
				for="typeSNameAll">전체보기</label>
			<c:forEach items="${typeSNameList}" var="typeSName">
				<input type="checkbox" value="${typeSName}" id="${typeSName}"
					name="typeSName">
				<label for="${typeSName}">${typeSName}</label>
			</c:forEach>
			<input type="submit" value="타입 검색" id="typeSNameBtn">
		</form>
	</c:if>
	<br>
	<div class="membership-list">
		<c:forEach items="${list}" var="info" varStatus="status">
			<div class="membership-card">
				<div class="membership-img">
					<a href="/${info.membershipCode}"> <c:choose>
							<c:when test="${info.membershipImg != null}">
								<img
									src="http://192.168.10.51:8081/membership/${info.membershipCode}/${info.membershipImg}">
							</c:when>
							<c:otherwise>
								<img
									src="http://192.168.10.51:8081/%EA%B8%B0%EB%B3%B8%EB%AA%A8%EC%9E%84%EC%9D%B4%EB%AF%B8%EC%A7%80.jpg">
							</c:otherwise>
						</c:choose>
					</a>
				</div>
				<div class="membership-info">
					<h1 class="membership-name">${info.membershipName}</h1>
					<h2>${info.membershipInfo}</h2>
					<h3>멤버수 :
						${info.count}/${info.membershipMax}</h3>
					<div id="host">
						<c:choose>
							<c:when test="${info.memberImg != null}">
								<img class="user-img"
									src="http://192.168.10.51:8081/member/${info.id}/${info.memberImg}">
							</c:when>
							<c:otherwise>
								<img class="user-img"
									src="http://192.168.10.51:8081/%EA%B8%B0%EB%B3%B8%ED%94%84%EC%82%AC.jpg">
							</c:otherwise>
						</c:choose>
						<h2>호스트 : ${info.nickname}</h2>
						<input type="hidden" name="code" value="${info.membershipCode}">
						<br>
					</div>
						<div class="locationTypeBox">
							<div class="location">
								<c:forEach items="${info.locations}" var="location">
										<div class="locationList"># ${location.locLaName} ${location.locSName}</div>
								</c:forEach>
							</div>
							<br>
							<div class="type">
								<c:forEach items="${info.types}" var="type">
									 	 <div class="typeList">${type.typeSName}</div>
								</c:forEach>
							</div>
						</div>
				</div>
			</div>
		</c:forEach>
	</div>
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
    <button type="submit">클럽생성</button>
    <div>
     <h2> ${mem.id}</h2>
     <input type="hidden" name="id" value="${mem.id}">
     <input type="hidden" name="listGrade" value="host">
        <a href="/" id="toIndex">생성 취소</a>
    </div>
    </form>
    </sec:authorize>
    <!-- 
    <script>
      $(document).ready(function () {
        // 주 장르에 따른 세부 장르 목록
        const subGenresByMainGenre = {
          액티비티: [
            "자전거",
            "배드민턴",
            "등산",
            "야구",
            "서핑",
            "클라이밍",
            "농구",
          ],
          "푸드,드링크": ["맛집투어", "베이킹", "카페", "위스키"],
          취미: ["공예", "보드게임", "드로잉", "PC게임", "모바일게임"],
          문화예술: [
            "영화",
            "전시",
            "페스티벌",
            "힙합",
            "미술",
            "대중가요",
            "콘서트",
          ],
          스터디: ["코딩", "공무원", "자격증", "영어", "중국어", "일본어"],
        };

        // 주 장르 선택 시 세부 장르 목록 업데이트
        $("#mainGenreSelect").change(function () {
          const selectedMainGenre = $(this).val(); // 선택된 주 장르의 값
          const $subGenreSelect = $("#subGenreSelect"); // 세부 장르 선택 요소

          // 세부 장르 드롭다운 초기화
          $subGenreSelect
            .empty()
            .append('<option value="">-- 선택 --</option>');

          // 선택된 주 장르가 있고, 해당 장르에 세부 장르가 정의되어 있으면
          if (selectedMainGenre && subGenresByMainGenre[selectedMainGenre]) {
            const subGenres = subGenresByMainGenre[selectedMainGenre]; // 선택된 주 장르의 세부 장르 배열

            // 세부 장르 배열을 순회하여 드롭다운에 추가
            $.each(subGenres, function (index, subGenre) {
              $subGenreSelect.append(
                $("<option></option>").val(subGenre).text(subGenre)
              );
            });
          }
        });
      });
    </script>-->
  <script src="${pageContext.request.contextPath}/js/makeMembership.js"></script>
  <script src="${pageContext.request.contextPath}/js/locationType.js"></script>
  	
  	<script src="https://kit.fontawesome.com/a076d05399.js"></script>
	<script src="${pageContext.request.contextPath}/js/locationType.js"></script>
	<script src="${pageContext.request.contextPath}/js/locationTypePaging.js"></script>
	<script src="https://kit.fontawesome.com/a076d05399.js"></script>
	
  </body>
</html>
