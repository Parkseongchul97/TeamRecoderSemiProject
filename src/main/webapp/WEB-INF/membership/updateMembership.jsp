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
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

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
default{
z-index: 0;

width: 500px;
height: 500px;
}

#image_container{
width: 500px;
height: 500px;
}

#image_container img{
position: absolute;
width: 500px;
height: 500px;
}
</style>
</head>
<body>
<input id="hiddenImg" type="hidden" value="http://192.168.10.51:8081/membership/${membership.membershipCode}/${membership.membershipImg}">
	<sec:authorize access="isAuthenticated()" var="principal">
		<sec:authentication property="principal" var="member" />
		
      ${membership}
		<form enctype="multipart/form-data">
<<<<<<< HEAD
			<div id="div1">
				<div class="bar" id="bar1">
<<<<<<< HEAD
					<label for="membershipName"> 다모임 클럽명 <span class="name"
						id="name"></span></label> <input type="text" id="membershipName"
						name="membershipName" maxlength="50"
						value="현재 클럽명: ${membership.membershipName}">
=======
				<input type="hidden" id="membershipCode" name="membershipCode" value="${membership.membershipCode}" >
					<label for="membershipName"> 다모임 클럽명 <span class="name"
						id="name"></span></label> <input type="text" id="membershipName"
						name="membershipName" maxlength="50"
						value="${membership.membershipName}">
>>>>>>> seongchul
				</div>
				 
				<div class="bar" id="bar3">
					가입조건 <input type="text" id="membershipAccessionText"
						name="membershipAccessionText"
<<<<<<< HEAD
						value="현재 가입조건: ${membership.membershipAccessionText}">
				</div>
				<div id="textmax">
					<div class="bar" id="bar5">
						다모임 최대인원 <span class="max" id="max"></span> <input type="number"
							for="membershipMax" id="membershipMax" name="membershipMax"
							placeholder="(현재 설정 인원 : ${membership.membershipMax}) 최대 인원 입력 2~100 ">
=======
						value="${membership.membershipAccessionText}">
				</div>
				<div id="textmax">
					<div class="bar" id="bar5">
						다모임 최대인원 <span>현재 인원 : </span><span id="count">${count}</span> <span class="max" id="max"></span>
						<input type="number"
							for="membershipMax" id="membershipMax" name="membershipMax"
							value="${membership.membershipMax}">
>>>>>>> seongchul
					</div>
					<div class="bar" id="bar4">
						한줄소개 <input type="text" id="membershipSimpleText"
							name="membershipSimpleText"
<<<<<<< HEAD
							value="현재 소개문구 : ${membership.membershipSimpleText}"><br>
=======
							value="${membership.membershipSimpleText}">
>>>>>>> seongchul
					</div>
				</div>
			</div>
			<div class="bar" id="bar2">
					사진첨부 <input type="file" name="file" id="file" accept="image/*">
				</div>
				
			<div id="memberImg">
				<img src="http://192.168.10.51:8081/membership/${membership.membershipCode}/${membership.membershipImg}">
			</div>
<<<<<<< HEAD

			<div id="locLaText">지역을 선택해주세요</div>
			
			<div class="locLabox">
				<c:forEach items="${locLaNameList}" var="locLN">
					<input type="checkbox" value="${locLN}" id="${locLN}"
						name="locationLaName">
					<label for="${locLN}" class="locLNCss">${locLN}</label>
				</c:forEach>
			</div>
			<br> <br>
			<div class="locSbox"></div>
			<br> <br> <br> <br> <br> <br>
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
			<br> <br> <br>
			<!-- locationSList typeSName -->
			<!-- 도시별 지역별 태그 선택 ============================================================== -->

			<!--  -->
			<button class="insert" type="button" id="createClub">클럽생성</button>
			<a href="/" class="cancel" id="toIndex">생성취소</a>
			<div>
				<h2>${mem.id}</h2>
				<input type="hidden" name="id" value="${mem.id}"> <input
					type="hidden" name="listGrade" value="host"><br>
			</div>
		</form>

	</div>
	<jsp:include page="../footer/footer.jsp" />
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/makeMembership.js"></script>
	<script src="https://kit.fontawesome.com/a076d05399.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
=======
=======
             <input type="hidden" id="membershipCode" name="membershipCode" value="${membership.membershipCode}">
			<label for="membershipName"> 클럽이름 : <span class="name" id="name"></span></label> 
				<input type="text" id="membershipName"
				name="membershipName" maxlength="50" value="${membership.membershipName}"><br> 
				
				사진첨부: <input type="file" name="file" id="file" accept="image/*" onchange="imgShow(event)"><br>
				<button type="button" id="deleteImg" onclick="asd()">기본 프사 </button>
				
				클럽 가입조건 : <input type="text" id="membershipAccessionText" name="membershipAccessionText" value="${membership.membershipAccessionText}"><br>
				클럽 간단한 설명:<input type="text" id="membershipSimpleText" name="membershipSimpleText" value="${membership.membershipSimpleText}"><br>
				현제 인원 : <span id="count">${count}</span>최대 인원  : <span class="max" id="max"></span> <input type="number" max="100"
				for="membershipMax" id="membershipMax" name="membershipMax" value="${membership.membershipMax}"><br>
