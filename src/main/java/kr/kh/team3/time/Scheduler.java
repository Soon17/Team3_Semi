package kr.kh.team3.time;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kr.kh.team3.service.SubscribeService;

@Component
public class Scheduler {

    @Autowired
    private SubscribeService subscribeService;

    // 2분마다 실행
    @Scheduled(fixedRate = 1000 * 60 * 1)
    public void deleteExpiredSubscriptions() {
        System.out.println("[정기결제 만료 구독 삭제 스케줄러 실행]");
        subscribeService.deleteSubscribe(); // 이 메서드에서 delete 실행
    }
}
