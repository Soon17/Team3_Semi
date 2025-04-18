package kr.kh.team3.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.kh.team3.model.vo.CategoryVO;
import kr.kh.team3.model.vo.ClassVO;
import kr.kh.team3.model.vo.SubCategoryVO;
import kr.kh.team3.model.vo.TeacherVO;
import kr.kh.team3.service.CategoryService;
import kr.kh.team3.service.ClassService;
import kr.kh.team3.service.SubCategoryService;
import kr.kh.team3.service.TeacherService;

@Controller
@RequestMapping("/class")
public class ClassController {
	@Autowired
	ClassService classService;
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
							ClassVO cl,SubCategoryVO sc, 
							MultipartFile file) throws IOException {
		cl.setCl_tc_me_num(me_num);
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
