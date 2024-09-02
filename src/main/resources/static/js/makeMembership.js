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


// 지역 선택 시 변경 이벤트
$('#locationLaNameMem').change(function() {
	let location = $(this).val()// 선택된 지역 값을 가져옴
	let list = "";// 지역 하위 목록을 저장할 변수
	let allList = `<option>전체보기</option>`;
	$.ajax({
		type: 'post',
		url: '/memLocation',
		data: 'locationLaName=' + location,
		success: function(locationS) {
			$.each(locationS, function(index, item) {
				list += `<option>${item}</option>`;
			});
			if (list !== "") {
				$("#locationSNameMem").html(list);	// 하위 지역 목록을 업데이트
			} else {
				$("#locationSNameMem").html(allList); // 하위 지역이 없으면 전체보기로 설정
			}

		}

	})
});

// 유형
$('#typeLaNameMem').change(function() {
	let type = $(this).val()
	let list = "";
	let allList = `<option>전체보기</option>`;
	//console.log(type)
	$.ajax({
		type: 'post',
		url: '/memType',
		data: $.param({ typeLaName: type }), // & 문자가 URL 쿼리 문자열에서 파라미터 구분자로 사용됨 그래서 URL인코딩 처리를 해줘야 함
		success: function(typeS) {
			$.each(typeS, function(index, item) {
				list += `<option>${item}</option>`;
			});
			if (list !== "") {
				$("#typeSNameMem").html(list);
				console.log("if", type);
			} else {
				$("#typeSNameMem").html(allList);
				console.log("else", type);
			}

		}

	});
});



// 클릭 이벤트 사용해서 클릭하면 선택한 정보가 따로 쌓이게
let locationBtnCheck = false; // 클릭 상태를 나타내는 변수 (초기값은 false)
let LB = ""; // 선택된 지역 정보를 저장할 변수 
let list = "";
let allList = `<option>전체보기</option>`; // 전체보기 옵션을 포함한 HTML 문자열
let selectedAreas = []; // 선택된 지역 정보를 저장할 배열

// locationBtn 버튼에 클릭 이벤트 리스너 추가
locationBtn.addEventListener("click", function() {
	// 전체보기일 경우 클릭 이벤트를 막기
	if ($("#locationLaNameMem option:selected").val() === "전체보기") {
		return; // 클릭 이벤트를 막고 함수 종료
	}

	// 선택된 지역 정보를 변수에 저장
	let a = $("#locationLaNameMem option:selected").val(); // 대분류 선택
	let b = $("#locationSNameMem option:selected").val(); // 소분류 선택
	locationLaName = a;
	locationSName = b;
	locationcontain = a + "," + b; // locationcontain에 대분류와 소분류를 담음

	// 애초에 글씨를 넣을 때 리스트에 추가하는 방식으로 가서
	// 해당 리스트에서 값이 있는지 체크! 없을 때만 추가하면 되겠죠!
	let currentSelect = "#" + a + "!" + b; // 현재 선택된 지역 정보

	// 중복 체크
	if (!selectedAreas.includes(currentSelect)) {
		selectedAreas.push(currentSelect); // 중복이 없으면 배열에 추가
		//console.log(`추가된 지역: ${currentSelect}`);



		// 선택된 정보를 LB 변수에 추가 (형식: #a!b)
		if (LB) {
			LB += " #" + a + "!" + b.trim(); // LB가 비어있지 않을 때 
		} else {
			LB += "#" + a + "!" + b.trim(); // LB가 비어있을 때
		}

		// LB에서 '!'를 공백으로 변환하여 화면에 표시
		$("#test1").html(LB.replace(/!/g, ' '));

		// AJAX 요청을 통해 서버에 선택된 지역 정보 전송

	}
});




// 클릭 이벤트 사용해서 클릭하면 선택한 정보가 따로 쌓이게
let typeBtnCheck = false; // 클릭 상태를 나타내는 변수 (초기값은 false)
let TB = ""; // 선택된 유형 정보를 저장할 변수
let allList2 = `<option>전체보기</option>`; // 전체보기 옵션을 포함한 HTML 문자열
let selectedtype = []; // 선택된 유형 정보를 저장할 배열(중복체크용)

// typeBtn 버튼에 클릭 이벤트 리스너 추가
typeBtn.addEventListener("click", function() {
	//console.log("타입추가");
	// 전체보기일 경우 클릭 이벤트를 막기
	if ($("#typeLaNameMem option:selected").val() === "전체보기") {
		return; // 클릭 이벤트를 막고 함수 종료
	}

	// 선택된 유형 정보를 변수에 저장
	let c = $("#typeLaNameMem option:selected").val(); // 대분류 선택
	let d = $("#typeSNameMem option:selected").val(); // 소분류 선택

	typecontain = c + "," + d; // typecontain에 대분류와 소분류를 담음

	// 애초에 글씨를 넣을 때 리스트에 추가하는 방식으로 가서
	// 해당 리스트에서 값이 있는지 체크! 없을 때만 추가하면 되겠죠!
	let currentSelect = "#" + c + "!" + d; // 현재 선택된 유형 정보

	// 중복 체크
	if (!selectedtype.includes(currentSelect)) {
		selectedtype.push(currentSelect); // 중복이 없으면 배열에 추가
		//console.log(`추가된 지역: ${currentSelect}`);


		// 선택된 정보를 data 객체에 저장
		let typedata = {
			typeLaName: c,
			typeSName: d
		};

		// 선택된 정보를 TB 변수에 추가 (형식: #a!b)
		TB += "#" + c + "!" + d.trim();
		if (TB) {
			TB += "";
		} else {
			TB = " "+TB;
		}
		// TB에서 '!'를 공백으로 변환하여 화면에 표시
		$("#test2").html(TB.replace(/!/g, ' '));



		// AJAX 요청을 통해 서버에 선택된 유형 정보 전송
		$.ajax({
			type: 'get',
			url: '/addtype',
			data: $.param({ TB: TB, typedata: typedata, typecontain: typecontain }), // TB 변수를 서버에 전송

			success: function(result) {
				if (result) { // 서버 응답이 있는 경우
					// 전체보기 선택 시 처리
					if ($("#typeLaNameMem option:selected").val() === "전체보기") {
						$('#all').text("지역 선택 부탁드립니다").css('color', 'red'); // 사용자에게 메시지 표시

						typeBtnCheck = false; // 클릭 상태를 false로 설정
					} else {
						$('#all').text(`전체보기`).css('color', 'red'); // 전체보기 메시지 표시
						typeBtnCheck = true; // 클릭 상태를 true로 설정
					}
				}
			}
		});
	}
});


function validate() {
	let name = $("#membershipName").val();
	let f = document.getElementById('file');
	let file = f.files[0];
	let membershipAccessionText = $("#membershipAccessionText").val();
	let membershipSimpleText = $("#membershipSimpleText").val();
	let membershipMax = $("#membershipMax").val();
	let loc = $("#test1").text();
	let tp = $("#test2").text();
	let data = {
		membershipName: name,
		membershipAccessionText: membershipAccessionText,
		membershipSimpleText: membershipSimpleText,
		membershipMax: membershipMax,
	};
	
	let formData = new FormData(); // FormData 객체를 사용하여 파일과 데이터를 함께 전송합니다.
	formData.append('dto', JSON.stringify(data));
	formData.append('file', file);
	formData.append('LB', loc);
	formData.append('TB',tp);
	$.ajax({
		type: 'post',
		url: '/makeMembership',
		data: formData,
		processData: false, 
		contentType: false,
		success: function() {
			console.log("와!!");
		}

	});
}