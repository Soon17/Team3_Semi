package kr.kh.team3.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.http.HttpSession;
import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.service.MemberService;

@Controller
public class KakaoLoginController {
	
	@Autowired
    private MemberService memberService;
	
    @Value("${kakao.client-id}")
    private String clientId;

    @Value("${kakao.redirect-uri}")
    private String redirectUri;

    // 로그인 시작
    @GetMapping("/kakao/login")
    public String kakaoLoginRedirect() {
        String kakaoUrl = "https://kauth.kakao.com/oauth/authorize" +
                "?client_id=" + clientId +
                "&redirect_uri=" + redirectUri +
                "&response_type=code";
        return "redirect:" + kakaoUrl;
    }

    // 인가코드 받고 토큰 요청
    @GetMapping("/kakao/auth")
    public String kakaoLogin(@RequestParam("code") String code, HttpSession session)throws Exception {
       
        RestTemplate restTemplate = new RestTemplate();

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("grant_type", "authorization_code");
        params.add("client_id", clientId);
        params.add("redirect_uri", redirectUri);
        params.add("code", code);

        HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(params, headers);
        ResponseEntity<String> response = restTemplate.postForEntity(
                "https://kauth.kakao.com/oauth/token",
                request,
                String.class
        );

        ObjectMapper mapper = new ObjectMapper();
        JsonNode tokenJson = mapper.readTree(response.getBody());
        String accessToken = tokenJson.get("access_token").asText();

        // 2. 사용자 정보 요청
        HttpHeaders userHeaders = new HttpHeaders();
        userHeaders.set("Authorization", "Bearer " + accessToken);

        HttpEntity<String> userRequest = new HttpEntity<>(userHeaders);

        ResponseEntity<String> userResponse = restTemplate.exchange(
            "https://kapi.kakao.com/v2/user/me",
            HttpMethod.GET,
            userRequest,
            String.class
        );

        JsonNode userJson = mapper.readTree(userResponse.getBody());
        String meid = userJson.get("id").asText();//아이디
        String menick = userJson.get("kakao_account").get("profile").get("nickname").asText();//닉게임
        String meemail = userJson.get("kakao_account").get("email").asText();//이메일
        String meprofile = userJson.get("kakao_account").get("profile").get("profile_image_url").asText(); // 프로필 사진
        String mename = userJson.get("kakao_account").get("name").asText(); // 실명
        String mephone = userJson.get("kakao_account").get("phone_number").asText(); // 전화번호

        // 3. 세션 저장
        MemberVO member = memberService.getMemberId(meid);
       
        if (member == null) {
        	
	        member = new MemberVO();
	        member.setMe_id(meid);
	        member.setMe_nick(menick);
	        member.setMe_email(meemail);
	        member.setMe_profile(meprofile);    
	        member.setMe_name(mename);      
	        member.setMe_number(mephone); 
	        member.setMe_authority(mephone);
	        
	        member.setMe_pw("kakao"); //not null이라 넣음
        
            memberService.insertMember(member);         
        } 
        memberService.onlineMember(member);
        session.setAttribute("member", member);
        
	    // 로그인될 때 타이머를 설정
	    Timer timer = new Timer();
	    timer.schedule(new TimerTask() {
	    	
        public void run() {
        	// 세션이 만료되기 직전 확인
            if (session != null && session.getAttribute("member") != null) {
                MemberVO member = (MemberVO) session.getAttribute("member");
                if (member != null) {
                    memberService.offlineMember(member); // 온라인 N 처리
                    System.out.println("N 처리 완료");
                }
            } else {
                // 세션이 이미 만료된 경우
                System.out.println("세션이 만료되었습니다.");
            }
        }
	    }, (session.getMaxInactiveInterval() - 1) * 1000); // 세션 만료 10초 전 처리
        return "redirect:/"; // 홈으로 이동
    }
}