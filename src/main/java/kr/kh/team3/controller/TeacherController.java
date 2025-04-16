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
            session.setAttribute("member", user);
        }
        int me_num = user.getMe_num(); // 세션에서 로그인한 유저 번호 가져옴

        Map<String, Object> map = new HashMap<>();
        map.put("tc_intro", content);
        map.put("tc_me_num", me_num);

        teacherService.save(map);
        return "redirect:/teacher/"+me_num;
    }

    @GetMapping("/{tc_me_num}")
    public String myPage(Model model, HttpSession session, @PathVariable int tc_me_num) {
        MemberVO user = (MemberVO) session.getAttribute("member");
        
        // 강사 정보 조회
        TeacherVO teacher = teacherService.selectIntro(tc_me_num);
        
        // 로그인한 유저가 본인인지 판단
        boolean isOwner = (user != null && user.getMe_num() == tc_me_num);

        model.addAttribute("teacher", teacher);      // 강사 정보
        model.addAttribute("member", user);          // 로그인 유저
        model.addAttribute("isOwner", isOwner);      // 본인 여부

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
