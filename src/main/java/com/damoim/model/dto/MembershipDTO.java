package com.damoim.model.dto;

import java.sql.Date;

import lombok.Builder;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MembershipDTO {

	private String membershipName;
	private String membershipInfo;//클럽 소개글
	private Date membershipDate;
	private String membershipMax;
	private String membershipAccessionText; //클럽 가입 조건
	private String membershipSimpleText; // 간단한 소개글
	private String membershipSecretText; // 클럽원들간 비밀글
	
	private String id;
	
	private String listGrade;

}
