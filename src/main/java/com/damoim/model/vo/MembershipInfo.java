package com.damoim.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor
public class MembershipInfo {

	private String accessionText; // 클럽 가입조건
	private String simpleText; //간단한 설명 
	private String mainText; // 클럽 홍보글에 들어가 글
	private String secretText; // 클럽원만 알수있는 정보(비밀정보)

	
	
}
