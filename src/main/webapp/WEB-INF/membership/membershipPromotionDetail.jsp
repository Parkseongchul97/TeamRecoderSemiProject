<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>글작성</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Pen+Script&family=New+Amsterdam&display=swap" rel="stylesheet">
   <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css" />
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/jodit@3.6.9/build/jodit.min.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jodit@3.6.9/build/jodit.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pako/2.0.4/pako.min.js"></script>
    <link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/membershipPromotionDetail.css" />
	
</head>
<body>
<jsp:include page="../header/header.jsp"></jsp:include>
	
	
  <div id="box">
  <div id="container">
  <h1>모임 홍보글 작성</h1>
    <textarea id="editor" name="editor">${memInfo.membershipInfo}</textarea>
    <div id="button-box">
    <button class="button" id="submit-button" type="button" onclick="getEditorContent()">제출</button>
    <a class="button" id="back-button" href="/club/${memInfo.membershipCode}">뒤로가기</a>
    </div>
    </div>
  </div>
  <jsp:include page="../footer/footer.jsp" />
  
  <script>
	const editor = new Jodit("#editor", {
		uploader : {
			insertImageAsBase64URI : true, // 이미지 업로드 시 base64로 변환
			// 업로드 핸들러 URL 설정 (서버 측에서 처리)
			url : "upload_image.php", // 실제 파일 업로드를 처리할 서버 URL
		},
		height : 500, // 에디터의 높이 설정
		toolbar : true, // 툴바 표시
		buttons : [ "bold", "italic", "underline", "strikethrough", "|",
				"ul", "ol", "|", "outdent", "indent", "|", "link", "image",
				'fontsize' ], // 툴바에 표시할 버튼들
	});
	let code = ${memInfo.membershipCode};
	console.log(code);
    function getEditorContent() {
      const content = editor.getEditorValue();
      console.log(content);
      $.ajax({
          url: '/membershipInfoUpdate',
          type: 'POST',
          data: {membershipCode : code,
        	  	text : content},
          success: function(response) {
              location.href = "/club/" + code;
          },
          error: function(error) {
              alert("에러!");
          }
      });
    }
  </script>
  <script src="https://cdn.jsdelivr.net/npm/jodit@3.6.9/build/jodit.min.js"></script>
  </body>
</html>