package kr.kh.team3.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.kh.team3.model.vo.ClassVO;
import kr.kh.team3.service.ClassService;
import kr.kh.team3.service.CurriculumService;

@Controller
@RequestMapping("/class")
public class ClassController {
	@Autowired
	ClassService classService;
	
	@Autowired
	CurriculumService curriculumService;
	
	@GetMapping("/categoryClass")
	public String categoryClass(Model model,@RequestParam("ca_num") int ca_num) {
		System.out.println(ca_num);
		List<ClassVO> list = classService.getCaClassList(ca_num);
		
		model.addAttribute("list",list);
		return "/categoryClass";
	}
	@GetMapping("/{num}")
	public String classDetail(@PathVariable("num") int cl_num, Model model) {
	    ClassVO classDetail = classService.ClassDetail(cl_num);
	    model.addAttribute("classDetail", classDetail);
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
	
}