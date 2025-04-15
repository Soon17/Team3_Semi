package kr.kh.team3.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.model.vo.TeacherVO;
import kr.kh.team3.service.TeacherService;

@Controller
@RequestMapping("/teacher")
public class TeacherController {

    @Autowired
    TeacherService teacherService;

    @GetMapping("/{tc_me_num}")
    public String myPage(Model model, HttpSession session, @PathVariable int tc_me_num) {
        MemberVO user = (MemberVO) session.getAttribute("member");
        TeacherVO teacher = teacherService.selectIntro(tc_me_num);
        
        if (user == null || user.getMe_num() != tc_me_num) {
        	model.addAttribute("teacher",teacher);
        	return "/teacher/page";
        }
 
        model.addAttribute("teacher", teacher);
        model.addAttribute("member", user);
        return "/teacher/page";
    }

    @PostMapping("/{tc_me_num}/post")
    public String insertIntroPage(HttpSession session, String intro, @PathVariable int tc_me_num) {
        MemberVO user = (MemberVO) session.getAttribute("member");
        String tcId = user.getMe_id();

        teacherService.insertIntro(tcId, intro);
        return "redirect:/teacher/post";
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
