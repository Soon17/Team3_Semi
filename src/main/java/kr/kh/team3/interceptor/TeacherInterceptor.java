package kr.kh.team3.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.service.MessageService;

public class TeacherInterceptor extends HandlerInterceptorAdapter{

	@Autowired
	MessageService messageService;
	
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
		MemberVO user = (MemberVO)session.getAttribute("user");
		//회원 정보가 있고 권한이 ADMIN이면 가던길 가고
		if(user != null && user.getMe_authority().equals("TEACHER")) {
			return true;
		}
		messageService.sendMessage(response, request, "강사만 접근할 수 있는 페이지입니다.", "/");
		//아니면 메인 페이지로 보냄
		return false;
	}
}
