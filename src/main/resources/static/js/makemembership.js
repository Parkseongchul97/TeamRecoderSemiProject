
 // 중복되는지 클럽명 체크 
 // 만약 중복된다면 취소
 const membershipNameRegExp = /^.{1,50}$/; // 모든 단어 가능하게 50글자까지
 
 let membershipNameSubmit = false;
	 
 membershipName.addEventListener('input', function() { // 클럽명 체크
   const membershipNameValue = $(this).val().trim();
   
   if (membershipNameValue === '') {
     $('#membershipNameResult').text(" 필수 입력사항입니다").css('color', 'red');
     membershipSubmit = false;
   } else if (!membershipNameRegExp.test(membershipNameValue)) {
     $('#membershipNameResult').text("자유롭게 작성해주세요 ").css('color', 'red');
     membershipNameSubmit = false;
   } else {
     $.ajax({
       type: 'POST',
       url: '/membershipNameCheck', // 컨트롤러 URL
       data: { membershipName: membershipNameValue },
       success: function(result) {
         if (result) { 
           $('#membershipNameResult').text(" 사용 가능한 클럽명 입니다").css('color', 'green');
           membershipNameSubmit = true;
         } else {
           $('#membershipNameResult').text(" 중복된 클럽명입니다 다시 작성해 주세요").css('color', 'red');
           membershipNameSubmit = false;
         }
       }
     });
   }
 });
