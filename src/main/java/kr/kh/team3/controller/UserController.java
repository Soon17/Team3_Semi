package kr.kh.team3.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.service.MemberService;
import kr.kh.team3.service.UserService;
import lombok.extern.log4j.Log4j;

@RequestMapping("/user")
@Log4j
@Controller
public class UserController {

	@Autowired
	UserService userService;
	
	@Autowired
	MemberService memberService;

	@GetMapping("/myPage")
	public String myPage(Model model, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("member");
	    List<Map<String, Object>> list = userService.getSubscribeList(user.getMe_num());
	    model.addAttribute("subscribeList", list);
	    return "/user/myPage";
	}
	
	@GetMapping("/loadData")
	public String loadData(@RequestParam("type") String type, Model model, HttpSession session) {
	    // 세션에서 로그인 유저 꺼냄
	    MemberVO user = (MemberVO) session.getAttribute("member");
	    
	    if ("subs".equals(type)) {
	        List<Map<String, Object>> list = userService.getSubscribeList(user.getMe_num());
	        model.addAttribute("subscribeList", list);
	        return "user/subscribe"; // 구독 목록 JSP
	    } else if ("teacher".equals(type)) {
	        return "user/teacher"; // 강사 신청 JSP
	    }else if("update".equals(type)){
	    	return "user/update";
	    }else {
	        return "redirect:/myPage"; 
	    }
	}
	
	@GetMapping("/applyPage")
	public String applyCreator(Model model) {
		model.addAttribute("skipHeader", "true");
		model.addAttribute("skipFooter", "true");
		return "/apply/applyMain";
	}
	
	@GetMapping("/apply/1")
	public String apply1(Model model) {
		model.addAttribute("skipHeader", "true");
		model.addAttribute("skipFooter", "true");
		return "/apply/1";
	}
	
	@PostMapping("/update")
	public String updateUser(Model model, HttpSession session, MultipartFile fileList, MemberVO member) throws IOException {
		MemberVO user = (MemberVO)session.getAttribute("member");
		if(memberService.updateUser(member,user, fileList)) {
			model.addAttribute("url", "/user/myPage");
			model.addAttribute("msg", "회원 정보 수정을 완료했습니다.");
			session.setAttribute("member", user);
		}else {
			model.addAttribute("url", "/user/myPage");
			model.addAttribute("msg", "회원 정보 수정에 실패했습니다.");
		}
		
		return "redirect:/user/myPage";
	}
}