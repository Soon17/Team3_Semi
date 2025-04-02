package kr.kh.team3.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.kh.team3.model.vo.CategoryVO;
import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.service.CategoryService;
import kr.kh.team3.service.MemberService;
import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Log4j
@Controller
public class HomeController {
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/")
	public String home(Model model) {
		List<CategoryVO> categoryList = categoryService.selectCateList();
		model.addAttribute("list",categoryList);
		return "home";
	}
	@GetMapping("/signup")
	public String signup(Model model) {
		List<CategoryVO> categoryList = categoryService.selectCateList();
		model.addAttribute("list",categoryList);
		return "/member/signup";
	}
	@PostMapping("/signup")
	public String signup(Model model,MemberVO member) {
		if(memberService.insertSingup(member)) {
			model.addAttribute("url", "/signup");
			model.addAttribute("msg", "회원 가입에 성공했습니다.");
		}else {
			model.addAttribute("url", "/signup");
			model.addAttribute("msg", "회원 가입에 실패했습니다.");
		}
		return "message";
	}
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("member");

	    if (member != null) {
	    	memberService.offlineMember(member); // 온라인N으로 변경
	    }

	    session.removeAttribute("member"); // 세션 제거
	    return "redirect:/"; // 홈으로 이동
	}
	
	
	@PostMapping("/login")
	public String loginPost(Model model, MemberVO member, HttpSession session) {
		MemberVO user = memberService.login(member);
		
		model.addAttribute("user", user);
		if(user == null) {
			return "redirect:/signup";
		}
		session.setAttribute("member", user);
		return "redirect:/";
	}

	
	
	@ResponseBody
	@PostMapping("/check/id")
	public boolean checkId(@RequestParam("id") String id){
		if(memberService.checkId(id)) {
			System.out.println("가능한 아이디");
			return memberService.checkId(id);
		}
		System.out.println("아이디 중복");
		return memberService.checkId(id);
	}
	
	
}
