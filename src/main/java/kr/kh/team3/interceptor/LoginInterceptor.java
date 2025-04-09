package kr.kh.team3.interceptor;

import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.service.MemberService;

public class LoginInterceptor extends HandlerInterceptorAdapter{

	@Autowired
	private MemberService memberService;
	
	public void postHandle(
	    HttpServletRequest request, 
	    HttpServletResponse response, 
	    Object handler, 
	    ModelAndView modelAndView)
	    throws Exception {
		//컨트롤러가 보내준 회원 정보를 가져옴
		//가져온 회원 정보가 있으면 세션에 회원 정보를 저장
		HttpSession session = request.getSession();
		System.out.println((MemberVO)session.getAttribute("member"));
		if(session.getAttribute("member") != null) {
			MemberVO user = (MemberVO)session.getAttribute("member");
			memberService.onlineMember(user);
			timer(session);
		}
	}
	//
	private void timer(HttpSession session) {
		
		Timer timer =  new Timer();
	    timer.schedule(new TimerTask() {
	    	
	        public void run() {
	        	// 세션이 만료되기 직전 확인
	        	
	        	MemberVO member = (MemberVO) session.getAttribute("member");
	            if (session != null && member != null) {
                    memberService.offlineMember(member); // 온라인 N 처리
                    System.out.println("N 처리 완료");
                
	            } else {
	                // 세션이 이미 만료된 경우
	                System.out.println("세션이 만료되었습니다.");
	            }
	        }
	    }, (session.getMaxInactiveInterval() - 4) * 1000);
	}
}
