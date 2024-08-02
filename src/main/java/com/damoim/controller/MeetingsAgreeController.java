package com.damoim.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.damoim.service.MeetingsAgreeService;

@Controller
public class MeetingsAgreeController {

	@Autowired
	private MeetingsAgreeService service;
}
