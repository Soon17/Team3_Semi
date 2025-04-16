package kr.kh.team3.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@RequestMapping("/apply")
@Log4j
@Controller
public class ApplyController {
	
	@GetMapping("/1")
	public String apply1(Model model) {
		model.addAttribute("skipHeader", "true");
		model.addAttribute("skipFooter", "true");
		return "/apply/1";
	}
}