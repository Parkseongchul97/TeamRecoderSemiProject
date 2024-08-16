<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>정보 수정</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/UpdateMembership.css">
</head>
<body>
    <div class="container">
        <h1>클럽 정보 수정</h1>
        <form action="/updateMembership" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="membership_name">클럽 이름: </label>
                <input type="text" id="membership_name" name="membershipName" required>
            </div>
            <div class="form-group">
                <label for="membership_img">클럽 이미지:</label>
                <input type="file" id="membership_img" name="membershipImg" accept="image/*">
            </div>
            <div class="form-group">
                <label for="membership_info">클럽 정보:</label>
                <textarea id="membership_info" name="membershipInfo" rows="4" required></textarea>
            </div>
            <div class="form-group">
                <label for="membership_max">최대 인원 수:</label>
                <input type="number" id="membership_max" name="membershipMax" min="1" required>
            </div>
            <button type="submit">수정하기</button>
        </form>
    </div>
</body>
</html>