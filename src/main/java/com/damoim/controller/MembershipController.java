package com.damoim.controller;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.damoim.model.vo.Membership;
import org.springframework.web.bind.annotation.PostMapping;
import com.damoim.model.dto.MemberListDTO;
import com.damoim.model.dto.MembershipDTO;
import com.damoim.model.dto.MembershipTypeDTO;
import com.damoim.service.MembershipService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import com.damoim.model.vo.Member;
import com.damoim.model.vo.MembershipUserList;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.bind.annotation.RequestBody;
@Controller
public class MembershipController {
	// 클럽 생성 관련 컨트롤 
	@Autowired
	private MembershipService membershipservice;

//	 @GetMapping("/")
// 	public String index(Model model) {
//		model.addAttribute("allClub",membershipservice.allClub());
//		 return "index";
// 		
// 	
// 	}
	
	

	@Autowired
	private MembershipService service;
	
	
//	 @GetMapping("/")
// 	public String index(Model model) {
//		model.addAttribute("allClub",membershipservice.allClub());
//		 return "index";
// 		
// 	
// 	}
	
	/*
	 * 
	 * */
	@GetMapping("/createclub")
	public String createclub(){
		return "mypage/createclub";
		
	}
	
//	@PostMapping("/createclub")// 클럽 생성 메서드
//	public String createclub(Membership membership, String infoMedium, String infoLong) {
//		System.out.println(membership);
//		Membership mship = membership;
//		String info = mship.getMembershipInfo();
//		info += "#"+ infoMedium + "#" + infoLong; //첫번째와 두번째와 세번째 @로 나눠서 같이 저장
//		System.out.println(info);
//		mship.setMembershipInfo(info);
//		membershipservice.createclub(membership); // 클럽 생성 로직 호출
//		System.out.println(membership);
//     return "mypage/makeMembership"; // 클럽 생성 후 인덱스 페이지로 리다이렉션
//         
//}	
	
//	@GetMapping("/createclub2")
//	public String createclub2(){
//		return "mypage/createclub2";
//		
//	}
	
//	@PostMapping("/createclub") // 클럽 생성
//	public String createclub(MembershipDTO dto, String infoMedium, String infoLong ) {
//		Membership membership = Membership.builder()
//				.membershipName(dto.getMembershipName())
//				.membershipInfo(dto.getMembershipInfo() + "#"+ infoMedium + "#" + infoLong)
//				.membershipMax(Integer.parseInt(dto.getMembershipMax())
//						).build();
//		// 클럽생성?
//		service.createclub(membership);
//		MemberListDTO list = new MemberListDTO();
//				list.setId(dto.getId());
//				list.setListGrade(dto.getListGrade());
//				list.setMembershipCode(membership.getMembershipCode());
//		// 호스트로 보유중인 클럽 유무 확인
//		service.host(list);
//		return "redirect:/";
//	}
	
	/*영민 클럽생성 1-1
	 * 
	 * 
	 * 
	 * */
	@PostMapping("/createclub") // 클럽 생성
	public String createclub(MembershipDTO dto,String InfoCondition, String infoMedium, String infoLong, Model model) {
	    Membership membership = Membership.builder()
	            .membershipName(dto.getMembershipName())
	            .membershipInfo(dto.getMembershipInfo() +"#"+ InfoCondition + "#" + infoMedium + "#" + infoLong)
	            .membershipMax(Integer.parseInt(dto.getMembershipMax()))
	            .build();

	 
	    service.createclub(membership); // membership서버에 createclub 사용
	    
	    MemberListDTO list = new MemberListDTO(); // MemberListDTO를 list로 만들어서 뿌림
	    list.setId(dto.getId());
	    list.setListGrade(dto.getListGrade());
	    list.setMembershipCode(membership.getMembershipCode());
	
	    
//	 // 클럽 정보 조회
//	    Membership createdMembership = service.getMembership(membership.getMembershipCode());
//	    String[] infoParts = createdMembership.getMembershipInfo().split("#"); // 정보 분리
//
//	    // 모델에 정보 추가 클럽 가입조건, 클럽 홍보글에 들어가 글, 클럽 페이지에서 클럽 규칙등등 클럽원만 알수있는는 정보 , 간단한 설명
//	    model.addAttribute("Info", infoParts[0]); // 한줄 설명
//	    model.addAttribute("infoMedium", infoParts[1]); // 간단한 설명 
//	    model.addAttribute("infoLong", infoParts[2]); // 상세 설명

	    service.host(list); // 호스트로 보유 중인 클럽 유무 확인

	    return "redirect:/"; // 클럽 생성 후 홈으로 리다이렉트
	}
	/*영민 클럽생성 1-2
	 * 
	 * 
	 * 
	 * */
//	@PostMapping("/createclub")
//	public String createclub(Membership membership) {
//		System.out.println(membership);
//		membership.setMembershipInfo(null);
//     return "redirect:/"; // 클럽 생성 후 인덱스 페이지로 리다이렉션
//}	
	


