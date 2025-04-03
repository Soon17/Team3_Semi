package kr.kh.team3.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.pagination.MemberCriteria;
import kr.kh.team3.service.MemberService;
import kr.kh.team3.service.MessageService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	MemberService memberService;
	
	@Autowired
	MessageService messageService;
	
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
		return "redirect:/admin/list";
	}
}
