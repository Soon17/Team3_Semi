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
            model.addAttribute("url", "/signup");
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
    
    @PostMapping("/unsubscribe")
    public String unsubscribe(@RequestParam("cl_num") int cl_num, HttpSession session, Model model) {
        MemberVO user = (MemberVO) session.getAttribute("member");
        if (user == null) {
            model.addAttribute("msg", "로그인 후 이용해주세요");
            model.addAttribute("url", "/signup");
            return "message";
        }

        boolean result = subscribeService.deleteSubscribe(user.getMe_num(), cl_num);
        model.addAttribute("msg", result ? "구독 취소 완료" : "구독 취소 실패");
        model.addAttribute("url", "/user/myPage"); // 취소 후 돌아갈 페이지

        return "message";
    }

}