>>>>>>> parent of 0996c70 (123)


								<div id="image_container">
								<img id="default" alt="" src="http://192.168.10.51:8081/%EA%B8%B0%EB%B3%B8%EB%AA%A8%EC%9E%84%EC%9D%B4%EB%AF%B8%EC%A7%80.jpg"  >
									<c:if test="${membership.membershipImg != null}">
									<img 
										src="http://192.168.10.51:8081/membership/${membership.membershipCode}/${membership.membershipImg}"
										alt="Profile Image">
										</c:if>
										<c:if test="${membership.membershipImg == null}">
									<img 
										src="http://192.168.10.51:8081/%EA%B8%B0%EB%B3%B8%EB%AA%A8%EC%9E%84%EC%9D%B4%EB%AF%B8%EC%A7%80.jpg"
										alt="Profile Image">
										</c:if>
								</div>
						




			<!-- 08-20 채승훈 -->
			<p>지역</p>
			<select id="locationLaNameMem">

				<option for="allviwe" class="all" id="all" name="all">전체보기</option>
				<c:forEach items="${locLaNameList}" var="locationLaName">
					<option id="addlocation" >${locationLaName}</option>
				</c:forEach>
			</select> <select id="locationSNameMem">
				<option value="???">전체보기</option>
			</select>
			<div id="test1" class="select">${locList}</div>
			<input type="button" value="추가" id="locationBtn">
			<input type="button" value="취소" id="locationBtncancel"><br><br>
			<p>유형</p>
			<select id="typeLaNameMem">
				<option>전체보기</option>
				<c:forEach items="${typeLaNameList}" var="typeLaName">
					<option>${typeLaName}</option>
				</c:forEach>
			</select> <select id="typeSNameMem">
				<option>전체보기</option>
			</select>
			<div id="test2" class="select">${type}</div>
			<input type="button" value="추가" id="typeBtn"> 
			<input type="button" value="취소" id="typeBtncancel"><br><br>
			<input type="hidden" value="0" name="down">
			<button type="button" onclick="validate()">클럽생성</button>
			<div>
				<h2>${mem.id}</h2>
				<input type="hidden" name="id" value="${mem.id}"> <input
					type="hidden" name="listGrade" value="host"><br> <a href="/"
					id="toIndex">생성 취소</a>
			</div>
		</form>
	</sec:authorize>

	<script src="${pageContext.request.contextPath}/js/updateMembership.js"></script>


	<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<<<<<<< HEAD
>>>>>>> seongchul

</body>

<script src="${pageContext.request.contextPath}/js/updateMembership.js"></script>

<script src="https://kit.fontawesome.com/a076d05399.js"></script>


<script>
const locLaName = $(`.locLabox input[type=checkbox][value="${locButton[0].locLaName}"]`)[0];
$(locLaName).prop("checked", true);
let locS = "";
$.ajax({
	url: '/locationSList',
	method: 'GET',
	data: { laName: "${locButton[0].locLaName}" },
	success: function(re) {
		$(".locSbox").html();
		for (const i of re) {
			locS += "<input type='checkbox' value='" + i + "' id='"+ i + "' name='locLN' ";
			<c:forEach items="${locButton}" var="item">
				if("${item.locSName}" === i) {
					locS += "checked";
				}
			</c:forEach>
			locS += "> <label for='" + i +"' class='locLNCss'>" + i + "</label>";
		}
		$(".locSbox").html(locS);
	},
})

const typeLaName = $(`.typeLabox input[type=checkbox][value="${typeButton[0].typeLaName}"]`)[0];
$(typeLaName).prop("checked", true);
let typeS = "";
$.ajax({
	url: '/typeSName',
	method: 'GET',
	data: { typeLaName: "${typeButton[0].typeLaName}" },
	success: function(re) {
		$(".typeSbox").html();
		console.log(re);
		for (const i of re) {
			typeS += "<input type='checkbox' value='" + i + "' id='"+ i + "' name='typeLN' ";
			<c:forEach items="${typeButton}" var="item">
				if("${item.typeSName}" === i) {
					typeS += "checked";
				}
			</c:forEach>
			typeS += "> <label for='" + i +"' class='typeLNCss'>" + i + "</label>";
		}
		$(".typeSbox").html(typeS);
	},
})


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
</body>

<script src="${pageContext.request.contextPath}/js/updateMembership.js"></script>

<script src="https://kit.fontawesome.com/a076d05399.js"></script>


<script>
const locLaName = $(`.locLabox input[type=checkbox][value="${locButton[0].locLaName}"]`)[0];
$(locLaName).prop("checked", true);
let locS = "";
$.ajax({
	url: '/locationSList',
	method: 'GET',
	data: { laName: "${locButton[0].locLaName}" },
	success: function(re) {
		$(".locSbox").html();
		for (const i of re) {
			locS += "<input type='checkbox' value='" + i + "' id='"+ i + "' name='locLN' ";
			<c:forEach items="${locButton}" var="item">
				if("${item.locSName}" === i) {
					locS += "checked";
				}
			</c:forEach>
			locS += "> <label for='" + i +"' class='locLNCss'>" + i + "</label>";
		}
		$(".locSbox").html(locS);
	},
})

const typeLaName = $(`.typeLabox input[type=checkbox][value="${typeButton[0].typeLaName}"]`)[0];
$(typeLaName).prop("checked", true);
let typeS = "";
$.ajax({
	url: '/typeSName',
	method: 'GET',
	data: { typeLaName: "${typeButton[0].typeLaName}" },
	success: function(re) {
		$(".typeSbox").html();
		console.log(re);
		for (const i of re) {
			typeS += "<input type='checkbox' value='" + i + "' id='"+ i + "' name='typeLN' ";
			<c:forEach items="${typeButton}" var="item">
				if("${item.typeSName}" === i) {
					typeS += "checked";
				}
			</c:forEach>
			typeS += "> <label for='" + i +"' class='typeLNCss'>" + i + "</label>";
		}
		$(".typeSbox").html(typeS);
	},
})


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
</body>
=======
	<script src="${pageContext.request.contextPath}/js/locationType.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/locationTypePaging.js"></script>
	<script src="https://kit.fontawesome.com/a076d05399.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>


</body>
>>>>>>> parent of 0996c70 (123)
</html>
