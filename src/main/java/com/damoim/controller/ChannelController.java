package com.damoim.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.damoim.service.ChannelService;



@Controller
public class ChannelController {

	@Autowired //위와 같음
	private ChannelService service;
	
	
	
	
}
