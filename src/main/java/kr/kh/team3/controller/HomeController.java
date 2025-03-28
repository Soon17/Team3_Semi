package kr.kh.team3.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.kh.team3.model.vo.CategoryVO;
import kr.kh.team3.service.CategoryService;
import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Log4j
@Controller
public class HomeController {
	
	@Autowired
	private CategoryService categoryService;
	
	@GetMapping("/")
	public String home(Model model) {
		List<CategoryVO> categoryList = categoryService.selectCateList();
		System.out.println(categoryList);
		model.addAttribute("list",categoryList);
		return "home";
	}
	
	@GetMapping("/login/from")
	public String loginForm() {
		return "/member/login";
	}

}
