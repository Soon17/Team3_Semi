package kr.kh.team3.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.kh.team3.model.vo.CategoryVO;
import kr.kh.team3.model.vo.ClassVO;
import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.model.vo.SubCategoryVO;
import kr.kh.team3.service.CategoryService;
import kr.kh.team3.service.ClassService;
import kr.kh.team3.service.MemberService;
import kr.kh.team3.service.RequestService;
import kr.kh.team3.service.SearchService;
import kr.kh.team3.service.SubCategoryService;
import lombok.extern.log4j.Log4j;


@Log4j
@Controller
public class HomeController {
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private ClassService classService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private SubCategoryService subCategoryService;
	
	@Autowired
	private SearchService searchService;
	
	@Autowired
	RequestService requestService;
	
	
	@GetMapping("/")
	public String home(Model model) {
		List<CategoryVO> categoryList = categoryService.selectCateList();
		List<ClassVO> latestClassList = classService.getLatestClassList();
		List<ClassVO> mostClassList = classService.getMostClassList();
		
		model.addAttribute("list",categoryList);
		model.addAttribute("latestClassList",latestClassList);
		model.addAttribute("mostClassList",mostClassList);
		return "home";
	}
	
	@GetMapping("/signup")
	public String signup(Model model) {
		
		return "/member/signup";
	}
	
	@PostMapping("/signup")
	public String signup(Model model,
            MultipartFile profileImage,
            MemberVO member,
            HttpSession session) throws IOException {

		if(memberService.insertSingup(member, profileImage)) {
			model.addAttribute("url", "/signup");
			model.addAttribute("msg", "회원 가입에 성공했습니다.");
		}else {
			model.addAttribute("url", "/signup");
			model.addAttribute("msg", "회원 가입에 실패했습니다.");
		}
		return "message";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("member");
	    if (member != null) {
	    	memberService.offlineMember(member); // 온라인N으로 변경
	    }
	    session.removeAttribute("member"); // 세션 제거
	    if(member != null) {
	    	member.setMe_cookie(null);
			memberService.updateCookie(member);
		}
	    return "redirect:/"; // 홈으로 이동
	}
	
	@PostMapping("/login")
	public String loginPost(Model model, MemberVO member, HttpSession session) {
		MemberVO user = memberService.login(member);
		
		if(user == null) {
			return "redirect:/signup";
		}
		if(user.getMe_del().equals("Y")) {
			model.addAttribute("url", "/");
			model.addAttribute("msg", "차단된 유저입니다.");
			return "message";
		}
		user.setAuto(member.isAuto());
		
		model.addAttribute("user", user);
		session.setAttribute("member", user);
		memberService.onlineMember(user);
        return "redirect:/"; // 홈으로 이동
     
	}


	@ResponseBody
	@PostMapping("/check/id")
	public boolean checkId(@RequestParam("id") String id){
		if(memberService.checkId(id)) {
			return memberService.checkId(id);
		}
		return memberService.checkId(id);
	}
	
	
	@GetMapping("/teachers")
	public String showTeachers() {
		return "/member/teachers";
	}
	
	@PostMapping("/categoryList")
	public String categoryList(Model model) {
		List<CategoryVO> categoryList = categoryService.selectCateList();
		model.addAttribute("list",categoryList);
		return "/categorylist";
	}
	
	@GetMapping("/category/{ca_num}")
	public String categoryPage(@PathVariable int ca_num, Model model) {
	    CategoryVO category = categoryService.getCategoryNum(ca_num);
	    model.addAttribute("ca_num", ca_num);
	    model.addAttribute("ca_name", category.getCa_name());
	    return "/category/category"; // 메인 화면 + 빈 영역
	}

	@ResponseBody
	@GetMapping("/category/data/{ca_num}")
	public Map<String, Object> getCategoryData(@PathVariable int ca_num) {
	    List<SubCategoryVO> subList = subCategoryService.getSubListCaNum(ca_num);
	    List<ClassVO> classList = classService.getClassListCaNum(ca_num);
	   
	    Map<String, Object> map = new HashMap<>();
	    map.put("subList", subList);
	    map.put("classList", classList);
	    return map;
	}
	
	@PostMapping("/noticeBell")
	public String noticeBell(Model model) {
		int waitingRequestCount = requestService.getWaitingCount();
		model.addAttribute("waitingRequestCount", waitingRequestCount);
		int waitingClassCount = classService.getWaitingCount();
		model.addAttribute("waitingClassCount", waitingClassCount);
		return "/noticeBell";
	}
}
