package kr.kh.team3.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.kh.team3.service.MemberService;
import kr.kh.team3.service.MessageService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	MemberService memberService;
	
	@Autowired
	MessageService messageService;
	
	
}
