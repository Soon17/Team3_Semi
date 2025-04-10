package kr.kh.team3.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.service.MessageService;
import kr.kh.team3.service.TeacherService;

@Controller
@RequestMapping("/teacher")
public class TeacherController {

	@Autowired
	MessageService messageService;
	
	@Autowired
	TeacherService teacherService;
	
	@GetMapping("/page")
	public String myPage(Model model, HttpSession session) {
        MemberVO user = (MemberVO) session.getAttribute("member");

        if(user == null || !user.getMe_authority().equals("TEACHER")) {
            return "redirect:/";
        }

        String tcId = user.getMe_id();
        String intro = teacherService.selectIntro(tcId); // 이제 String이 반환됨

        model.addAttribute("intro", intro); // intro를 JSP로 전달

        return "/teacher/page";
    }
	
	@GetMapping("/post")
	public String insertIntro() {
		return "/teacher/post";
	}
	
	@PostMapping("/post")
	public String insertIntroPage(HttpSession session, String intro) {
		MemberVO user = (MemberVO)session.getAttribute("member");
		String tcId = user.getMe_id();
		
		teacherService.insertIntro(tcId, intro);
		return "redirect:/teacher/page";
	}
	
	@GetMapping("/editIntro")
	public String updateIntro(Model model, HttpSession session) {
		MemberVO user = (MemberVO)session.getAttribute("member");
		
		String tcId = user.getMe_id();
		String intro = teacherService.selectIntro(tcId);
		
		model.addAttribute("intro", intro);
		
		return "/teacher/post";
	}
	
	@PostMapping("/editIntro")
	public String updateIntroPage(HttpSession session, String intro) {
		MemberVO user = (MemberVO)session.getAttribute("member");
		String tcId = user.getMe_id();
		
		teacherService.updateIntro(tcId, intro);
		return "redirect:/teacher/page";
	}
}
