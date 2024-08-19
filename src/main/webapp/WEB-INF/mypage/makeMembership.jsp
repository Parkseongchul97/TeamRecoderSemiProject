<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="/${pageContext.request.contextPath}/css/reset.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/makeMembership.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/js/makeMembership.js" />
</head>
<body>
<form action="/makeMembership" method="post" enctype="multipart/form-data">
 클럽명 : <input type="text" name="membershipName" required><br>
  사진첨부: <input type="file" name="file" accept="image/*"><br>
   클럽 가입조건 :<input type="text" name="membershipInfo"required><br>
   클럽 간단한 설명:<input type="text" name="explanation"required><br>
   클럽 홍보글 :<textarea id="infoMedium" name="infoMedium" rows="4" cols="50" placeholder="여러줄로 부탁합니다" required></textarea><br>
   클럽원간의 비밀 정보 :<textarea id="infoLong" name="infoLong" rows="8" cols="100" placeholder="될때까지 해 주세요" required></textarea><br>
   최대 인원 : <input type="text" name="membershipMax" required><br>

    <h2> ${mem.id}</h2>
     <input type="hidden" name="id" value="${mem.id}">
     <input type="hidden" name="listGrade" value="host">
    <button type="submit">클럽생성</button>
    <div>
        <a href="/" id="toIndex">생성 취소</a>
    </div>
    </form>

</body>
</html>