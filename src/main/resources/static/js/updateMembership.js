let membershipNameCheck = false;
membershipName.addEventListener('input', function() {
	const membershipNameValue = $(this).val().trim();

	$.ajax({
		type: 'POST',
		url: '/membershipNameCheck', // 컨트롤러 URL
		data: { membershipName: membershipNameValue },
		success: function(result) {
			if (result) {
				if (membershipNameValue === "") {
					$('#name').text(" 필수 입력사항입니다").css('color', 'red');
					membershipNameCheck = false;
				} else if (membershipNameValue.length >= 50) {
					$('#name').text("50자 이하까지 쓸 수 있습니다.").css('color', 'red');
					membershipNameCheck = false;
				} else {
					$('#name').text(" 사용 가능한 클럽명 입니다").css('color', 'green');
					membershipNameCheck = true;
				}

			} else {
				$('#name').text(" 중복된 클럽명입니다 다시 작성해 주세요").css('color', 'red');
				membershipNameCheck = false;
			}
		}
	});
});



const membershipMaxRegExp = /^[0-9]{2,100}$/;

let membershipMaxSubmit = false; // 최대인원 설정 여부를 나타내는 변수 초기화

// membershipMax 요소에 입력 이벤트 리스너 추가
membershipMax.addEventListener('input', function() {
	const membershipMaxValue = $(this).val().trim(); // jQuery를 사용하여 현재 값 가져오기

	if (membershipMaxValue === '') {
		$('#max').text(" 필수 입력사항입니다").css('color', 'red');
		membershipMaxSubmit = false; // 제출 불가 상태로 
	} else if (membershipMaxValue <= 1 || membershipMaxValue >= 101) {
		$('#max').text("설정 가능한 최소 인원은 2명 최대 인원수는 100명입니다").css('color', 'red');
		membershipMaxSubmit = false;
	} else {
		$('#max').text("설정 가능한 인원수 입니다").css('color', 'green');
		membershipMaxSubmit = true;
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

function validate() { // 막아두기
	
	return membershipNameCheck && membershipMaxSubmit;
}








