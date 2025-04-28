package kr.kh.team3.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.service.SubscribeService;

@Controller
public class SubscribeController {

    @Autowired
    SubscribeService subscribeService;

    @ResponseBody
    @PostMapping("/subscribe/delete")
    public String deleteSubscribe(@RequestParam("cl_num") int cl_num, HttpSession session) {
        MemberVO user = (MemberVO) session.getAttribute("member");
        if (user == null) return "fail";
        
        boolean result = subscribeService.deleteSubscribe(user.getMe_num(), cl_num);
        return result ? "success" : "fail";
    }
}
