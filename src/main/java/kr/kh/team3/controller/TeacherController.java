package kr.kh.team3.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.model.vo.TeacherVO;
import kr.kh.team3.service.TeacherService;

@Controller
@RequestMapping("/teacher")
public class TeacherController {

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
        return "/teacher/page";
    }

     @GetMapping("/{tc_me_num}")
    public String myPage(Model model, HttpSession session, @PathVariable int tc_me_num) {
        MemberVO user = (MemberVO) session.getAttribute("member");
        
        if (user == null || user.getMe_num() != tc_me_num) {
        	model.addAttribute("teacher",null);
        	return "/teacher/page";
        }
        //티쳐가 만들어져야함 인트로는 "" 하든 널로 하든 if문으로 이미 있으면 안 만듬
        TeacherVO teacher = teacherService.selectIntro(tc_me_num);
        
        model.addAttribute("teacher", teacher);
        model.addAttribute("member", user);
        return "/teacher/page";
    }

    @GetMapping("/{tc_me_num}/post")
    public String updateIntro(Model model, HttpSession session, @PathVariable int tc_me_num) {
    	/*MemberVO user = (MemberVO) session.getAttribute("member");
        String tcId = user.getMe_id();

        TeacherVO teacher = teacherService.selectIntro(tcId);
        String intro = (teacher != null) ? teacher.getTc_intro() : null;
        model.addAttribute("intro", intro);
*/
        return "/teacher/post";
    }
}
