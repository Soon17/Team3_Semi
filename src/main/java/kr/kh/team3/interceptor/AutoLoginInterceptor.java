package kr.kh.team3.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.service.MemberService;

public class AutoLoginInterceptor extends HandlerInterceptorAdapter{

	@Autowired
	MemberService memberService;
	
	@Override
	public void postHandle(
	    HttpServletRequest request, 
	    HttpServletResponse response, 
	    Object handler, 
	    ModelAndView modelAndView)
	    throws Exception {
		
	}
	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, 
			Object handler)
			throws Exception {
		//세션에 있는 회원 정보를 가져옴
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO)session.getAttribute("member");
		//자동로그인 전에 이미 로그인이 되어 있으면
		if(user != null) {
			return true;
		}
		Cookie cookie = WebUtils.getCookie(request, "T3");
		//LC쿠키가 없으면 => 자동 로그인을 체크한 적이 없으면
		if(cookie == null) {
			return true;
		}
		String cookieId = cookie.getValue();
		user = memberService.getMemberByCookie(cookieId);
		
		if(user != null) {
			session.setAttribute("member", user);
		}
		return true;
	}
}