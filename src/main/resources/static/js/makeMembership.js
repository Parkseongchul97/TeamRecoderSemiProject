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


// 지역
$('#locationLaNameMem').change(function(){
	let location = $(this).val()
	let list = "";
	let allList = `<option>전체보기</option>`;
	$.ajax({	
		type: 'post',
		url: '/memLocation',
		data: 'locationLaName=' + location,
		success : function(locationS){
			$.each(locationS , function(index,item){
				list += `<option>${item}</option>`;
			});
			if(list !== ""){
				$("#locationSNameMem").html(list);	
			}else{
				$("#locationSNameMem").html(allList);
			}
			
		}
		
	})
});

// 유형
$('#typeLaNameMem').change(function(){
	let type = $(this).val()
	let list = "";
	let allList = `<option>전체보기</option>`;
	console.log(type)
	$.ajax({
		type: 'post',
		url: '/memType',
		data: $.param({ typeLaName: type }), // & 문자가 URL 쿼리 문자열에서 파라미터 구분자로 사용됨 그래서 URL인코딩 처리를 해줘야 함
		success : function(typeS){
			$.each(typeS , function(index,item){
				list += `<option>${item}</option>`;
		});
							if(list !== ""){
								$("#typeSNameMem").html(list);	
								console.log("if",type)
							}else{
								$("#typeSNameMem").html(allList);
								console.log("else",type)
							}
			
		}
		
	})
});


// 클릭이벤트 사용해서 클릭하면 선택한 정보가 따로 쌓이게
let locationBtnCheck = false;
let ST ="";
locationBtn.addEventListener("click", function () {
	let a = $("#locationLaNameMem option:selected").val();
	let b = $("#locationSNameMem option:selected").val();
	let data = {
		 locationLaName: a,
		 locationSName: b
	}
	ST+=a+" "+b+",";
	$("#test1").html(ST);
	$.ajax({
		type: 'get',
		url: '/addlocation',
		data: ST,
	});
	
 });

 /* success:function(result){
 			if(result){
 				if (allviweValue === "전체보기") {
 									$('#all').text(" 지역 선택 부탁드립니다").css('color', 'red');
 									console.log("이거 나오나?");
 									locationBtnCheck = false;
 								} 
 									else {
 										console.log("이거 나오려나?");
 									$('#all').text( `<option>${item}</option>`).css('color', 'green');
 									if(list !== ""){
 									$("#typeSNameMem").html(list);	
 									console.log("if",type)
 									}else{
 									$("#typeSNameMem").html(allList);
 									console.log("else",type)
 																}
 									locationBtnCheck = true;
 								}

 							}
 			
 		}*/ 
 
 
 typeBtn.addEventListener("click", function () {
 	let a = $("#typeLaNameMem option:selected").val();
 	let b = $("#typeSNameMem option:selected").val();
 	let data = {
 		 typeLaName: a,
 		 typeSName: b
 	}
 	$.ajax({
 		type: 'get',
 		url: '/addtype',
 		data: $.param(data)
 	});
 	
  });

function validate() { // 막아두기
	//if(locationLaName != "전체보기" && typeLaName != "전체보기"){
		let a = $("#locationLaNameMem option:selected").val();
		let b = $("#typeLaNameMem option:selected").val();
			console.log(a.includes("전체보기"));
			console.log(b.includes("전체보기"));
			if(a.includes("전체보기") && b.includes("전체보기")){
				alert("전체보기 말고 다른 걸 선택해야 합니다 ");
			}
			return membershipNameCheck && membershipMaxSubmit && locationBtnCheck && typeBtn;
	//}
	
	
	
}