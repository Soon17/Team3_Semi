package kr.kh.team3.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String signupPost(@RequestParam("username") String username,
            @RequestParam("password") String password , Model model) {
		System.out.println(username +" : "+ password);
		
		return "/member/signup";
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
}
