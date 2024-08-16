package com.damoim.model.dto;

import java.sql.Date;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter @Setter 
public class MembershipDTO {

	private String membershipName;
	private String membershipInfo;
	private Date membershipDate;
	private String membershipMax;
	private String id;
	private String listGrade;
	
}
