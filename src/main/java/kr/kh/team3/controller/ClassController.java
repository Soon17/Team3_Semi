package kr.kh.team3.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.kh.team3.model.vo.ClassVO;
import kr.kh.team3.service.ClassService;

@Controller
@RequestMapping("/class")
public class ClassController {
	@Autowired
	ClassService classService;
	
	@GetMapping("/categoryClass")
	public String categoryClass(Model model,@RequestParam("ca_num") int ca_num) {
		System.out.println(ca_num);
		List<ClassVO> list = classService.getCaClassList(ca_num);
		
		model.addAttribute("list",list);
		return "/categoryClass";
	}
}
