package kr.kh.team3.interceptor;

import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.http.Cookie;
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
		if(session.getAttribute("member") != null) {
			MemberVO user = (MemberVO)session.getAttribute("member");

			memberService.onlineMember(user);
			timer(session);
			
			if(user == null) {
				return;
			}
			
			if(!user.isAuto()) {
				return;
			}
			Cookie cookie = new Cookie("T3", session.getId());
			cookie.setPath("/");
			int time = 60 * 60 * 24 * 7; //단위 초(7일을 초로 환산)
			cookie.setMaxAge(time);
			//response 객체에 쿠키를 담아서 전송 => 클라이언트에 쿠키가 전송
			response.addCookie(cookie);
			//db에 자동로그인 정보를 저장
			user.setMe_cookie(session.getId());
			//System.currentTimeMillis() : 현재 시간을 밀리초로 반환
			Date date = new Date(System.currentTimeMillis() + time * 1000);
			user.setMe_limit(date);
			memberService.updateCookie(user);
		}
	}
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
