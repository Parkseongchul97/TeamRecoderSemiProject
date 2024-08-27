<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>글작성</title>
    <link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/reset.css" />
  <!-- Jodit CSS -->
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/jodit@3.6.9/build/jodit.min.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jodit@3.6.9/build/jodit.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pako/2.0.4/pako.min.js"></script>
    <link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/membershipPromotionDetail.css" />

</head>
<body>
	
	<input id="hiddenCode" type="hidden" value="${code}">
  <div id="con">
    <textarea id="editor" name="editor">${memInfo.membershipInfo}</textarea>
    <div id="button-box">
    <button class="button" id="submit-button" type="button" onclick="getEditorContent()">제출</button>
    <a class="button" id="back-button" href="/club/${memInfo.membershipCode}">뒤로가기</a>
    </div>
  </div>
  
  <script src="https://cdn.jsdelivr.net/npm/jodit@3.6.9/build/jodit.min.js"></script>
  <script>
    const editor = new Jodit('#editor', {
      uploader: {
        insertImageAsBase64URI: true,
        url: 'upload_image.php', // 서버 측 이미지 업로드 핸들러 URL
      },
      height: 500,
      toolbar: true,
      buttons: [
    	  
    	  "bold",
          "italic",
          "underline",
          "strikethrough",
          "|",
          "ul",
          "ol",
          "|",
          "outdent",
          "indent",
          "|",
          "link",
          "image",
        'fontsize'
      ],
      // 추가적인 설정이 필요할 경우 여기에 작성
    });
	let code = ${code};
	console.log(code);
    function getEditorContent() {
      const content = editor.getEditorValue();
      console.log(content); 
      $.ajax({
          url: '/membershipInfoUpdate', 
          type: 'POST',
          data: {membershipCode : code,
        	  		test : content},
          success: function(response) {
              
              location.href = "/club/" + code;
          },
          error: function(error) {
              console.error('데이터 가져오기 오류:', error);
          }
      });
    }
  </script>
  
  
  </body>
</html>
