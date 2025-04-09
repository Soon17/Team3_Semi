package kr.kh.team3.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/class")
public class ClassController {
	
	@GetMapping("/categoryClass")
	public String categoryClass(@RequestParam("ca_name") String ca_name) {
		
		return "/categoryClass";
	}
}
