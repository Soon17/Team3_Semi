package kr.kh.team3.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import kr.kh.team3.pagination.MemberCriteria;
import kr.kh.team3.service.MemberService;
import kr.kh.team3.service.MessageService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	ClassService classService;

	@Autowired
	MemberService memberService;
	
	@Autowired
	MessageService messageService;

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
	@GetMapping("/detail/{cl_num}")
	public String detailCalss(Model model,@PathVariable("cl_num") int cl_num) {
		ClassVO cl = classService.getClass(cl_num);
		model.addAttribute("cl",cl);
		return "/admin/detail";
	}
	
	@GetMapping("/list")
	public String memberList(Model model, MemberCriteria cri) {
		List<MemberVO> list = memberService.getMemberList(cri);
		
		model.addAttribute("list", list);
		return "/admin/list";
	}
	
	@PostMapping("/create")
	public String createMemberList(int me_num, HttpServletResponse response, HttpServletRequest request) {
		if(memberService.createMemberList(me_num)) {
			messageService.sendMessage(response, request, "해당 유저의 차단을 해제했습니다.", "/admin/list");
		}else {
			messageService.sendMessage(response, request, "해당 유저의 차단을 해제하지 못했습니다.", "/admin/list");
		}
		return "/admin/list";
	}
	
	@PostMapping("/clear")
	public String clearMemberList(@RequestParam int me_num, HttpServletResponse response, HttpServletRequest request) {
		System.out.println(me_num);
		if(memberService.clearMemberList(me_num)) {
			messageService.sendMessage(response, request, "해당 유저를 차단했습니다.", "/admin/list");
		}else {
			messageService.sendMessage(response, request, "해당 유저를 차단하지 못했습니다.", "/admin/list");
		}
		return "/admin/list";
	}
	
	@GetMapping("/update")
	public String update() {
		return "/admin/update";
	}
}
