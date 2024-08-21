
 // 중복되는지 클럽명 체크 
 // 만약 중복된다면 취소
 const membershipNameRegExp = /^.{1,50}$/; // 모든 단어 가능하게 50글자까지
 
 let membershipNameSubmit = false;
 
 membershipName.addEventListener('input', function() { // 클럽명 체크
   const membershipNameValue = $(this).val().trim();
   
   if (membershipNameValue === '') {
     $('#Name').text(" 필수 입력사항입니다").css('color', 'red');
     membershipNameSubmit = false;
   } else if (!membershipNameRegExp.test(membershipNameValue)) {
     $('#Name').text("자유롭게 작성해주세요 ").css('color', 'red');
     membershipNameSubmit = false;
   } else {
     $.ajax({
       type: 'POST',
       url: '/membershipNameCheck', // 컨트롤러 URL
       data: { membershipName: membershipNameValue },
       success: function(result) {
         if (result) { 
           $('#Name').text(" 사용 가능한 클럽명 입니다").css('color', 'green');
           membershipNameSubmit = true;
         } else {
           $('#Name').text(" 중복된 클럽명입니다 다시 작성해 주세요").css('color', 'red');
           membershipNameSubmit = false;
         }
       }
     });
   }
 });
 // 최대인원 설정 칸에 숫자만 들어가도록 정규 표현식 정의
 const membershipMaxRegExp = /^[0-9]{1,100}$/; // 1에서 100까지의 숫자만 허용
 let membershipMaxSubmit = false; // 최대인원 설정 여부를 나타내는 변수 초기화

 // membershipMax 요소에 입력 이벤트 리스너 추가
 membershipMax.addEventListener('input', function() {
     // 현재 입력된 값을 가져오고 공백 제거
     const membershipMaxValue = $(this).val().trim(); // jQuery를 사용하여 현재 값 가져오기
     
     // 입력이 비어있는지 확인
     if (membershipMaxValue === '') {
         // 비어있다면 경고 메시지를 표시하고 색상을 빨간색으로 
         $('#membershipMax').text(" 필수 입력사항입니다").css('color', 'red');
         membershipMaxSubmit = false; // 제출 불가 상태로 
         
     } else if (!membershipMaxRegExp.test(membershipMaxValue)) {
         // 입력값이 정규 표현식과 일치하지 않는 경우
         $('#membershipMax').text("숫자만 지정해주세요").css('color', 'red'); // 경고 메시지 표시
     } else {
         // 입력값이 유효한 경우 AJAX 요청을 통해 서버에 확인
         $.ajax({
             type: 'POST', // POST 방식으로 요청
             url: '/membershipMaxCheck', // 요청을 보낼 컨트롤러 URL
             data: { membershipMax: membershipMaxValue }, // 서버에 보낼 데이터
             success: function(result) {
                 // 서버로부터 응답이 돌아오면
                 if (result) { 
                     // 결과가 true인 경우 (사용 가능한 경우)
                     $('#membershipMax').text(" 인원 설정 성공").css('color', 'green'); // 성공 메시지 표시
                     membershipMaxSubmit = true; // 제출 가능 상태로 설정
                 } else {
                     // 결과가 false인 경우 (불가능한 경우)
                     $('#membershipMax').text(" 숫자가 아닙니다 ").css('color', 'red'); // 불가능 메시지 표시
                     membershipMaxSubmit = false; // 제출 불가 상태로 설정
                 }
             }
         });
     }
 });
 // 글자수세기
 // val().length <-- 글자수!
 // substr(시작인덱스, 길이) <-- 문자열 자르기
 $("#membershipInfo").keyup((e) => {
   let target = $(e.target);
   let length = target.val().length;

   let maxLength = $("#maxLength").text();
   if (length > maxLength) {
     target.val(target.val().substr(0, maxLength));
   } else {
     $("#counter").text(length);
   }
 });
 


