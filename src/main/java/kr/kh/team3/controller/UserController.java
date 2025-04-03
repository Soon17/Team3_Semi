package kr.kh.team3.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.service.UserService;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class UserController {
	
	@Autowired
	UserService userService;
	
	@GetMapping("/myPage")
	public String myPage(Model model, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("member");
		System.out.println(user);
	    List<Map<String, Object>> list = userService.getSubscribeList(user.getMe_num());
	    model.addAttribute("subscribeList", list);
	    return "/member/myPage";
	}
}
