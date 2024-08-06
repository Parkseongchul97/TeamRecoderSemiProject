<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>클럽 생성 테스트</title>
</head>
<body>
    <h1>클럽 생성 테스트</h1>
    <form action="/createclub" method="post" >
        <!-- 클럽 이름 -->
        클럽이름: <input type="text" name="membershipName" required><br>
        <!-- 클럽 이미지만 업로드 -->
        클럽이미지: <input type="file" name="membershipImg" accept="image/*" required><br>
        <!-- 클럽 소개 -->
        클럽소개: <textarea name="membershipIntroduction" rows="4" cols="50" required></textarea><br>
        <!-- 클럽 최대 인원 -->
        클럽최대인원: <input type="number" name="membershipMax" required><br>
        <!-- 클럽 생성 -->
        <input type="submit" value="생성"><br>
    </form>
</body>
</html>
