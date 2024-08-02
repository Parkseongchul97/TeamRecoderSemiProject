<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <title>회원가입</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/signUp.css"/>
    
    
  </head>
  <body>
  <main>
    <form action="/signUp" method="post">
      <div class="container">
        <!-- 페이지 1 -->
        <div id="page1" class="page visible">
          <h2>*회원가입*</h2>
          <div class="formBox">
            <label for="id">아이디</label>
            <input type="text" id="id" name="id" required placeholder="아이디를 입력하세요" autofocus />
              
          </div>
          <div class="formBox">
            <label for="pwd">비밀번호</label>
            <input type="password" id="pwd" name="pwd" required placeholder="비밀번호를 입력하세요" />
          </div>
          <div class="formBox">
            <label for="pwdc">비밀번호 확인</label>
            <input type="password" id="pwdc" required  placeholder="비밀번호를 입력하세요" />
          </div>
          <div class="formBox">
            <label for="addr">주소</label>
            <input type="text" id="addr" name="addr" placeholder="주소를 입력하세요" />
          </div>
          <div class="formBox">
            <label for="phone">전화번호</label>
            <input type="text" id="phone" name="phone" placeholder="전화번호를 입력하세요" />
          </div>
          <div class="formBox">
            <label for="email">이메일</label>
            <input type="text" id="email" name="email" required placeholder="이메일을 입력하세요" />
          </div>
          <div class="formBox">
            <label for="name">이름</label>
            <input type="text" id="name" name="name" required placeholder="이름을 입력하세요" />
          </div>
          <div class="formBox">
            <label for="age">나이</label>
            <input type="text" id="age" name="age" placeholder="나이를 입력하세요" />
          </div>
          <div class="formBox">
            <label for="gender">성별</label>
            <label for="genderM">남성</label><input type="radio" id="genderM" name="gender" value="M" /> 
            <label for="genderF">여성</label><input type="radio" id="genderF" name="gender" value="F" /> 
          </div>
          <div class="navigation-buttons">
            <button type="button" onclick="showPage('page2')">다음 페이지</button>
          </div>
        </div>

        <!-- 페이지 2 -->
        <div id="page2" class="page hidden">
          <h2>*회원가입*</h2>
          <div class="formBox">
            <label for="nickname">닉네임</label>
            <input
              type="text"
              id="nickname"
              name="nickname"
              placeholder="닉네임을 입력하세요"
              required
            />
          </div>
          <div class="formBox">
            <label for="memberImg">유저 프로필 사진 URL</label>
            <input
              type="text"
              id="memberImg"
              name="memberImg"
              placeholder="프로필 사진 URL을 입력하세요"
            />
          </div>
          <div class="formBox">
            <label for="memberHobby">유저 관심사</label>
            <input
              type="text"
              id="memberHobby"
              name="memberHobby"
              placeholder="관심사를 입력하세요"
            />
          </div>
          <div class="formBox">
            <label for="memberInfo">유저 간단한 자기소개</label>
            <input
              type="text"
              id="memberInfo"
              name="memberInfo"
              placeholder="자기소개를 입력하세요"
            ></input>
          </div>
          <div class="formBox">
            <label for="memberLocation">유저 선호 지역</label>
            <input
              type="text"
              id="memberLocation"
              name="memberLocation"
              placeholder="선호 지역을 입력하세요"
            />
          </div>
          <div class="formBox">
            <label for="memberType">유저 선호 만남 유형</label>
            <input
              type="text"
              id="memberType"
              name="memberType"
              placeholder="선호 만남 유형을 입력하세요"
            />
          </div>
          <div>
          <div class="navigation-buttons">
            <button type="button" onclick="showPage('page1')">이전 페이지</button>
          </div>
          <div  class="formBox">
            <input id="sub" type="submit" value="회원가입" />
          </div>
          </div>
        </div>
      </div>
    </form>
</main>
    <script src="${pageContext.request.contextPath}/js/signUp.js">
    </script>
  </body>
</html>