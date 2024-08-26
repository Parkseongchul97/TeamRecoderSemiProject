const urlParams = new URL(location.href);
let code = urlParams.pathname;
let a = code.replace("/club/","");
console.log(a);
$("updateMemberShip")
$("#agreeMember").click((e) =>{
		e.preventDefault(); // 기존 이벤트 제거(폼태그 보내는 submit)
		$.ajax({
			url: "/agreeMember",
			type: 'post',
			data: $("#agreefrm").serialize(),
			success: function() {
				location.reload();
				}
				
					
			
		});	
		
	});