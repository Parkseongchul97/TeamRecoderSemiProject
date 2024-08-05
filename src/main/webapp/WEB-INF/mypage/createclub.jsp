<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<ul>
		<li><a href="/logout">생성취소</a></li>
	</ul>
	<h1>클럽 생성 테스트</h1>
	<form action="/createclub" method="post">
	클럽이름 : <input type="text" name="membershipName"><br>
	클럽이미지 : <input type="file"name="membershipImg" value="목록에서 찾기"><br>
	클럽소개 : <input type="text"name="membershipIntroduction"><br>
	클럽최대인원: <input type="text"name="membershipMax"><br>
	<input type="submit" value="생성"><br>
	
	
	
	
	</form>
</body>
</html>