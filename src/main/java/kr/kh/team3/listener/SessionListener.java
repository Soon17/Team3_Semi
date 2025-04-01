package kr.kh.team3.listener;

import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.service.MemberService;

@Component
public class SessionListener implements HttpSessionListener {

    @Autowired
    private MemberService memberService;
    
	@Override
	public void sessionCreated(HttpSessionEvent se) {
//		HttpSession session = se.getSession();
//	    // 세션이 생성될 때 타이머를 설정
//	    Timer timer = new Timer();
//	    timer.schedule(new TimerTask() {
//        @Override
//        public void run() {
//        	// 세션이 만료되기 직전 확인
//            if (session != null && session.getAttribute("member") != null) {
//                MemberVO member = (MemberVO) session.getAttribute("member");
//                if (member != null) {
//                    memberService.offlineMember(member); // 온라인 N 처리
//                    System.out.println("N 처리 완료");
//                }
//            } else {
//                // 세션이 이미 만료된 경우
//                System.out.println("세션이 만료되었습니다.");
//            }
//        }
//	    }, (session.getMaxInactiveInterval() - 10) * 1000); // 세션 만료 10초 전 처리
	}

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
    	HttpSession session = se.getSession();
        MemberVO member = (MemberVO) session.getAttribute("member");
        if(member != null) {
        	memberService.offlineMember(member); // 온라인 N 처리
        }
    }

}
