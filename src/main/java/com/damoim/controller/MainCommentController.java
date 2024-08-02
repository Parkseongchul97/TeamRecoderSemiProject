package com.damoim.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.damoim.service.MainCommentService;

@Controller
public class MainCommentController {

	@Autowired
	private MainCommentService service;
	
}
