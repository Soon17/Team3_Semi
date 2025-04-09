package kr.kh.team3.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.kh.team3.service.MessageService;

@Controller
@RequestMapping("/teacher")
public class TeacherController {

	@Autowired
	MessageService messageService;
	
   @GetMapping("/post")
    public String post() {
        return "/teacher/post"; 
    }
}
