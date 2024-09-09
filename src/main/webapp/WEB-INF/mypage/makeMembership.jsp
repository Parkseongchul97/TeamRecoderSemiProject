<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>클럽 생성</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/reset.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/makeMembership.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/locationType.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/header.css" />
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

</head>
<body>
	<jsp:include page="/WEB-INF/header/header.jsp" />
	<header>
		<div class="container">
			<sec:authorize access="isAuthenticated()" var="principal">
				<sec:authentication property="principal" var="member" />

				<form enctype="multipart/form-data">
					<div id="div1">
						<div class="bar" id="bar1">
							<label for="membershipName"> 클럽명 : <br> <span
								class="name" id="name"></span></label> <input type="text"
								id="membershipName" name="membershipName" maxlength="50"
								placeholder="클럽명을 작성해 주세요"><br>
						</div>
						<div class="bar" id="bar2">
							사진첨부 : <br> <input type="file" name="file" id="file"
								accept="image/*"><br>
						</div>
						<div class="bar" id="bar3">
							가입조건 : <br> <input type="text" id="membershipAccessionText"
								name="membershipAccessionText" placeholder="클럽 가입조건을 작성해 주세요"><br>
						</div>
						<div class="bar" id="bar4">
							간단한 설명 : <br> <input type="text" id="membershipSimpleText"
								name="membershipSimpleText" placeholder="클럽에 대한 간단한 설명을 작성해 주세요"><br>
						</div>
						<div class="bar" id="bar5">
							최대 인원 입력: <br> <span class="max" id="max"></span> <input
								type="number" for="membershipMax" id="membershipMax"
								name="membershipMax"
								placeholder="단 최소 인원은 2명 &#13;&#10;최대 인원 100명까지 가능"><br>
						</div>
					</div>




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
	
					

			<!-- 08-20 채승훈 -->
			<p>지역</p>
			<select id="locationLaNameMem">

				<option for="allviwe" class="all" id="all" name="all">전체보기</option>
				<c:forEach items="${locLaNameList}" var="locationLaName">
					<option id="addlocation">${locationLaName}</option>
				</c:forEach>
			</select> <select id="locationSNameMem">
				<option>전체보기</option>
			</select>
			<div id="test1" class="select"></div>
			<input type="button" value="추가" id="locationBtn">
			<input type="button" value="취소" id="locationBtncancel">
			<p>유형</p>
			<select id="typeLaNameMem">
				<option>전체보기</option>
				<c:forEach items="${typeLaNameList}" var="typeLaName">
					<option>${typeLaName}</option>
				</c:forEach>
			</select> <select id="typeSNameMem">
				<option>전체보기</option>
			</select>
			<div id="test2" class="select"></div>
			<input type="button" value="추가" id="typeBtn"> 
			<input type="button" value="취소" id="typeBtncancel">
			<button type="button" onclick="validate(event)">클럽생성</button>
			<div>
		
				 <a href="/"
					id="toIndex">생성 취소</a>
			</div>
		</form>
	</sec:authorize>

	<script src="${pageContext.request.contextPath}/js/makeMembership.js"></script>
	<script src="https://kit.fontawesome.com/a076d05399.js"></script>
	<script src="${pageContext.request.contextPath}/js/locationType.js"></script>
	<script src="${pageContext.request.contextPath}/js/locationTypePaging.js"></script>
	<script src="https://kit.fontawesome.com/a076d05399.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>





					

					<!-- 영민 -->
					<button class="insert" type="button" onclick="validate(event)">클럽생성</button>
					<a href="/" class="cancel" id="toIndex">생성 취소</a>
					<div>
						<h2>${mem.id}</h2>
						<input type="hidden" name="id" value="${mem.id}"> <input
							type="hidden" name="listGrade" value="host"><br>
					</div>

				</form>

			</sec:authorize>

			<script src="${pageContext.request.contextPath}/js/makeMembership.js"></script>


			<script src="https://kit.fontawesome.com/a076d05399.js"></script>
			<script src="${pageContext.request.contextPath}/js/locationType.js"></script>
			<script src="${pageContext.request.contextPath}/js/locationTypePaging.js"></script>
			<script src="https://kit.fontawesome.com/a076d05399.js"></script>
			<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

		</div>
		<jsp:include page="../footer/footer.jsp" />
	</header>
</body>
</html>
