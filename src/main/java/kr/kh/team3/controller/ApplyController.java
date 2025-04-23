package kr.kh.team3.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.kh.team3.model.vo.CategoryVO;
import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.service.CategoryService;
import kr.kh.team3.service.RequestService;
import kr.kh.team3.service.UserService;
import lombok.extern.log4j.Log4j;

@RequestMapping("/apply")
@Log4j
@Controller
public class ApplyController {
	
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	RequestService requestService;
	
	@GetMapping("/applyPage")
	public String applyCreator(Model model) {
		model.addAttribute("skipHeader", "true");
		model.addAttribute("skipFooter", "true");
		return "/apply/applyMain";
	}
	
	@GetMapping("/0")
	public String apply0(Model model) {
		model.addAttribute("skipHeader", "true");
		model.addAttribute("skipFooter", "true");
		return "/apply/0";
	}
	
	@GetMapping("/1")
	public String apply1(Model model) {
		model.addAttribute("skipHeader", "true");
		model.addAttribute("skipFooter", "true");
		return "/apply/1";
	}
	
	@GetMapping("/2")
	public String apply2(Model model) {
		model.addAttribute("skipHeader", "true");
		model.addAttribute("skipFooter", "true");
		return "/apply/2";
	}
	
	@PostMapping("/submit")
	@ResponseBody
	public boolean applySubmit(@RequestParam("content") String content, HttpSession session) {
		
		MemberVO user = (MemberVO)session.getAttribute("member");
	    // 받은 content를 활용하여 저장
	    boolean result = requestService.insertRequest(content, user);

	    return result;
	}
	
	@PostMapping("/check")
	@ResponseBody
	public boolean apllyCheck(HttpSession session) {
		
		MemberVO user = (MemberVO)session.getAttribute("member");
	    // 받은 content를 활용하여 저장
	    boolean result = requestService.isNewRequest(user);
	    System.out.println(result);

	    return result;
	}
}