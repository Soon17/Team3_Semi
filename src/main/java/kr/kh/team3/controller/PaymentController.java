package kr.kh.team3.controller;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.kh.team3.model.vo.ClassVO;
import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.service.ClassService;
import kr.kh.team3.service.SubscribeService;

@Controller
public class PaymentController {

    @Autowired
    private SubscribeService subscribeService;
    
    @Autowired
    private ClassService classService;

    @Value("${imp.code}")
    private String impCode;

    @Value("${imp.api.key}")
    private String apiKey;

    @Value("${imp.api.secretkey}")
    private String secretKey;

    // 결제 페이지 진입
    @GetMapping("/order/payment")
    public String paymentPage(@RequestParam("cl_num") int cl_num, HttpSession session, Model model) {
        MemberVO user = (MemberVO) session.getAttribute("member");
        
        if (user == null) {
            model.addAttribute("msg", "로그인이 필요합니다");
            model.addAttribute("url", "/signup");
            return "message";
        }

        ClassVO classDetail = classService.ClassDetail(cl_num); // 있으면 이렇게 클래스 정보도

        model.addAttribute("impCode", impCode);
        model.addAttribute("cl_num", cl_num);
        model.addAttribute("classTitle", classDetail.getCl_title());
        model.addAttribute("classPrice", classDetail.getCl_money());
        model.addAttribute("userEmail", user.getMe_email());
        model.addAttribute("userName", user.getMe_name());
        model.addAttribute("userTel", user.getMe_number());

        return "payment";
    }

    // 결제 완료 처리
    @GetMapping("/order/payComplete")
    public String payComplete(@RequestParam("imp_uid") String impUid,
                              @RequestParam("merchant_uid") String merchantUid,
                              @RequestParam("cl_num") int cl_num,
                              HttpSession session,
                              Model model) throws Exception {

        MemberVO user = (MemberVO) session.getAttribute("member");
        if (user == null) {
            model.addAttribute("msg", "로그인이 필요합니다");
            model.addAttribute("url", "/signup");
            return "message";
        }

        // 아임포트 토큰 발급
        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        JSONObject body = new JSONObject();
        body.put("imp_key", apiKey);
        body.put("imp_secret", secretKey);

        HttpEntity<String> tokenRequest = new HttpEntity<>(body.toString(), headers);
        ResponseEntity<String> tokenResponse = restTemplate.postForEntity(
            "https://api.iamport.kr/users/getToken", tokenRequest, String.class
        );

        String accessToken = new ObjectMapper()
            .readTree(tokenResponse.getBody())
            .get("response")
            .get("access_token")
            .asText();

        // 결제 정보 조회
        HttpHeaders authHeaders = new HttpHeaders();
        authHeaders.set("Authorization", accessToken);

        HttpEntity<?> paymentRequest = new HttpEntity<>(authHeaders);
        ResponseEntity<String> paymentResponse = restTemplate.exchange(
            "https://api.iamport.kr/payments/" + impUid,
            HttpMethod.GET,
            paymentRequest,
            String.class
        );

        JsonNode paymentInfo = new ObjectMapper().readTree(paymentResponse.getBody());
        String status = paymentInfo.get("response").get("status").asText();

        if ("paid".equals(status)) {
            boolean result = subscribeService.subscribe(user.getMe_num(), cl_num);

            if (result) {
                subscribeService.createDeleteEvent(user.getMe_num(), cl_num);
                return "redirect:/class/" + cl_num;
            } else {
                model.addAttribute("msg", "구독 실패");
                model.addAttribute("url", "/class/" + cl_num);
                return "message";
            }
        } else {
            model.addAttribute("msg", "결제가 완료되지 않았습니다");
            model.addAttribute("url", "/class/" + cl_num);
            return "message";
        }
    }
}