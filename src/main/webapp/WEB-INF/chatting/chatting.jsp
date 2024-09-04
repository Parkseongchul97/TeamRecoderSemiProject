<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>채팅</title>

<link rel="stylesheet" href="/css/chatting.css" />
</head>
<body>
	<a href="/">메인화면가기</a>
	<!-- 채팅방 입장 -->
	<div class="chat">
		<div>
			<div class="chat_body">
				<h2 class="chat_title">1번방</h2>
				<a href="/mypage" class="chat_back">◀</a>

				<ul class="chat_list">
					<li></li>
				</ul>

				<div class="chat_input">
					<div class="chat_input_area">
						<textarea placeholder="이미지를 드래그하세요.(한장만 첨부가능)"></textarea>
					</div>

					<div class="chat_button_area">
						<button id="text">전송</button>
						<input type="text" hidden=""
							value="http://192.168.10.51:8081/member/${member.id}/${member.memberImg}"
							id="imginput" />
						<button id="cancle">사진지우기</button>
					</div>
				</div>
			</div>

			<div class="chat_users">
				<h2>
					참가인원 <span class="user"></span>
				</h2>

				<div class="chat_nickname">
					<ul>
						<li></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<!-- 테스트 입장 -->

	<!-- sock js -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.2/sockjs.min.js"></script>
	<!-- STOMP -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript"
		src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="/js/chatting.js"></script>
</body>
</html>
