package kr.kh.team3.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.kh.team3.model.vo.CategoryVO;
import kr.kh.team3.model.vo.ClassVO;
import kr.kh.team3.model.vo.CurriculumVO;
import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.model.vo.SubCategoryVO;
import kr.kh.team3.model.vo.TeacherVO;
import kr.kh.team3.model.vo.VideoVO;
import kr.kh.team3.service.CategoryService;
import kr.kh.team3.service.ClassService;
import kr.kh.team3.service.CurriculumService;
import kr.kh.team3.service.SubCategoryService;
import kr.kh.team3.service.SubscribeService;
import kr.kh.team3.service.TeacherService;

@Controller
@RequestMapping("/class")
public class ClassController {
	@Autowired
	ClassService classService;
	
	@Autowired
	CurriculumService curriculumService;
	
	@Autowired
	SubscribeService subscribeService;
	
	@Autowired
	CategoryService categoryService;

	@Autowired
	TeacherService teacherService;

	@Autowired
	SubCategoryService subcategoryService;

	@Resource
	String uploadPath;
	
	@GetMapping("/categoryClass")
	public String categoryClass(Model model,@RequestParam("ca_num") int ca_num) {
		System.out.println(ca_num);
		List<ClassVO> list = classService.getCaClassList(ca_num);
		
		model.addAttribute("list",list);
		return "/categoryClass";
	}
	
	@GetMapping("/{num}")
	public String classDetail(@PathVariable("num") int cl_num, HttpSession session, Model model) {
		ClassVO classDetail = classService.ClassDetail(cl_num);
	    model.addAttribute("classDetail", classDetail);
	    
	    // 구독 여부 확인
	    MemberVO user = (MemberVO) session.getAttribute("member");
	    boolean checkSubscribed = false;
	    if (user != null) {
	        checkSubscribed = subscribeService.checkSubscribed(user.getMe_num(), cl_num);
	    }
	    model.addAttribute("checkSubscribed", checkSubscribed);

	    // 구독 수
	    int subscribeCount = subscribeService.countSubscribe(cl_num);
	    model.addAttribute("subscribeCount", subscribeCount);

	    return "/class/classDetail";
	}
	
	@ResponseBody
	@GetMapping("/{num}/tab")
	public Map<String, Object> getTabData(@PathVariable("num") int cl_num, @RequestParam String type) {
	    Map<String, Object> result = new HashMap<>();
	    ClassVO detail = classService.ClassDetail(cl_num); // 디테일 하나로 통일

	    switch (type) {
	        case "intro":
	            result.put("intro", detail.getCl_intro());
	            break;
	        case "item":
	            result.put("item", detail.getCl_item());
	            break;
	        case "curriculum":
	            result.put("curriculum", curriculumService.getCurriculum(cl_num));
	            break;
	        default:
	            result.put("error", "잘못된 요청입니다.");
	    }

	    return result;
	}
	

	@GetMapping("/insert/{me_num}")
	public String insert(Model model,@PathVariable("me_num")int me_num) {
		//강사페이지가 없을 경우
		TeacherVO teacher = teacherService.selectIntro(me_num);
		if(teacher == null) {
			model.addAttribute("url", "/");
			model.addAttribute("msg", "강사페이지부터 작성해주세요");
			return"message";
		}
		//이미 요청중인 클래스가 있다면 작성 못함
		ClassVO cl = classService.checkRequest(me_num);
		if(cl!=null) {
			model.addAttribute("url", "/");
			model.addAttribute("msg", "이미 요청 중인 클래스가 있습니다");
			return"message";
		}
		//작성 페이지로
		List<CategoryVO> categoryList = categoryService.selectCateList();
		model.addAttribute("me_num",me_num);
		model.addAttribute("list",categoryList);
		return "/class/insert";
	}
	
	@PostMapping("/insert/{me_num}")
  public String insertPost(Model model,
							@PathVariable("me_num")int me_num,
							@ModelAttribute ClassVO cl,SubCategoryVO sc, 
							MultipartFile file) throws IOException {
		cl.setCl_tc_me_num(me_num);
		for (CurriculumVO cur : cl.getList()) {
		    System.out.println("커리큘럼: " + cur.getCr_title());
		    for (VideoVO v : cur.getList()) {
		        System.out.println("- 영상 제목: " + v.getVd_name());
		        System.out.println("- 파일 이름: " + v.getVd_file().getOriginalFilename());
		    }
		}
		if(classService.insertClass(cl,me_num,sc,file)) {
			model.addAttribute("url", "/");
			model.addAttribute("msg", "제출 완료");
			return"message";
		}
		return "/class/insert";
	}

	@GetMapping("/subcategoryList")
	public String subcategoryList(Model model,@RequestParam("ca_num") int ca_num) {
		List<SubCategoryVO> list = subcategoryService.getScNameList(ca_num);
		model.addAttribute("list",list);
		return "/subcategoryList";
	}
}