package com.damoim.controller;
import java.util.ArrayList;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.damoim.model.vo.Membership;

import com.damoim.model.dto.CommentDTO;
import com.damoim.model.dto.MemberListDTO;
import com.damoim.model.dto.MembershipDTO;
import com.damoim.service.MainCommentService;
import com.damoim.service.MembershipService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import com.damoim.model.vo.MainComment;
import com.damoim.model.vo.Member;
import com.damoim.model.vo.MembershipUserList;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class MembershipController {
	// 클럽 생성 관련 컨트롤 


	@Autowired
	private MembershipService service;
	
	@Autowired
	private MainCommentService commentService;
	/*
	 * 성일
	 * 카운트 관련  VO에 합쳐버림
	 * 
	 * */

		
	@GetMapping("/{membershipCode}") // 클럽 홍보 페이지 각각 맞춰 갈수있는거
	public String main(@PathVariable("membershipCode") Integer membershipCode, MemberListDTO memberListDTO, Model model
			) {
		// 홍보페이지에 membership 관련 정보 + 호스트 정보
		MembershipUserList list =  service.main(membershipCode);
		list.setCount((service.membershipUserCount(membershipCode)));
		
		
		model.addAttribute("main", list);			
		
		ArrayList<MainComment> commList = commentService.allMainComment(membershipCode); // 일반댓글
		ArrayList<CommentDTO> dtoList = new ArrayList<CommentDTO>(); //합칠예정
		for (int i = 0; i < commList.size(); i++) {
		    CommentDTO commentDTO = new CommentDTO().builder()
		            .mainCommentCode(commList.get(i).getMainCommentCode())
		            .mainCommentText(commList.get(i).getMainCommentText())
		            .mainCommentDate(commList.get(i).getMainCommentDate())
		            .nickname(commList.get(i).getMember().getNickname())
		            .memberImg(commList.get(i).getMember().getMemberImg())
		            .membershipCode(commList.get(i).getMembershipCode())
		            .recoment(new ArrayList<>())
		            .build();
		   
		    dtoList.add(commentDTO);
		    ArrayList<MainComment> recommList = commentService.mainReComment(membershipCode, commentDTO.getMainCommentCode());
		    // 모든 댓글에 대댓글이 달리는 상황 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 수정요망
		    if(recommList.size()> 0) {
		    for (int j = 0; j < recommList.size(); j++) {
		        CommentDTO recommentDTO = new CommentDTO().builder()
		                .mainCommentCode(recommList.get(j).getMainCommentCode())
		                .mainCommentText(recommList.get(j).getMainCommentText())
		                .mainCommentDate(recommList.get(j).getMainCommentDate())
		                .nickname(recommList.get(j).getMember().getNickname())
		                .memberImg(recommList.get(j).getMember().getMemberImg())
		                .membershipCode(recommList.get(j).getMembershipCode())
		                .mainParentsCommentCode(commList.get(i).getMainCommentCode())
		                .build();
		       
		    
		        commentDTO.getRecoment().add(recommentDTO);
		    }
		}
		}
		System.out.println(dtoList);
		model.addAttribute("comment", dtoList);
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
		
		 	model.addAttribute("main"/*,MS*/);
		 	// 현재 가입된 인원수
			model.addAttribute("membershipUserCount", service.membershipUserCount(membershipCode));
			// 로그인된 회원 정보		
			// 해당클럽 정보 다담음
		 	MembershipUserList list =  service.main(membershipCode);
			list.setCount((service.membershipUserCount(membershipCode)));	
			model.addAttribute("main", list);
			// 해당클럽에 가입신청된 모든 유저정보		
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
	 * Info등 생성 기능 추가
	 *
	 * 성철
	 * 만들어진거에 사진첨부만 추가
	 * */
	@PostMapping("/makeMembership") // 클럽 생성
	public String makeMembership(MembershipDTO dto, MultipartFile file) throws Exception {
		Membership membership = Membership.builder()
				.membershipName(dto.getMembershipName())
				.memershipAccessionText(dto.getMemershipAccessionText())
				.memershipSimpleText(dto.getMemershipSimpleText())
				.memershipSecretText(dto.getMemershipSecretText())
				.membershipMax(Integer.parseInt(dto.getMembershipMax())	
						).build();
		// 클럽생성?
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		  Member mem = (Member) authentication.getPrincipal();
		    System.out.println(mem);
		service.makeMembership(membership);
		Path directoryPath = Paths.get("\\\\\\\\192.168.10.51\\\\damoim\\\\membership\\"+ Integer.toString(membership.getMembershipCode())+"\\");  
		Files.createDirectories(directoryPath);
		Membership m = Membership.builder()
					.membershipCode(membership.getMembershipCode())
					.membershipImg(fileUpload(file, membership.getMembershipCode()))
					.build();
		service.membershipImg(m);
		MemberListDTO list = new MemberListDTO();
				list.setId(mem.getId());
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
		

 		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Member mem =  (Member)authentication.getPrincipal();
		ArrayList<MemberListDTO> list =  (ArrayList<MemberListDTO>) mem.getMemberListDTO();
		list.add(member);
		SecurityContextHolder.getContext().setAuthentication(authentication);

		
		return "redirect:/" + member.getMembershipCode();
	}
	

	
//	@PostMapping("/updateMembership")
//	public void updateMembership(HttpServletRequest request, Membership vo) {
//		System.out.println(vo);
//		
//		
//		
//		
//		
//		
//		
//	}
	

	
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
	
	/*
	 * 영민 클럽명 중복 체크
	 * 
	 * */
	@ResponseBody
	@PostMapping("/membershipNameCheck")
	public boolean membershipNameCheck(Membership membership) {
		return service.membershipNameCheck(membership) == null;
	}
	/*
	 * 영민 클럽 정보 업데이트 기능
	 * 
	 * 
	 * 
	 * 
	 * */

//	@PostMapping("/updateMembership")
//		public String updateMembership(Membership membership,MembershipDTO dto) throws IOException {
//		membership.getFile();
//		membership.setMembershipImg(null);
//		System.out.println(membership);
//		service.updateMembership(membership);
//		Path directoryPath = Paths.get("\\\\\\\\192.168.10.51\\\\damoim\\\\membership\\"+ Integer.toString(membership.getMembershipCode())+"\\");  
//		Files.createDirectories(directoryPath);
//		Membership m = Membership.builder()
//					.membershipCode(membership.getMembershipCode())
//					.membershipImg(fileUpload(membership.getFile(), membership.getMembershipCode()))
//					.build();
//		service.membershipImg(m);
//		MemberListDTO list = new MemberListDTO();
//				list.setId(dto.getId());
//				list.setListGrade(dto.getListGrade());
//				list.setMembershipCode(membership.getMembershipCode());
//		// 호스트로 보유중인 클럽 유무 확인
//		service.host(list);
//		
//		
////	Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
////	Membership membership = (Membership) authentication.getPrincipal();
//		return "redirect:/myMembership";
//		
//	}
	

	
	
	}
