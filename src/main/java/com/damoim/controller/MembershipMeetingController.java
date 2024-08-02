package com.damoim.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.damoim.service.MembershipMeetingService;

@Controller
public class MembershipMeetingController {

	@Autowired
	private MembershipMeetingService service;
}
