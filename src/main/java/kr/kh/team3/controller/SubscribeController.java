package kr.kh.team3.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.service.SubscribeService;

@Controller
public class SubscribeController {

    @Autowired
    private SubscribeService subscribeService;

    @PostMapping("/subscribe")
    public String subscribe(@RequestParam("cl_num") int cl_num, HttpSession session, Model model) {
        MemberVO user = (MemberVO) session.getAttribute("member");
        if (user == null) {
            model.addAttribute("msg", "로그인이 필요합니다");
            model.addAttribute("url", "/member/login");
            return "message";
        }

        boolean result = subscribeService.subscribe(user.getMe_num(), cl_num);
        if (result) {
            return "redirect:/class/" + cl_num;
        } else {
            model.addAttribute("msg", "구독 실패");
            model.addAttribute("url", "/class/" + cl_num);
            return "message";
        }
    }
}