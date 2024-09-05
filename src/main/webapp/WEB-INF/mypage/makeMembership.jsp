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
 <jsp:include page="/WEB-INF/header/headerIndex.jsp" />
 <header>
	<div class="container">
	<sec:authorize access="isAuthenticated()" var="principal">
		<sec:authentication property="principal" var="member" />

		<form enctype="multipart/form-data">
			<div id="div1">
				<div class="bar">
			<label for="membershipName"> 클럽이름 : <span class="name" id="name"></span></label> 
				<input type="text" id="membershipName"
				name="membershipName" maxlength="50"><br>
				</div> 
				<div class="bar">
				사진첨부: <input type="file" name="file" id="file" accept="image/*"><br>
				</div>
				<div class="bar">
				클럽 가입조건 : <input type="text" id="membershipAccessionText" name="membershipAccessionText"><br>
				</div>
				<div class="bar">
				클럽 간단한 설명:<input type="text" id="membershipSimpleText" name="membershipSimpleText"><br>
				</div>
				<div class="bar">
				최대 인원 : <span class="max" id="max"></span> <input type="number"
				for="membershipMax" id="membershipMax" name="membershipMax" placeholder="설정 가능한 최소 인원은 2명 &#13;&#10;최대 인원은 100명입니다"><br>
				</div>
			</div>
		
			<div class = "ltadd">
			<p class="pt" id="location">지역</p>
			<select id="locationLaNameMem">

				<option for="allviwe" class="all" id="all" name="all">전체보기</option>
				<c:forEach items="${locLaNameList}" var="locationLaName">
					<option id="addlocation">${locationLaName}</option>
				</c:forEach>
			</select> <select id="locationSNameMem">
				<option>전체보기</option>
			</select>
			<div = class="locationt1">
			<div id="test1" class="select" placeholder="취소를 누르시면 전부 지워지니 신중히 사용하세요"></div>
			<input class="insert" type="button" value="추가" id="locationBtn">
			<input class="cancel" type="button" value="취소" id="locationBtncancel"><br><br>
			</div>
			</div>
			<p class="pt" id="type">유형</p>
			<select id="typeLaNameMem">
				<option>전체보기</option>
				<c:forEach items="${typeLaNameList}" var="typeLaName">
					<option>${typeLaName}</option>
				</c:forEach>
			</select> 
			<select id="typeSNameMem">
				<option>전체보기</option>
			</select>
			<div id="test2" class="select" placeholder="취소를 누르시면 전부 지워지니 신중히 사용하세요"></div>
			<input class="insert" type="button" value="추가" id="typeBtn"> 
			<input class="cancel" type="button" value="취소" id="typeBtncancel"><br><br>
			
			<button class="insert" type="button" onclick="validate(event)">클럽생성</button>
			<a href="/" class="cancel" id="toIndex">생성 취소</a>
			<div>
				<h2>${mem.id}</h2>
				<input type="hidden" name="id" value="${mem.id}"> 
				<input type="hidden" name="listGrade" value="host"><br> 
			</div>
		</form>
	</sec:authorize>

	<script src="${pageContext.request.contextPath}/js/makeMembership.js"></script>


	<script src="https://kit.fontawesome.com/a076d05399.js"></script>
	<script src="${pageContext.request.contextPath}/js/locationType.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/locationTypePaging.js"></script>
	<script src="https://kit.fontawesome.com/a076d05399.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	</div>
	</div>
</header>
</body>
</html>
