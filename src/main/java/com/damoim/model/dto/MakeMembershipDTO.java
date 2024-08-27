package com.damoim.model.dto;

import com.damoim.model.vo.LocationCategory;
import com.damoim.model.vo.Membership;
import com.damoim.model.vo.MembershipType;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class MakeMembershipDTO {
	
	private Membership membership;
	private LocationCategory locationCategory;
	private MembershipType membershipType;
}
