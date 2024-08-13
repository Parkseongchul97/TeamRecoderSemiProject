<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>클럽 생성 테스트</title>
    
    <link rel="stylesheet" href="/${pageContext.request.contextPath}/css/reset.css" />
     <link rel="stylesheet" href="${pageContext.request.contextPath}/css/createclub.css" />
     <link rel="stylesheet" href="${pageContext.request.contextPath}/js/createclub.js" defer/>
  </head>
  <body>
    <div class="container">
      <h1>클럽 생성 테스트</h1>
      <form action="/createclub2" method="post">
        <div class="page" id="page1">
          <h2>1단계: 클럽 정보 입력</h2>
          클럽이름: <input type="text" name="membershipName" required /><br />
          클럽이미지:
          <input type="file" name="membershipImg" accept="image/*" /><br />
          <button type="button" onclick="nextPage(1)">다음</button>
        </div>
        <div class="page" id="page2">
          <h2>2단계: 클럽 소개</h2>
          <div>
          클럽소개한줄요약:<input type="text" id="info" name="membershipInfo" placeholder="한줄로 부탁합니다" required/><br />       
         </div>
          <div>
          클럽소개적당히:<textarea id="infoMedium" name="infoMedium" rows="4" cols="50" placeholder="여러줄로 부탁합니다" required></textarea><br />
         	</div>
           <div>
        클럽소개많이: <textarea id="infoLong" name="infoLong" rows="8" cols="100" placeholder="될때까지 해 주세요" required></textarea><br>
       	</div>
          <button type="button" onclick="prevPage(2)">이전</button>
          <button type="button" onclick="nextPage(2)">다음</button>
        </div>
        <div class="page" id="page3">
          <h2>3단계: 클럽 최대 인원</h2>
          클럽최대인원:
          <input type="number" name="membershipMax" required /><br />
          <button type="button" onclick="prevPage(3)">이전</button>
          <input type="submit" value="클럽 생성" /><br />
        </div>
      </form>
    </div>
     <script>
        let currentPage = 1;
        const totalPages = 3;

        function showPage(page) {
            for (let i = 1; i <= totalPages; i++) {
                document.getElementById(`page${i}`).style.display = (i === page) ? 'block' : 'none';
            }
        }

        function nextPage(page) {
            if (page < totalPages) {
                currentPage++;
                showPage(currentPage);
            }
        }

        function prevPage(page) {
            if (page > 1) {
                currentPage--;
                showPage(currentPage);
            }
        }

        // 초기 페이지 설정
        showPage(currentPage);
    </script>
  </body>
</html>
