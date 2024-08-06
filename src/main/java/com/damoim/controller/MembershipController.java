package com.damoim.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.damoim.model.vo.Membership;
import org.springframework.web.bind.annotation.PostMapping;

import com.damoim.model.dto.MemberListDTO;
import com.damoim.service.MembershipService;

@Controller
public class MembershipController {
	// 클럽 생성 관련 컨트롤 
	@Autowired
	private MembershipService membershipservice;

	 @GetMapping("/")
 	public String index(Model model) {
		model.addAttribute("allClub",membershipservice.allClub());
		 return "index";
 		
 	
 	}
	
	@GetMapping("/createclub")
	public String createclub(){
		return "mypage/createclub";
		
	}
	
	@PostMapping("/createclub")
	public String createclub(Membership membership) {
		membershipservice.createclub(membership); // 클럽 생성 로직 호출
     return "redirect:/"; // 클럽 생성 후 인덱스 페이지로 리다이렉션
     
   
    
     
     
}	
	}
	@Autowired MembershipService service;
	
	@PostMapping("/membershipApply")
	public String membershipApply(MemberListDTO member) {
		
		return "redirect:/";	
	}
}
