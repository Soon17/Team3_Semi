package kr.kh.team3.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.kh.team3.service.MessageService;

@Controller
public class TeacherController {

	@Autowired
	MessageService messageService;
}
