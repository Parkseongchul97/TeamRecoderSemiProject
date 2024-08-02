package com.damoim.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.damoim.service.MeetingsCommentService;

@Controller
public class MeetingsCommentController {

	@Autowired
	private MeetingsCommentService service;
}
