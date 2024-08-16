<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/makeMembership.css" />
    <link rel="stylesheet" href="/${pageContext.request.contextPath}/css/reset.css" />
</head>
<body>
<form action="/makeMembership" method="post">
 클럽명 : <input type="text" name="membershipName"><br>
  사진첨부: <input type="file" name="membershipImg"><br>
   클럽한줄요약 :<input type="text" name="membershipInfo"><br>
    클럽 소개 :<textarea id="infoMedium" name="infoMedium" rows="4" cols="50" placeholder="여러줄로 부탁합니다" required></textarea><br>
     클럽 원하는데로 소개 :<textarea id="infoLong" name="infoLong" rows="8" cols="100" placeholder="될때까지 해 주세요" required></textarea><br>
    최대 인원 : <input type="text" name="membershipMax"><br>
<form action="/makeMembership" method="post" enctype="multipart/form-data">
 클럽명 : <input type="text" name="membershipName">
  사진첨부: <input type="file" name="file" accept="image/*">
   클럽소개 :<input type="text" name="membershipInfo">
    최대 인원 : <input type="text" name="membershipMax">
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