package com.damoim.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.damoim.model.vo.Membership;

import mapper.MemberMapper;
import mapper.MembershipMapper;

@Service
public class MembershipService {

	@Autowired
	private MembershipMapper mapper;
	
	public void createclub(Membership membership) {
		mapper.createclub(membership);
	}

	public List<Membership> allClub() {
		
		return mapper.allClub();
	}
	
	
}
