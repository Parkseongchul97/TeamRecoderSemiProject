package com.damoim.controller;




import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.damoim.model.vo.MembershipUserList;


import com.damoim.service.MembershipUserListService;

@Controller
public class MembershipUserListController {

	@Autowired
	private MembershipUserListService service;
	
	
	
}










