package kr.kh.team3.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
    @GetMapping("/post")
    public String post() {
    	return "/teacher/post"; 
    }
   
    @PostMapping("/savePost")
    public String savePost(@RequestParam("content") String content, HttpSession session) {
        MemberVO user = (MemberVO) session.getAttribute("member");
        
        if (user == null) {
            user = new MemberVO();
            user.setMe_num(1); // 테스트할 때 쓰고 싶은 회원 번호 적으면 됨
            session.setAttribute("member", user);
        }
        int me_num = user.getMe_num(); // 세션에서 로그인한 유저 번호 가져옴

        Map<String, Object> map = new HashMap<>();
        map.put("tc_intro", content);
        map.put("tc_me_num", me_num);

        teacherService.save(map);
        return "redirect:/";
    }
}
