package com.damoim.model.dto;

import com.damoim.model.vo.Membership;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class MemberListDTO { // 로그인 세션에 저장해둘 클럽정보
	
		
	    private int membershipCode; // 코드
	    private String id; // 아이디
	    private String listGrade; // 등급
		
	}

