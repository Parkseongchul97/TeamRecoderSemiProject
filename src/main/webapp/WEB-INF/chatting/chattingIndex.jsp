<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>채팅방</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/chattingIndex.css" />
</head>
<body>
    <main id="chatMain">
        <nav>
            <span>방 제목</span>
            <span>접속인원</span>
        </nav>
        <hr />
        <ul>
            <li></li>
        </ul>
    </main>
    <!-- 채팅방 입장 -->
    <div class="chat">
    <button class="chat_back">◀</button>
        <div>
            <div class="chat_body">
                <ul class="chat_list">     
                    <li></li>
                </ul>
                <div class="chat_input">
                    <div class="chat_input_area">
                        <textarea placeholder="이미지를 드래그하세요.(한장만 첨부가능)"></textarea>
                    </div>
                    <div class="chat_button_area">
                        <button id="text">전송</button>
                        <input type="text" hidden="" value="http://192.168.10.51:8081/member/${member.id}/${member.memberImg}" id="imginput" />
                      <!--  <button id="cancle">사진지우기</button>  -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    	<!-- sock js -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.2/sockjs.min.js"></script>
	<!-- STOMP -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
    <script src="/js/chattingIndex.js"></script>
</body>
</html>
