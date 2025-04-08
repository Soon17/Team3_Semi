package kr.kh.team3.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/member")
@Controller
public class MemberController {

	@GetMapping("/apply")
	public String applyCreator() {
		return "/member/apply";
	}
}
