package kr.kh.team3.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.kh.team3.model.vo.ClassVO;
import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.service.ClassService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	ClassService classService;
	
	@GetMapping("/requestClass")
	public String requestClass(Model model, HttpSession session) {
		if(session.getAttribute("member") == null) {
			model.addAttribute("url", "/");
			model.addAttribute("msg", "관리자 전용입니다");
			return "message";
		}
		MemberVO member = (MemberVO)session.getAttribute("member");
		if(!member.getMe_authority().equals("ADMIN")) {
			model.addAttribute("url", "/");
			model.addAttribute("msg", "관리자 전용입니다");
			return "message";
		}
		List<ClassVO> list = classService.getClassList();
		model.addAttribute("list",list);
		return"/admin/requestClass";
	}
	
	@PostMapping("/acceptRequest")
	public String acceptRequest(@RequestParam int cl_num) {
		classService.acceptRequest(cl_num);
		return "redirect:/admin/requestClass";
	}
	
	@PostMapping("/rejectRequest")
	public String rejectRequest(@RequestParam int cl_num) {
		classService.rejectRequest(cl_num);
		return "redirect:/admin/requestClass";
	}
	@GetMapping("/detail/{cl_tc_me_num}")
	public String detailCalss(Model model,@PathVariable("cl_tc_me_num") int cl_tc_me_num) {
		ClassVO cl = classService.getClass(cl_tc_me_num);
		System.out.println(cl);
		model.addAttribute("cl",cl);
		return "/admin/detail";
	}
}
