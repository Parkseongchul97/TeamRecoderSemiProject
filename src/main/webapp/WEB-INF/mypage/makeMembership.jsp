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
							<label for="membershipName"> 다모임 클럽명 <span class="name"
								id="name"></span></label> <input type="text" id="membershipName"
								name="membershipName" maxlength="50" placeholder="클럽명을 작성해 주세요">
						</div>
						<div class="bar" id="bar2">
							사진첨부 <input type="file" name="file" id="file" accept="image/*">
						</div>
						<div class="bar" id="bar3">
							가입조건 <input type="text" id="membershipAccessionText"
								name="membershipAccessionText" placeholder="클럽 가입조건을 작성해 주세요">
						</div>
						<div id="textmax">
							<div class="bar" id="bar5">
								다모임 최대인원 <span class="max" id="max"></span> <input type="number"
									for="membershipMax" id="membershipMax" name="membershipMax"
									placeholder="최대 인원 입력 2~100">
							</div>
							<div class="bar" id="bar4">
								한줄소개 <input type="text" id="membershipSimpleText"
									name="membershipSimpleText"
									placeholder="클럽에 대한 간단한 설명을 작성해 주세요"><br>
							</div>
						</div>
					</div>

					<br> <br> <br>
					
					<!-- 동문님 거 넣으실 자리 -->

					<br> <br> <br>
					<button class="insert" type="button" onclick="validate(event)">클럽생성</button>
					<a href="/" class="cancel" id="toIndex">생성취소</a>
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
			<script
				src="${pageContext.request.contextPath}/js/locationTypePaging.js"></script>
			<script src="https://kit.fontawesome.com/a076d05399.js"></script>
			<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
		</div>
		<jsp:include page="../footer/footer.jsp" />
	</header>
</body>
</html>