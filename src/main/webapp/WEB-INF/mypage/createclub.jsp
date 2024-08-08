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
        클럽이미지: <input type="file" name="membershipImg" accept="image/*" ><br>
        <!-- 클럽 소개 -->
        클럽소개한줄요약:<input type="text" name="membershipIntroductionShort" required><br>
        클럽소개적당히: <textarea name="membershipIntroductionMedium" rows="4" cols="50" required></textarea><br>
        클럽소개많이: <textarea name="membershipIntroductionLong" rows="8" cols="100" required></textarea><br>
        <!-- 클럽 최대 인원 -->
        클럽최대인원: <input type="number" name="membershipMax" required><br>
        <!-- 클럽 생성 -->
        <input type="submit" value="생성"><br>
    </form>
</body>
</html>
