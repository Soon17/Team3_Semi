package kr.kh.team3.controller;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

@Controller
public class KakaoLoginController {

	@GetMapping("/login")
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code) {
	    if(code == null) {
	        // 인가 코드가 없으면 로그인 폼을 보여주거나 처리
	        return "/member/login"; // 로그인 페이지 뷰
	    }
	    System.out.println("받은 인가 코드: " + code);
	    // 토큰 요청 로직 추가

        // 토큰 요청
        RestTemplate restTemplate = new RestTemplate();

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("grant_type", "authorization_code");
        params.add("client_id", "a209846bb41627e1da96872fa6fd97b8");
        params.add("redirect_uri", "http://localhost:8080/spring/login");
        params.add("code", code);

        HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(params, headers);
        ResponseEntity<String> response = restTemplate.postForEntity(
            "https://kauth.kakao.com/oauth/token",
            request,
            String.class
        );

        // 콘솔에 응답 전체 출력
        System.out.println("카카오 토큰 응답 : " + response.getBody());

        return "redirect:/"; // 일단 홈으로 리다이렉트
    }
}