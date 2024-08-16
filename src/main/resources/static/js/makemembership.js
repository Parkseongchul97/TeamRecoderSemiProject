	  


	//	클럽 정보 조회
//	    Membership createdMembership = service.getMembership(membership.getMembershipCode());
//	    String[] infoParts = createdMembership.getMembershipInfo().split("#"); // 정보 분리

		// 모델에 정보 추가 클럽 가입조건, 클럽 홍보글에 들어가 글, 클럽 페이지에서 클럽 규칙등등 클럽원만 알수있는는 정보 , 간단한 설명
	
	model.addAttribute("membershipInfo", infoParts[0]); // 클럽 가입조건
    model.addAttribute("explanation", infoParts[1]); //간단한 설명 
    model.addAttribute("infoMedium", infoParts[2]); // 클럽 홍보글에 들어가 글
	model.addAttribute("infoLong", infoParts[3]); // 클럽원만 알수있는 정보







 // 중복되는지 클럽명 체크 
 // 만약 중복된다면 취소
 
	 
