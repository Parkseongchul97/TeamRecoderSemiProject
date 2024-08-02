package com.damoim.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.damoim.service.MembershipUserListService;

@Controller
public class MembershipUserListController {

	@Autowired
	private MembershipUserListService service;
}
