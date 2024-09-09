<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>클럽 수정</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/reset.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/makeMembership.css" />
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>


</head>
<body>
	<jsp:include page="/WEB-INF/header/header.jsp" />

	<input id="hiddenImg" type="hidden"
		value="http://192.168.10.51:8081/membership/${membership.membershipCode}/${membership.membershipImg}">
	<sec:authorize access="isAuthenticated()" var="principal">
		<sec:authentication property="principal" var="member" />
		<input id="hiddenL" type="hidden" value="${locButton}">
		<input id="hiddenT" type="hidden" value="${typeButton}">
		<br>
		
		<br>
	</sec:authorize>
	<div class="container">
		<form enctype="multipart/form-data">
			<div id="div1">
				<div class="bar" id="bar1">
					<label for="membershipName"> 다모임 클럽명 <span class="name"
						id="name"></span></label> <input type="text" id="membershipName"
						name="membershipName" maxlength="50"
						value="현재 클럽명: ${membership.membershipName}">
				</div>
				<div class="bar" id="bar2">
					사진첨부 <input type="file" name="file" id="file" accept="image/*">
				</div>
				<div class="bar" id="bar3">
					가입조건 <input type="text" id="membershipAccessionText"
						name="membershipAccessionText"
						value="현재 가입조건: ${membership.membershipAccessionText}">
				</div>
				<div id="textmax">
					<div class="bar" id="bar5">
						다모임 최대인원 <span class="max" id="max"></span> <input type="number"
							for="membershipMax" id="membershipMax" name="membershipMax"
							placeholder="(현재 설정 인원 : ${membership.membershipMax}) 최대 인원 입력 2~100 ">
					</div>
					<div class="bar" id="bar4">
						한줄소개 <input type="text" id="membershipSimpleText"
							name="membershipSimpleText"
							value="현재 소개문구 : ${membership.membershipSimpleText}"><br>
					</div>
				</div>
			</div>
			<!-- br은 지우시면 됩니다! -->
			<br> <br>
			<div id="locLaText">지역을 선택해주세요</div>
			<br>
			<div class="locLabox">
				<c:forEach items="${locLaNameList}" var="locLN">
					<input type="checkbox" value="${locLN}" id="${locLN}"
						name="locationLaName">
					<label for="${locLN}" class="locLNCss">${locLN}</label>
				</c:forEach>
			</div>
			<br> <br>
			<div class="locSbox"></div>

			<div id="typeLaText">유형을 선택해주세요</div>
			<div class="typeLabox">
				<c:forEach items="${typeLaNameList}" var="typeLN">
					<input type="checkbox" value="${typeLN}" id="${typeLN}"
						name="typeLaName">
					<label for="${typeLN}" class="typeLNCss">${typeLN}</label>
				</c:forEach>
			</div>
			<br> <br>
			<div class="typeSbox"></div>

			<!-- locationSList typeSName -->
			<!-- 도시별 지역별 태그 선택 ============================================================== -->

			<!--  -->
			<button class="insert" type="button" id="updateClub">클럽수정</button>
			<a href="/" class="cancel" id="toIndex">수정취소</a>
			<div>
				<h2>${mem.id}</h2>
				<input type="hidden" name="id" value="${mem.id}"> <input
					type="hidden" name="listGrade" value="host"><br>
			</div>
		</form>

	</div>
	<jsp:include page="../footer/footer.jsp" />
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script src="https://kit.fontawesome.com/a076d05399.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>


<script src="https://kit.fontawesome.com/a076d05399.js"></script>


<script>
let MSCode = ${membership.membershipCode};
	function imgShow(event) {
		var reader = new FileReader();

		reader.onload = function(event) {
			var container = document.getElementById('image_container');
			container.innerHTML = '';
			var img = document.createElement('img');
			img.className = 'image'

			img.setAttribute('src', event.target.result);
			container.appendChild(img);

		};

		if (event.target.files.length > 0) {

			reader.readAsDataURL(event.target.files[0]);

		} else {

			$(".image").remove();

		}
	}
</script>
<script src="${pageContext.request.contextPath}/js/updateMembership.js"></script>
</body>
</html>