	/*
	 * 성일
	 * 
	 * 영민 -- #으로 나눈 Info 정보 뿌리기 (스승님 정배님)
	 * */
	@GetMapping("/{membershipCode}") // 클럽 홍보 페이지 각각 맞춰 갈수있는거
	public String main(@PathVariable("membershipCode") Integer membershipCode, MemberListDTO memberListDTO, Model model,
			HttpServletRequest request) {
		
		
		MembershipUserList MS = service.main(membershipCode);
		
//		String test = MS.getMembership().getMembershipInfo();
//		String[] infotest = test.split("#");
//		
//		MS.getMembership().setSplitInfo(infotest);
		
		String test = MS.getMembership().getMembershipInfo();
		if(test.contains("#")) {
					
			String[] infotest = test.split("#");
			
			MS.getMembership().setSplitInfo(infotest);
			System.out.println(MS);

		}
		
	public String main(@PathVariable("membershipCode") Integer membershipCode, MemberListDTO memberListDTO, Model model
			) {
		System.out.println(service.main(membershipCode).getListCode());
		// 홍보페이지에 membership 관련 정보 + 호스트 정보
		model.addAttribute("main", MS);
		// 현재 가입된 인원수
		model.addAttribute("membershipUserCount", service.membershipUserCount(membershipCode));	
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		System.out.println("클럽 홍보 페이지 컨트롤러 왔을때 " + authentication.getName().equals("anonymousUser"));
	if(	!authentication.getName().equals("anonymousUser") ) {
		Member mem = (Member) authentication.getPrincipal();
		
		 // 로그인 유무 확인 . 널포인트 에러 방지
			// 가입한 클럽 인지 확인을 위한 아이디 정보 가져오기
			memberListDTO.setId(mem.getId());
			// 해당클럽 안에서의 등급 가져오기
			model.addAttribute("checkMember", service.checkMember(memberListDTO));
	}
		return "mainboard/main";
	}
	/*
	  * 성철
	  * 해당 클럽에 가입된 회원이 그클럽에 정보와 클럽 가입 현황 볼수있는 페이지 이동
	  * 
	  * 영민 -- #으로 나눈 Info 정보 뿌리기 (스승님 정배님)
	  * */
	 @GetMapping("/club/{membershipCode}") // 클럽 페이지 이동
		public String membershipPage(@PathVariable("membershipCode") Integer membershipCode,MemberListDTO memberListDTO, Model model) {
		 	// 클럽 페이지에 membership 관련 정보 + 호스트 정보
		 	MembershipUserList MS = service.main(membershipCode);
		 	
		 	String test = MS.getMembership().getMembershipInfo();
			if(test.contains("#")) {
						
				String[] infotest = test.split("#");
				
				MS.getMembership().setSplitInfo(infotest);
				System.out.println(MS);

			}
			
		 	model.addAttribute("main", MS);
		 	// 현재 가입된 인원수
			model.addAttribute("membershipUserCount", service.membershipUserCount(membershipCode));
			// 로그인된 회원 정보		
			model.addAttribute("allMember" , service.MembershipAllInfo(membershipCode));
			return "membership/membershipPage";
		}
	 /*
	  * 성철
	  * 일단 클럽 호스트가 가입 승인대기인원 -> 일반 회원으로 바꾸는기능 
	  * */
	 @ResponseBody
	 @PostMapping("/agreeMember") // 클럽 회원가입 승인
	 public void agreeMemeber(MemberListDTO member) {
		 // 일단은 호스트일때만 클럽 회원 승인기능
		 service.agreeMemeber(member);	
	 }
	
	/*
	 * 
	 * */
	@GetMapping("/makeMembership") // 클럽 생성페이지로 이동
	public String makeMembership() {
		return "mypage/makeMembership";
	}
	

	
	
	/* ??? 
	 * 
	 * 
	 * 영민
	 *
	 *
	 * 성철
	 * 만들어진거에 사진첨부만 추가
	 * */
	@PostMapping("/makeMembership") // 클럽 생성
	public String makeMembership(MembershipDTO dto,String explanation, String infoMedium, String infoLong, MultipartFile file) throws IOException {
		Membership membership = Membership.builder()
				.membershipName(dto.getMembershipName())
				.membershipInfo(dto.getMembershipInfo()+ "#"+ explanation + "#"+ infoMedium + "#" + infoLong)
				.membershipMax(Integer.parseInt(dto.getMembershipMax())	
						).build();
		// 클럽생성?
		service.makeMembership(membership);
		Path directoryPath = Paths.get("\\\\\\\\192.168.10.51\\\\damoim\\\\membership\\"+ Integer.toString(membership.getMembershipCode())+"\\");  
		Files.createDirectories(directoryPath);
		Membership m = Membership.builder()
					.membershipCode(membership.getMembershipCode())
					.membershipImg(fileUpload(file, membership.getMembershipCode()))
					.build();
		System.out.println("해당 맴버쉽 코드 : " + m.getMembershipCode());
		System.out.println("이미지 URL 테스트 " + m.getMembershipImg());
		service.membershipImg(m);
		MemberListDTO list = new MemberListDTO();
				list.setId(dto.getId());
				list.setListGrade(dto.getListGrade());
				list.setMembershipCode(membership.getMembershipCode());
		// 호스트로 보유중인 클럽 유무 확인
		service.host(list);
		return "redirect:/";
	}

	

	
	
	 /*
	  * 성철
	  * 세션에 맴버가 해당 클럽에 가입 X 상황일시 신청가능한 메서드
	  * */
	@PostMapping("/membershipApply") // 클럽 회원가입 신청
	public String membershipApply(MemberListDTO member) {
		// 클럽 가입 신청
		service.membershipApply(member);
		return "redirect:/" + member.getMembershipCode();
	}

	
//@PostMapping("/makeMembership") // 클럽 생성
//public String makeMembership(MembershipDTO dto) {
//	Membership membership = Membership.builder()
//			.membershipName(dto.getMembershipName())
//			.membershipInfo(dto.getMembershipInfo())
//			.membershipMax(Integer.parseInt(dto.getMembershipMax())
//					).build();
//	// 클럽생성?
//	service.makeMembership(membership);
//	MemberListDTO list = new MemberListDTO();
//			list.setId(dto.getId());
//			list.setListGrade(dto.getListGrade());
//			list.setMembershipCode(membership.getMembershipCode());
//	// 호스트로 보유중인 클럽 유무 확인
//	service.host(list);
//	return "redirect:/";
//}

	
	/* 성철
	 * 파일 삽입 메서드 해당맴버쉽 프로필사진 !!
	 * 
	 * */ 
	public String fileUpload(MultipartFile file, int code) throws IllegalStateException, IOException {
		if(file.getOriginalFilename() == "") {
			System.out.println("NULL 리턴");
			return null;
		}
		UUID uuid = UUID.randomUUID(); // 랜덤 파일명 부여
		String fileName = uuid.toString()+ "_" + file.getOriginalFilename();
		File copyFile = new File("\\\\192.168.10.51\\damoim\\membership\\"+ Integer.toString(code) + "\\" + fileName);
		file.transferTo(copyFile);
		System.out.println("파일1개 추가!");
		return fileName;
	}
	/* 성철
	 * 파일 삭제 메서드 해당유저 프로필사진 변경시 사용!!
	 * 실 사용때는 조건에 만약 보내준 링크가 null이면 변하지 않도록
	 * */ 
	public void fileDelete(String file, int code) throws IllegalStateException, IOException {
		if(file == null) {
			System.out.println("삭제할 파일이 없습니다");
		}
		else {
			System.out.println("삭제될 URL : "  + file);
		File f = new File("\\\\192.168.10.51\\damoim\\membership\\"+ Integer.toString(code) + "\\" + file);
		f.delete();
		
		}
	
	}
	}
