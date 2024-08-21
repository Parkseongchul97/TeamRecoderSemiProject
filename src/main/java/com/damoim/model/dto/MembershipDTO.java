package com.damoim.model.dto;

import java.sql.Date;

import lombok.Builder;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter 
public class MembershipDTO {

	private String membershipName;
	private String membershipInfo;//클럽 소개글
	private Date membershipDate;
	private String membershipMax;
	private String memershipAccessionText; //클럽 가입 조건
	private String memershipSimpleText; // 간단한 소개글
	private String memershipSecretText; // 클럽원들간 비밀글
	
	private String id;
	
	private String listGrade;
	
	
}
